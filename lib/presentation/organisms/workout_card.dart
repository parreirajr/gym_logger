import 'package:flutter/material.dart';
import '../../domain/models/workout_model.dart';
import '../atoms/custom_text.dart';
import '../molecules/workout_info_row.dart';
import '../molecules/action_buttons_row.dart';

/// An organism that displays a complete workout entry as a themed card.
///
/// Composes [CustomText] for the title, [WorkoutInfoRow] molecules for
/// data display, and [ActionButtonsRow] for edit/delete actions.
/// Replaces the former `WorkoutTile` widget.
class WorkoutCard extends StatelessWidget {
  final Workout workout;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const WorkoutCard({
    super.key,
    required this.workout,
    required this.onEdit,
    required this.onDelete,
  });

  /// Formats a [DateTime] to a human-readable PT-BR date string (dd/MM/yyyy).
  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();
    return '$day/$month/$year';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1E1E1E),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 8, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Exercise name (highlighted)
            CustomText(
              text: workout.exerciseName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),

            // Load and repetitions row
            Row(
              children: [
                WorkoutInfoRow(
                  icon: Icons.fitness_center_rounded,
                  label: 'Carga',
                  value: '${workout.load.toStringAsFixed(1)} kg',
                ),
                const SizedBox(width: 12),
                WorkoutInfoRow(
                  icon: Icons.repeat_rounded,
                  label: 'Repetições',
                  value: '${workout.repetitions}',
                ),
              ],
            ),
            const SizedBox(height: 6),

            // Formatted date
            WorkoutInfoRow(
              icon: Icons.calendar_today_rounded,
              label: 'Data',
              value: _formatDate(workout.date),
            ),

            // Action buttons
            ActionButtonsRow(
              onEdit: onEdit,
              onDelete: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
