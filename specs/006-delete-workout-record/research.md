# Research: Delete Workout Record Feature

**Status**: Complete
**Feature**: Delete Workout Record

## Research Tasks

### 1. Dialog Reusability
- **Goal**: Implement the deletion dialog as a reusable component.
- **Outcome**: A static method `DeleteConfirmationDialog.show(context)` is the most idiomatic way in Flutter to trigger a standardized dialog while keeping it decoupled from the page logic.

### 2. UI Theme (Dark Mode)
- **Goal**: Ensure the dialog matches the requested dark theme and action colors.
- **Outcome**: 
    - Use `showDialog` with a custom `AlertDialog`.
    - Set background color to dark (`#1E1E1E` or similar to match `WorkoutTile`).
    - Confirm button text color: `#E53935` (Strong Red).
    - Cancel button: Standard grey/white.

### 3. Home Page Integration
- **Goal**: Trigger the dialog and handle the result.
- **Outcome**:
    - `HomePage._deleteWorkout` will be updated to be `async`.
    - It will await the dialog result (boolean).
    - Only if `true` is returned, it will proceed with `removeWhere` and `_saveWorkouts`.

## Decisions

| Decision | Rationale | Alternatives Considered |
|----------|-----------|-------------------------|
| Reusable Dialog Class | Explicitly requested by user; improves maintainability. | Inline `showDialog` (Rejected: Not reusable). |
| Result-based flow | `await`ing a boolean result is cleaner than passing callbacks to the dialog. | Passing `onConfirm` callback to dialog (Rejected: Awaiting is more idiomatic for simple confirmations). |
| Static Helper | `DeleteConfirmationDialog.show()` is standard practice. | Creating a full instance (Rejected: Unnecessary for a simple alert). |

## Code Snippet (Preview)

```dart
static Future<bool> show(BuildContext context) async {
  return await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: const Color(0xFF1E1E1E),
      title: const Text('Confirmar Exclusão'),
      content: const Text('Tem certeza que deseja remover este treino?'),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancelar')),
        TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Excluir', style: TextStyle(color: Color(0xFFE53935)))),
      ],
    ),
  ) ?? false;
}
```
