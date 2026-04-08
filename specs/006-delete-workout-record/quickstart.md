# Quickstart: Delete Workout Record

## Integration Steps

To integrate the deletion confirmation into a page:

1. **Import the widget**:
```dart
import '../widgets/delete_confirmation_dialog.dart';
```

2. **Update the deletion method**:
```dart
void _handleDelete(String id) async {
  final confirmed = await DeleteConfirmationDialog.show(context);
  if (confirmed) {
    // Perform deletion logic here
    setState(() {
      _items.removeWhere((item) => item.id == id);
    });
    _saveItems();
  }
}
```

3. **Verify UI**:
Ensure the "Excluir" button in the dialog uses the specific red color `#E53935`.
