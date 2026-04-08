import 'package:flutter/material.dart';
import '../../domain/models/workout_model.dart';
import '../widgets/workout_tile.dart';
import '../routes.dart';

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
  /// In-memory list of workouts. Will be replaced by persistent storage in a
  /// future iteration using shared_preferences (as planned in research.md).
  final List<Workout> _workouts = [];

  // ──────────────────────────────────────────────
  // Business logic methods (no logic inside build)
  // ──────────────────────────────────────────────

  /// Removes the workout with the given [id] from the local list.
  void _deleteWorkout(String id) {
    setState(() {
      _workouts.removeWhere((w) => w.id == id);
    });
  }

  /// Navigates to the workout form to edit an existing [workout].
  Future<void> _editWorkout(Workout workout) async {
    final result = await Navigator.pushNamed(
      context,
      AppRoutes.workoutForm,
      arguments: workout,
    );

    if (result != null && result is Workout) {
      setState(() {
        final index = _workouts.indexWhere((w) => w.id == workout.id);
        if (index != -1) {
          _workouts[index] = result;
        }
      });
    }
  }

  /// Navigates to the workout form to create a new entry.
  Future<void> _navigateToCreateForm() async {
    final result = await Navigator.pushNamed(
      context,
      AppRoutes.workoutForm,
    );

    if (result != null && result is Workout) {
      setState(() {
        _workouts.insert(0, result); // Add newest at the top
      });
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
