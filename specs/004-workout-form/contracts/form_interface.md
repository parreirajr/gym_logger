# Programmatic Interface: WorkoutFormPage

The `WorkoutFormPage` is accessed via the Navigator and returns a `Workout?` object.

## Input Parameters (Route Arguments)

| Argument | Type | Optional | Description |
|----------|------|----------|-------------|
| `workout` | `Workout` | Yes | If provided, the form opens in **Edition Mode** and pre-fills fields. |

## Access Pattern

```dart
final result = await Navigator.pushNamed(
  context,
  '/workout_form',
  arguments: existingWorkout, // null for creation
);

if (result != null && result is Workout) {
  // Handle success (save to state/persistence)
}
```

## Return Value

- `Workout`: The created or updated workout object.
- `null`: If the user cancels or goes back without saving.

## Interaction Flow

1. User triggers action (FAB or Edit button).
2. Navigation to `WorkoutFormPage`.
3. Validation occurs local to the form.
4. User clicks "Salvar" (Save).
5. `Navigator.pop(context, workoutInstance)` is called.
6. Parent page receives the object and updates current state.
