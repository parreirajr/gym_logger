# Tasks: SQLite Persistence Migration

**Input**: Design documents from `/specs/009-sqlite-persistence/`
**Prerequisites**: plan.md (required), spec.md (required for user stories)

## Phase 1: Setup & Architecture

- [x] T001 Add `sqflite` and `path` dependencies to `pubspec.yaml`
- [x] T002 Create `DatabaseHelper` singleton in `lib/data/database/database_helper.dart` with table creation script

## Phase 2: Foundational (Models & Data)

- [x] T003 Update `Workout` model in `lib/domain/models/workout_model.dart` with `toMap()` and `fromMap()` methods for SQLite
- [x] T004 Implement `WorkoutRepository` in `lib/data/repositories/workout_repository.dart` to perform CRUD via `DatabaseHelper`

## Phase 3: User Story 1 - Robust Workout Persistence (Priority: P1)

### Tests (Priority: P1)
- [x] T005 [P] [US1] Write unit tests for `WorkoutRepository` CRUD operations in `test/unit/repositories/workout_repository_test.dart`
- [x] T006 [P] [US1] Write unit tests for `Workout` model map serialization in `test/unit/models/workout_model_test.dart`

### Implementation
- [x] T007 [US1] Refactor `HomePage` (`lib/presentation/pages/home_page.dart`) to instantiate `WorkoutRepository` and fetch data asynchronously in `initState`
- [x] T008 [US1] Modify `_handleWorkoutResult` to use `repo.insertWorkout` and `repo.updateWorkout` in `HomePage`
- [x] T009 [US1] Modify deletion logic to use `repo.deleteWorkout` in `HomePage`
- [x] T010 [US1] Replace `shared_preferences` storage service usage with the new SQLite backend completely in presentation

## Phase 4: Navigation & Polish

- [x] T011 Handle loading states (e.g. `CircularProgressIndicator`) while database initializes and fetches in `HomePage`
- [x] T012 Ensure any database exceptions are safely caught and displayed to the user via `SnackBar`
