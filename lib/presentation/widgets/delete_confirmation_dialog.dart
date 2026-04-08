import 'package:flutter/material.dart';

/// A reusable dark-themed confirmation dialog for destructive actions.
///
/// Follows the Gym Logger visual identity:
/// - Dark background.
/// - Red action button for deletion.
/// - Material 3 design tokens.
class DeleteConfirmationDialog extends StatelessWidget {
  const DeleteConfirmationDialog({super.key});

  /// Shows the confirmation dialog and returns a [Future<bool>].
  ///
  /// Returns [true] if the user confirmed the action, [false] otherwise.
  static Future<bool> show(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          barrierDismissible: true,
          builder: (context) => const DeleteConfirmationDialog(),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF1E1E1E), // Dark theme background
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text(
        'Confirmar Exclusão',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      content: const Text(
        'Tem certeza que deseja remover este registro de treino? Esta ação não pode ser desfeita.',
        style: TextStyle(color: Colors.white70),
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      actions: [
        // Cancel action
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text(
            'Cancelar',
            style: TextStyle(color: Colors.white54),
          ),
        ),
        // Destructive delete action
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE53935), // Required Red color
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text('Excluir'),
        ),
      ],
    );
  }
}
