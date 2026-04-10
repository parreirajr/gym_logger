import 'package:flutter/material.dart';

/// A molecule that displays Edit and Delete action buttons in a row.
///
/// Uses [TextButton.icon] for consistent styling with the workout card.
/// Edit uses the primary purple (#7C4DFF), Delete uses red accent.
class ActionButtonsRow extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ActionButtonsRow({
    super.key,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
