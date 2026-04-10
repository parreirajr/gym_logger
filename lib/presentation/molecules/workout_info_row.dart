import 'package:flutter/material.dart';
import '../atoms/custom_text.dart';

/// A molecule that displays an icon + label-value pair in a row.
///
/// Composes [CustomText] atoms. Used to display workout properties
/// such as load, repetitions, and date inside cards.
class WorkoutInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const WorkoutInfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: Colors.white54),
        const SizedBox(width: 4),
        CustomText(
          text: '$label: $value',
          style: const TextStyle(fontSize: 13, color: Colors.white70),
        ),
      ],
    );
  }
}
