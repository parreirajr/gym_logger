# Research: Workout Persistence

## Decision: Data Architecture for Persistence
**Chosen**: `SharedPreferences` with JSON serialization.
**Rationale**: Explicitly required by the project constitution (Rule VI) and the feature request. It provides a simple, dependency-light way to persist lists of small objects like workouts.

## Decision: Service Naming
**Chosen**: `WorkoutService`.
**Rationale**: The user explicitly requested `workout_service.dart`. While the existing file is `workout_storage_service.dart`, we will align with the requested name to ensure user satisfaction and consistency with the provided instructions.

## Decision: Initialization Strategy
**Chosen**: Async loading in `initState` of `HomePage`.
**Rationale**: Since `SharedPreferences` is an async API, we must load the data before the list can be displayed. A `setState` update once the data is fetched is the most direct approach given the "No External State Management" constraint (Constitution Rule II).

## Alternatives Considered
- **SQLite (sqflite)**: Rejected. Too complex for simple workout logging and violates the Constitution's preference for `shared_preferences`.
- **File-based Storage**: Rejected. Manual file handling in Dart/Flutter is more error-prone than `shared_preferences` for key-value (or key-string) pairs.

## Dependency Check
| Dependency | Usage | Justification |
|------------|-------|---------------|
| `shared_preferences` | Local persistence | Standard project-wide decision for local storage. |
| `dart:convert` | JSON Encoding/Decoding | Required for serializing `Workout` objects. |
