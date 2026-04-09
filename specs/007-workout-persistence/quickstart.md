# Quickstart: Workout Persistence

## Setup
1. Ensure `shared_preferences` is added to `pubspec.yaml`.
2. Run `flutter pub get`.

## Implementation Flow
1. **Model**: Implement `toJson()` and `fromJson()` in `Workout` class.
2. **Service**: Create `WorkoutService` to manage `SharedPreferences` instances and IO operations.
3. **Home Page**:
   - Instantiate `WorkoutService`.
   - Implement `_loadWorkouts()` called from `initState()`.
   - Trigger `_saveWorkouts()` after list modifications.

## Example Usage
```dart
final service = WorkoutService();
// Loading
final history = await service.loadWorkouts();
// Saving
await service.saveWorkouts(currentList);
```
