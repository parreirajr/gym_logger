# Quickstart: SQLite Persistence Migration

To set up and utilize the new SQLite persistence layer:

1. **Add Dependencies**: 
   Ensure `sqflite` and `path` are added to your `pubspec.yaml` and run `flutter pub get`.

2. **Initialize DatabaseHelper**:
   Create a singleton `DatabaseHelper` located at `lib/data/database/database_helper.dart`. It should initialize `gym_logger.db` locally.

3. **Use the Repository**:
   Instantiate or inject `WorkoutRepository` located at `lib/data/repositories/workout_repository.dart`.
   Replace all direct `shared_preferences` list encoding/decoding lines in UI layers with abstract API calls from the repository.

4. **Async CRUD Operations**:
   ```dart
   final repo = WorkoutRepository();
   
   // Create
   await repo.insertWorkout(newWorkout);
   
   // Read
   List<Workout> workouts = await repo.getWorkouts();
   
   // Update
   await repo.updateWorkout(updatedWorkout);
   
   // Delete
   await repo.deleteWorkout(workoutId);
   ```

5. **UI Loading State**:
   Always handle loading states in `HomePage` (e.g., using `CircularProgressIndicator`) while `getWorkouts()` completes during `initState`.
