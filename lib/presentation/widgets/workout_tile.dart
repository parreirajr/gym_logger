import 'package:flutter/material.dart';
import '../../domain/models/workout_model.dart';

/// Reusable card widget that displays a single [Workout] entry.
///
/// All UI labels are displayed in Portuguese (PT-BR) as per the project
/// naming convention. Callbacks use English identifiers.
class WorkoutTile extends StatelessWidget {
  final Workout workout;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const WorkoutTile({
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
            Text(
              workout.exerciseName,
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
                _InfoChip(
                  icon: Icons.fitness_center_rounded,
                  label: 'Carga: ${workout.load.toStringAsFixed(1)} kg',
                ),
                const SizedBox(width: 12),
                _InfoChip(
                  icon: Icons.repeat_rounded,
                  label: 'Repetições: ${workout.repetitions}',
                ),
              ],
            ),
            const SizedBox(height: 6),

            // Formatted date
            Row(
              children: [
                _InfoChip(
                  icon: Icons.calendar_today_rounded,
                  label: 'Data: ${_formatDate(workout.date)}',
                ),
              ],
            ),

            // Action buttons row
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: onEdit,
                  icon: const Icon(
                    Icons.edit_rounded,
                    size: 18,
                    color: Color(0xFF7C4DFF),
                  ),
                  label: const Text(
                    'Editar',
                    style: TextStyle(color: Color(0xFF7C4DFF)),
                  ),
                ),
                TextButton.icon(
                  onPressed: onDelete,
                  icon: const Icon(
                    Icons.delete_rounded,
                    size: 18,
                    color: Colors.redAccent,
                  ),
                  label: const Text(
                    'Excluir',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Internal helper widget for displaying a labelled info chip inside a [WorkoutTile].
class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: Colors.white54),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: Colors.white70),
        ),
      ],
    );
  }
}
