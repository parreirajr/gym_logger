# Contract: WorkoutRepository

**Purpose**: Manage local CRUD operations for Workouts, abstracted via `DatabaseHelper`.

## Interfaces

```dart
abstract interface class WorkoutRepository {
  /// Inserts a new [Workout] record into the database.
  Future<void> insertWorkout(Workout workout);

  /// Retrieves all [Workout] records from the database.
  Future<List<Workout>> getWorkouts();

  /// Updates an existing [Workout] record matching the id.
  Future<void> updateWorkout(Workout workout);

  /// Deletes a [Workout] record matching the given id.
  Future<void> deleteWorkout(String id);
}
```

**Data Hand-off**:
- The UI layer passes `Workout` objects (or IDs).
- The Repository maps these inputs into SQLite operations.
- The Repository outputs `List<Workout>` for reading operations, masking any inner SQL Maps.

**Exceptions**:
- Propagates standard SQL `DatabaseException` on failure.
- Consumers of the Repository MUST wrap calls in `try/catch` blocks and display `SnackBar` feedback.
