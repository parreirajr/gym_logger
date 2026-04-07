# Quickstart: Workout List Development

## Objective
Implement the local, in-memory version of the Gym Logger Home Page (Workout List MVP). 

## Implementation Steps (Phase 1)
1. **Domain Creation**: Create the immutable `Workout` class inside `lib/domain/models/workout_model.dart`. Ensure it has `toJson` and `fromJson`.
2. **Widget Extration**: Build the `WorkoutTile` stateless widget within `lib/presentation/widgets/workout_tile.dart` following the dark theme specs (#1E1E1E).
3. **Screen Creation**: Replace the `HomePage` content in `lib/presentation/pages/home_page.dart` (which should be a `StatefulWidget`) with a `Scaffold` containing the `ListView.builder` and FAB.
4. **Local Integration**: Hook the `WorkoutTile` directly to an explicit `List<Workout> _workouts` managed by `HomePage`'s internal state.

## Testing Strategy
- Develop a comprehensive Widget Test (`test/widget/home_page_test.dart`) to assert logic correctness.
- Test scenarios: empty list rendering, mock data rendering, tap actions resolving correctly (i.e. deleting items reduces count on screen).
