# Tasks: Workout Form (Creation & Edition)

**Input**: Design documents from `/specs/004-workout-form/`
**Prerequisites**: plan.md (required), spec.md (required for user stories)

## Phase 1: Setup

- [ ] T001 Register named route `/workout_form` in `lib/main.dart` following Navigator 1.0 patterns.

## Phase 2: Foundational

- [ ] T002 Create initial widget test file `test/widget/workout_form_page_test.dart` with basic field presence checks.

## Phase 3: User Story 1 - Create a new workout (Priority: P1)

Goal: Allow users to input workout data and return a new `Workout` object.

### Tests (Priority: P1)
- [ ] T003 [P] [US1] Implement widget test for creation flow: fill fields -> press save -> verify pop data in `test/widget/workout_form_page_test.dart`.
- [ ] T004 [P] [US1] Implement validation tests: empty fields -> press save -> verify error messages in `test/widget/workout_form_page_test.dart`.

### Implementation
- [ ] T005 [US1] Create scaffold for `WorkoutFormPage` in `lib/presentation/pages/workout_form_page.dart` using `StatefulWidget`.
- [ ] T006 [US1] Implement Exercise Name `TextFormField` with background color `#1E1E1E`.
- [ ] T007 [US1] Implement Load `TextFormField` (keyboard type: decimal) with background color `#1E1E1E`.
- [ ] T008 [US1] Implement Repetitions `TextFormField` (keyboard type: number) with background color `#1E1E1E`.
- [ ] T009 [US1] Implement Date selection field with `showDatePicker` and background color `#1E1E1E`.
- [ ] T010 [US2] Implement "Salvar" (Save) button with background color `#7C4DFF` and white text.
- [ ] T011 [US1] Implement `Form` validation logic (name not empty, load/reps > 0).
- [ ] T012 [US1] Implement save logic using `Navigator.pop(context, newWorkoutObject)`.

## Phase 4: User Story 2 - Edit an existing workout (Priority: P2)

Goal: Allow users to pre-fill the form with existing data and return the modified object.

### Tests (Priority: P2)
- [ ] T013 [P] [US2] Implement widget test for edition flow: receive workout -> verify filled fields -> modify -> verify pop updated data in `test/widget/workout_form_page_test.dart`.

### Implementation
- [ ] T014 [US2] Implement logic to extract `Workout` from `ModalRoute.of(context)?.settings.arguments` in `WorkoutFormPage`.
- [ ] T015 [US2] Implement pre-filling logic for all fields in `initState` or using controllers.
- [ ] T016 [US2] Ensure the returned workout from edit mode retains the original ID.

## Phase 5: Integration & Polish

- [ ] T017 Update `HomePage` FAB in `lib/presentation/pages/home_page.dart` to navigate to `/workout_form` and add the result to the list.
- [ ] T018 Update `HomePage` edit action in `lib/presentation/pages/home_page.dart` to navigate to `/workout_form` with arguments and update the list item.
- [ ] T019 Final visual audit: ensure Material 3 standards, spacing, and accessibility (labels, hints) match the design vision.

## Dependencies
- US2 depends on US1 (Form reuse).
- Phase 5 depends on US1 and US2 implementation.

## Parallel Execution Examples
- [US1] UI Fields (T006-T009) can be developed in parallel if split into sub-widgets.
- [US1] Tests (T003-T004) can be developed in parallel with UI implementation.

## Implementation Strategy
- **Step 1**: Basic form UI with mock return (Phase 3).
- **Step 2**: Add validation and date picker (Phase 3).
- **Step 3**: Implement edition mode logic (Phase 4).
- **Step 4**: Integrate with Home page and refine (Phase 5).
