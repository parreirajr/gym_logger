# Tasks: Delete Workout Record

**Input**: Design documents from `/specs/006-delete-workout-record/`
**Prerequisites**: plan.md (required), spec.md (required for user stories)

## Phase 1: Setup & Architecture

- [x] T001 Initialize the widget file for the reusable dialog at `lib/presentation/widgets/delete_confirmation_dialog.dart`

## Phase 2: Foundational (Components)

- [x] T002 [P] Implement the `DeleteConfirmationDialog` widget with dark theme matching the app's visual identity in `lib/presentation/widgets/delete_confirmation_dialog.dart`
- [x] T003 [P] Configure the destructive action button (Delete) with the specific color `#E53935` in `lib/presentation/widgets/delete_confirmation_dialog.dart`
- [x] T004 [P] Implement the static `show` method to return a `Future<bool>` in `lib/presentation/widgets/delete_confirmation_dialog.dart`

## Phase 3: User Story 1 - Remove Workout (Priority: P1)

**Goal**: As a user, I want to remove a workout from my list so that I can keep only the relevant records.
**Independent Test**: Deletion only occurs after confirmation; "Cancelar" or dismissing the dialog preserves the record.

### Implementation
- [x] T005 [US1] Update imports in `lib/presentation/pages/home_page.dart` to include the new dialog
- [x] T006 [US1] Modify `_deleteWorkout(String id)` to be `async` in `lib/presentation/pages/home_page.dart`
- [x] T007 [US1] Implement `await DeleteConfirmationDialog.show(context)` within `_deleteWorkout` in `lib/presentation/pages/home_page.dart`
- [x] T008 [US1] Add logic to wrap the list removal and storage save in a conditional block based on confirmation in `lib/presentation/pages/home_page.dart`

## Phase 4: Polish & Performance

- [x] T009 Verify manual accessibility of the dialog (focus, contrast)
- [x] T010 Final check of status bar and background contrast during dialog presentation

## Dependencies
- US1 depends on Phase 2 (Foundational Components)

## Parallel Execution Examples
- T002, T003 can be worked on concurrently as they relate to the dialog UI.
- Dialog implementation (T002-T004) can be done separately from HomePage integration (T005-T008).

## Implementation Strategy
- Priority 1: Create the dialog widget.
- Priority 2: Integrate into HomePage.
- Minimal scope: Functional deletion with confirmation dialog.
