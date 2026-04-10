import 'package:flutter/material.dart';
import '../../domain/models/workout_model.dart';
import '../organisms/workout_list.dart';
import '../organisms/delete_confirmation_dialog.dart';
import '../routes.dart';
import '../../data/repositories/workout_repository.dart';
import '../../data/services/auth_service.dart';

/// The main home screen of the GymLogger application.
///
/// Displays a scrollable list of recorded workouts stored in SQLite.
/// Exposes actions to add (FAB), edit, and delete individual entries.
/// Delegates all list/card rendering to the [WorkoutList] organism.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Instance of the SQLite persistence repository.
  final WorkoutRepository _repository = WorkoutRepositoryImpl();

  /// In-memory list of workouts matching DB records.
  List<Workout> _workouts = [];

  /// Controls the loading state during DB fetch
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadWorkouts();
  }

  /// Loads workouts from local SQLite storage on initialization.
  Future<void> _loadWorkouts() async {
    try {
      final workouts = await _repository.getWorkouts();
      if (mounted) {
        setState(() {
          _workouts = workouts;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        _showErrorSnackBar('Erro ao carregar treinos.');
      }
    }
  }

  /// Clears the authentication session and returns to the login screen.
  Future<void> _handleLogout() async {
    await AuthService.setLoggedIn(false);
    if (mounted) {
      Navigator.pushReplacementNamed(context, AppRoutes.root);
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // ──────────────────────────────────────────────
  // Business logic methods (no logic inside build)
  // ──────────────────────────────────────────────

  /// Removes the workout with the given [id] from the local list.
  ///
  /// Displays a confirmation dialog before proceeding with the deletion.
  Future<void> _deleteWorkout(String id) async {
    final confirmed = await DeleteConfirmationDialog.show(context);

    if (confirmed) {
      final workoutIndex = _workouts.indexWhere((w) => w.id == id);
      final removedWorkout = _workouts[workoutIndex];

      setState(() {
        _workouts.removeAt(workoutIndex);
      });

      try {
        await _repository.deleteWorkout(id);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Treino removido com sucesso.'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } catch (e) {
        // Rollback state if DB fails
        setState(() {
          _workouts.insert(workoutIndex, removedWorkout);
        });
        if (mounted) {
          _showErrorSnackBar('Falha ao deletar: $e');
        }
      }
    }
  }

  /// Navigates to the workout form to edit an existing [workout].
  Future<void> _editWorkout(Workout workout) async {
    final result = await Navigator.pushNamed(
      context,
      AppRoutes.workoutForm,
      arguments: workout,
    );

    await _handleWorkoutResult(result as Workout?);
  }

  /// Navigates to the workout form to create a new entry.
  Future<void> _navigateToCreateForm() async {
    final result = await Navigator.pushNamed(context, AppRoutes.workoutForm);

    await _handleWorkoutResult(result as Workout?);
  }

  /// Centralized logic to handle the result returned from the WorkoutFormPage.
  ///
  /// Updates local state optimistically, then persists via SQLite.
  /// Reverts and shows error if save fails.
  Future<void> _handleWorkoutResult(Workout? workout) async {
    if (workout == null) return;

    final index = _workouts.indexWhere((w) => w.id == workout.id);
    Workout? originalWorkout;

    setState(() {
      if (index != -1) {
        originalWorkout = _workouts[index];
        _workouts[index] = workout;
      } else {
        _workouts.insert(0, workout);
      }
    });

    try {
      if (index != -1) {
        await _repository.updateWorkout(workout);
      } else {
        await _repository.insertWorkout(workout);
      }
    } catch (e) {
      // Revert on failure
      setState(() {
        if (index != -1) {
          _workouts[index] = originalWorkout!;
        } else {
          _workouts.removeAt(0);
        }
      });
      if (mounted) {
        _showErrorSnackBar('Erro ao salvar no banco de dados: $e');
      }
    }
  }

  // ──────────────────────────────────────────────
  // Build
  // ──────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MEUS TREINOS'),
        actions: [
          IconButton(
            onPressed: _handleLogout,
            icon: const Icon(Icons.logout_rounded),
            tooltip: 'Sair',
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: Color(0xFF7C4DFF)),
            )
          : WorkoutList(
              workouts: _workouts,
              onEdit: _editWorkout,
              onDelete: _deleteWorkout,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToCreateForm,
        backgroundColor: const Color(0xFF7C4DFF),
        tooltip: 'Adicionar treino',
        child: const Icon(Icons.add_rounded, color: Colors.white, size: 28),
      ),
    );
  }
}
