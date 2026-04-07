# Tasks: Workout List

**Input**: Design documents from `/specs/003-workout-list/`
**Prerequisites**: plan.md (required), spec.md (required for user stories)

> **Naming Convention**: All code identifiers (classes, fields, methods, variables) must be in **English**. Portuguese is reserved for UI display labels only.

## Phase 1: Setup & Architecture

- [X] T001 Convert `HomePage` from `StatelessWidget` to `StatefulWidget` in `lib/presentation/pages/home_page.dart`

## Phase 2: Foundational (Reusable Models & Widgets)

- [X] T002 [P] Create immutable `Workout` model with English fields (`id`, `exerciseName`, `load`, `repetitions`, `date`) and `toJson`/`fromJson` in `lib/domain/models/workout_model.dart`
- [X] T003 [P] Create reusable `WorkoutTile` widget with dark card (#1E1E1E), PT-BR display labels, and `onEdit`/`onDelete` callbacks in `lib/presentation/widgets/workout_tile.dart`

## Phase 3: User Story 1 – View Logged Workouts (Priority: P1)

### Goal
Allow the authenticated user to view a scrollable list of all recorded workouts on the Home Page.

### Independent Test Criteria
- Given mock workouts in state, the list renders one card per item.
- Given no workouts, an empty-state message is shown.
- Tapping the delete button on a card removes it from the list.
- The list is scrollable when items overflow the screen height.

### Implementation Tasks

- [X] T004 [P] [US1] Create widget test for `HomePage` list scenarios (renders list, shows empty state, delete reduces count) in `test/widget/home_page_test.dart`
- [X] T005 [US1] Add `List<Workout> _workouts` internal state to the `StatefulWidget` `HomePage` in `lib/presentation/pages/home_page.dart`
- [X] T006 [US1] Implement `ListView.builder` using `WorkoutTile`, wired to `_workouts` state in `lib/presentation/pages/home_page.dart`
- [X] T007 [US1] Implement `_deleteWorkout(String id)` method with `setState` in `lib/presentation/pages/home_page.dart`
- [X] T008 [US1] Implement `_editWorkout(Workout workout)` stub method (no-op for MVP) in `lib/presentation/pages/home_page.dart`
- [X] T009 [US1] Implement empty-state widget (icon + PT-BR message) when `_workouts` is empty in `lib/presentation/pages/home_page.dart`

## Phase 4: User Story 2 – Initiate Workout Addition (Priority: P1)

### Goal
Provide a prominent FloatingActionButton so the user can initiate adding a new workout entry.

### Independent Test Criteria
- FAB is visible on screen at all times.
- FAB uses color #7C4DFF.
- Tapping the FAB adds a placeholder `Workout` entry and causes the list to update.

### Implementation Tasks

- [X] T010 [P] [US2] Create widget test asserting FAB is present and tapping it adds an item to the list in `test/widget/home_page_test.dart`
- [X] T011 [US2] Implement `_addMockWorkout()` method that appends a hardcoded `Workout` to `_workouts` via `setState` in `lib/presentation/pages/home_page.dart`
- [X] T012 [US2] Wire FAB `onPressed` to `_addMockWorkout()` with backgroundColor `Color(0xFF7C4DFF)` in `lib/presentation/pages/home_page.dart`

## Phase 5: Polish & Integration

- [X] T013 Verify `WorkoutTile` date formatting uses a human-readable PT-BR format (e.g., `dd/MM/yyyy`) in `lib/presentation/widgets/workout_tile.dart`
- [X] T014 Final review: no logic inside `build()` methods, all identifiers in English, PT-BR labels only in display strings, across `home_page.dart` and `workout_tile.dart`
- [X] T015 Verify dark theme consistency: cards use `Color(0xFF1E1E1E)`, FAB uses `Color(0xFF7C4DFF)`, and no hardcoded light colors are present

---

## Dependencies

- Phase 1 must complete before Phase 3 and Phase 4.
- T002 (`Workout` model) and T003 (`WorkoutTile` widget) must complete before T004–T009.
- Phase 3 (US1) must complete before Phase 4 (US2) since the FAB result depends on the list rendering.
- All phases must complete before Phase 5 (Polish).

## Parallel Execution Examples

- **T002** & **T003**: Both are independent — model and widget have no mutual dependency.
- **T004** & **T005**: Test scaffolding (T004) can be written in parallel while state is added (T005).
- **T010** & **T011**: FAB test (T010) can be written alongside the `_addMockWorkout` method (T011).

## Implementation Strategy

- **MVP First**: T001 → T002 → T003 → T005 → T006 → T007 → T011 → T012 (core functional loop).
- **Refinement**: Add tests (T004, T010), empty state (T009), edit stub (T008), and polish (T013–T015) once the core flow works.
