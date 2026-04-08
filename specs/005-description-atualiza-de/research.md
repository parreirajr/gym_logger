# Research: Navigator Return and List Management

## Decision 1: Handling Navigator Return
- **Decision**: Use `await Navigator.pushNamed(context, routeName, arguments: ...)` if using named routes, or `await Navigator.push(...)` for direct page construction.
- **Rationale**: The constitution mandates Navigator 1.0. Awaiting the result allows the `HomePage` to react immediately without complex state synchronization.
- **Alternatives considered**: Passing a callback to the form. Rejected because awaiting the `push` future is the standard idiomatic way in Flutter for simple data returns.

## Decision 2: List Update Strategy
- **Decision**: 
  ```dart
  void _handleWorkoutResult(Workout? workout) {
    if (workout == null) return;
    setState(() {
      final index = workouts.indexWhere((w) => w.id == workout.id);
      if (index != -1) {
        workouts[index] = workout; // Update existing
      } else {
        workouts.add(workout); // Add new
      }
    });
  }
  ```
- **Rationale**: Efficient and readable. Using `id` from the model ensures we correctly identify if it's an edit or addition.
- **Alternatives considered**: Entirely reloading from storage. Rejected for now because local state update is faster; persistence will be handled separately (or as a side effect).

## Integration with Persistence
- **Decision**: Trigger a save to `shared_preferences` immediately after updating the list.
- **Rationale**: Ensures data integrity if the app is closed.
