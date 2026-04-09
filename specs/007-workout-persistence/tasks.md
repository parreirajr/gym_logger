# Tasks: Workout Persistence

**Input**: Design documents from `/specs/007-workout-persistence/`
**Prerequisites**: plan.md, spec.md

## Phase 1: Setup & Architecture

- [X] T001 Verify `shared_preferences` dependency in `pubspec.yaml`
- [X] T002 Run `flutter pub get` to ensure environment readiness

## Phase 2: Foundational (Models & Data)

- [X] T003 [P] Rename `WorkoutStorageService` to `WorkoutService` in `lib/data/services/workout_storage_service.dart` and move to `lib/data/services/workout_service.dart`
- [X] T004 [P] Update all imports of `workout_storage_service.dart` to `workout_service.dart` or new path

## Phase 3: User Story 1 - Data Persistence across Sessions (Priority: P1)

As a gym user, I want my workout history to be saved automatically so that I can close the app and see my records when I return.

### Tests (Priority: P1)
- [X] T005 [P] [US1] Create unit test for `Workout` model serialization in `test/unit/workout_model_test.dart`
- [X] T006 [P] [US1] Create unit test for `WorkoutService` with mocked `SharedPreferences` in `test/unit/workout_service_test.dart`

### Implementation
- [X] T007 [US1] Refactor `Workout` model in `lib/domain/models/workout_model.dart` to ensure `toJson` and `fromJson` match the spec
- [X] T008 [US1] Finalize `WorkoutService` implementation in `lib/data/services/workout_service.dart` with robust JSON encoding/decoding
- [X] T009 [US1] Update `HomePage` in `lib/presentation/pages/home_page.dart` to use `WorkoutService` for async loading in `initState`
- [X] T010 [US1] Ensure `_saveWorkouts()` is called after all state mutations (Addition, Edition, Deletion) in `home_page.dart`

## Phase 4: Verification & Polish

- [X] T011 Run all unit tests to verify persistence logic
- [X] T012 Manual verification: Add, Edit, Delete an item and restart the app
- [X] T013 Final code cleanup and compliance check with Constitution

## Dependencies

- Phase 2 must complete before Phase 3.
- T005 and T006 can run in parallel with T007 and T008.

## Implementation Strategy
- Incremental delivery: Implement serialization -> Service -> UI integration.
- Verification at each step with automated tests.
