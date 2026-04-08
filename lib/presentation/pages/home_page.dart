import 'package:flutter/material.dart';
import '../../domain/models/workout_model.dart';
import '../widgets/workout_tile.dart';
import '../widgets/delete_confirmation_dialog.dart';
import '../routes.dart';
import '../../data/services/workout_storage_service.dart';

/// The main home screen of the GymLogger application.
///
/// Displays a scrollable list of recorded workouts stored in local state.
/// Exposes actions to add (FAB), edit, and delete individual entries.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Instance of the persistence service.
  final WorkoutStorageService _storageService = WorkoutStorageService();

  /// In-memory list of workouts.
  List<Workout> _workouts = [];

  @override
  void initState() {
    super.initState();
    _loadWorkouts();
  }

  /// Loads workouts from local storage on initialization.
  Future<void> _loadWorkouts() async {
    final workouts = await _storageService.loadWorkouts();
    setState(() {
      _workouts = workouts;
    });
  }

  /// Persists the current list of workouts to local storage.
  Future<void> _saveWorkouts() async {
    await _storageService.saveWorkouts(_workouts);
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
      setState(() {
        _workouts.removeWhere((w) => w.id == id);
      });
      _saveWorkouts();
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Treino removido com sucesso.'),
            duration: Duration(seconds: 2),
          ),
        );
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

    _handleWorkoutResult(result as Workout?);
  }

  /// Navigates to the workout form to create a new entry.
  Future<void> _navigateToCreateForm() async {
    final result = await Navigator.pushNamed(
      context,
      AppRoutes.workoutForm,
    );

    _handleWorkoutResult(result as Workout?);
  }

  /// Centralized logic to handle the result returned from the WorkoutFormPage.
  ///
  /// If [workout] is not null, it finds the existing item by [id] to update it,
  /// or adds it as a new entry if not found.
  void _handleWorkoutResult(Workout? workout) {
    if (workout == null) return;

    setState(() {
      final index = _workouts.indexWhere((w) => w.id == workout.id);
      if (index != -1) {
        // Update existing workout (Edition)
        _workouts[index] = workout;
      } else {
        // Add new workout at the top of the list (Addition)
        _workouts.insert(0, workout);
      }
    });

    _saveWorkouts();
  }


  // ──────────────────────────────────────────────
  // Build
  // ──────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MEUS TREINOS'),
      ),
      body: _workouts.isEmpty ? _buildEmptyState() : _buildWorkoutList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToCreateForm,
        backgroundColor: const Color(0xFF7C4DFF),
        tooltip: 'Adicionar treino',
        child: const Icon(Icons.add_rounded, color: Colors.white, size: 28),
      ),
    );
  }

  /// Renders the empty state when no workouts are recorded.
  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.list_alt_rounded,
            size: 100,
            color: Colors.white24,
          ),
          SizedBox(height: 24),
          Text(
            'Nenhum treino registrado ainda.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white54,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Toque no botão + para começar.',
            style: TextStyle(fontSize: 14, color: Colors.white38),
          ),
        ],
      ),
    );
  }

  /// Renders the scrollable list of [WorkoutTile] items.
  Widget _buildWorkoutList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: _workouts.length,
      itemBuilder: (context, index) {
        final workout = _workouts[index];
        return WorkoutTile(
          workout: workout,
          onEdit: () => _editWorkout(workout),
          onDelete: () => _deleteWorkout(workout.id),
        );
      },
    );
  }
}
