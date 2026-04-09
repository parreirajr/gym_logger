# Contract: WorkoutService

## Interface Definition

The `WorkoutService` provides a clean interface for the presentation layer to interact with local storage without knowing about `shared_preferences` or JSON serialization details.

### Methods

#### `Future<List<Workout>> loadWorkouts()`
- **Responsibility**: Fetches all saved workouts.
- **Return Value**: List of `Workout` objects. Empty list if none saved or on error.
- **Side Effects**: None.

#### `Future<void> saveWorkouts(List<Workout> workouts)`
- **Responsibility**: Overwrites the existing storage with the provided list.
- **Parameters**: `List<Workout> workouts` - the current full list of in-memory records.
- **Return Value**: `Future<void>`.
- **Side Effects**: Persists the serialized list to `shared_preferences`.

### Storage Format
- **Key**: `gym_logger_workouts`
- **Type**: String (JSON Encoded List of Objects)
