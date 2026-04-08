# Contracts: Delete Workout Record

## UI Contract: DeleteConfirmationDialog

The `DeleteConfirmationDialog` is a presentation utility that abstracts the confirmation logic.

### Interface

```dart
class DeleteConfirmationDialog {
  /// Shows a dark-themed confirmation dialog.
  /// 
  /// Returns [true] if the user confirms the deletion.
  /// Returns [false] if the user cancels or dismisses the dialog.
  static Future<bool> show(BuildContext context);
}
```

### Visual Specifications
- **Background**: `#1E1E1E` (Dark Grey)
- **Title**: 'Confirmar Exclusão'
- **Content**: 'Tem certeza que deseja remover este treino?'
- **Cancel Button**: Text 'Cancelar' (Standard style)
- **Confirm Button**: Text 'Excluir', Color `#E53935` (Strong Red)
