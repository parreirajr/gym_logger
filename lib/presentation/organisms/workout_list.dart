import 'package:flutter/material.dart';
import '../../domain/models/workout_model.dart';
import '../atoms/custom_text.dart';
import 'workout_card.dart';

/// An organism that renders a scrollable list of [WorkoutCard] items,
/// or an empty-state message when no workouts exist.
///
/// Handles the presentation of the workout collection including
/// the empty state with guidance text.
class WorkoutList extends StatelessWidget {
  final List<Workout> workouts;
  final void Function(Workout workout) onEdit;
  final void Function(String id) onDelete;

  const WorkoutList({
    super.key,
    required this.workouts,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (workouts.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: workouts.length,
      itemBuilder: (context, index) {
        final workout = workouts[index];
        return WorkoutCard(
          workout: workout,
          onEdit: () => onEdit(workout),
          onDelete: () => onDelete(workout.id),
        );
      },
    );
  }

  /// Renders the empty state when no workouts are recorded.
  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.list_alt_rounded, size: 100, color: Colors.white24),
          SizedBox(height: 24),
          CustomText(
            text: 'Nenhum treino registrado ainda.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white54,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          CustomText(
            text: 'Toque no botão + para começar.',
            style: TextStyle(fontSize: 14, color: Colors.white38),
          ),
        ],
      ),
    );
  }
}
