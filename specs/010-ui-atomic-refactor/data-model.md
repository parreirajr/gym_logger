# UI Components Data Model (Atomic Design)

*Since this feature is a UI architecture refactoring, standard data domain models remain unchanged (`Workout`). Below is the structural model defining the Atomic UI components and their dependencies.*

## 1. Atoms Layer
Atoms have no dependencies on any other components. They only accept raw data, callbacks, and style definitions.

### `CustomText`
- **Props**: `String text`, `TextStyle? style`, `TextAlign? textAlign`, `int? maxLines`
- **Output**: Themed `Text` widget respecting standard colors.

### `CustomButton`
- **Props**: `String label`, `VoidCallback onPressed`, `bool isLoading`, `bool isDestructive`
- **Output**: Themed `ElevatedButton` or `FilledButton`.

### `CustomTextField`
- **Props**: `TextEditingController controller`, `String labelText`, `String? Function(String?)? validator`, `TextInputType keyboardType`
- **Output**: Themed `TextFormField`.

### `CustomIconButton`
- **Props**: `IconData icon`, `VoidCallback onPressed`, `Color? color`
- **Output**: Themed `IconButton`.

## 2. Molecules Layer
Molecules consist of a combination of atoms.

### `WorkoutInfoRow`
- **Components**: `CustomText` (Label), `CustomText` (Value)
- **Props**: `String label`, `String value`
- **Output**: A row presenting the label and value aligned.

### `FormFieldGroup`
- **Components**: `CustomText` (Group Title), `CustomTextField` (Input)
- **Props**: Form field configurations.

### `ActionButtonsRow`
- **Components**: `CustomIconButton` (Edit), `CustomIconButton` (Delete)
- **Props**: `VoidCallback onEdit`, `VoidCallback onDelete`

## 3. Organisms Layer
Organisms are distinct feature sections composed of molecules and atoms.

### `WorkoutCard`
- **Components**: `WorkoutInfoRow`, `ActionButtonsRow`
- **Props**: `Workout workout`, `VoidCallback onEdit`, `VoidCallback onDelete`
- **Output**: A comprehensive Card displaying a single workout safely handling the UI logic for expansion or taps.

### `WorkoutList`
- **Components**: `WorkoutCard`
- **Props**: `List<Workout> workouts`, Callback methods for edit/delete.

### `WorkoutForm`
- **Components**: `FormFieldGroup`, `CustomButton`
- **Props**: `Workout? initialWorkout`, `void Function(Workout) onSave`

## 4. Pages Layer
Pages provide the routing boundary and context state.

### `HomePage`
- Maintains list retrieval state.
- Employs `WorkoutList` and an `AppBar`.

### `LoginPage`
- Maintains authentication logic state (local).
- Employs `WorkoutForm` style elements scaled for Login.

### `WorkoutFormPage`
- Wrapper for routing to the `WorkoutForm`, obtaining args from Navigator.
