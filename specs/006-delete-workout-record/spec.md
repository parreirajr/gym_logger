# Feature Specification: Delete Workout Record

**Feature Branch**: `006-delete-workout-record`  
**Created**: 2026-04-08  
**Status**: Draft  
**Input**: User description: "Remoção de registros de treino. AlertDialog dark, ação destrutiva em vermelho (#E53935). Reuso de diálogo, Home Page atualizada."

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Remove Workout (Priority: P1)

As a user, I want to remove a workout from my list so that I can keep only the relevant records.

**Why this priority**: Core value for "Registro de Treinos" management.

**Independent Test**: Can be verified via widget test in `test/widget/home_page_test.dart`.

**Acceptance Scenarios**:

1. **Given** a workout in the list, **When** the user clicks the delete button and confirms in the dialog, **Then** the workout is removed from the list and storage, and the UI updates.
2. **Given** a workout in the list, **When** the user clicks the delete button and cancels in the dialog, **Then** the workout remains in the list and storage.

---

### Edge Cases

- **Empty List**: When the last workout is deleted, the "Empty List" state should be shown.
- **Dialog Cancellation**: Clicking outside the dialog or pressing the back button should not delete the record.

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: Use Material 3 design tokens and theme.
- **FR-002**: Confirmation MUST be via an `AlertDialog`.
- **FR-003**: The dialog MUST be dark-themed regardless of the global theme (as per instructions).
- **FR-004**: The destructive action (Delete) MUST use the specific red color: `#E53935`.
- **FR-005**: The dialog SHOULD be implemented as a reusable widget/static method.
- **FR-006**: Persistence MUST be updated in `shared_preferences` immediately.

### Key Entities

- **Workout**: The data object representing a training session.

## Success Criteria

- Confirmation dialog appears with dark theme and red "Delete" button.
- Item is only removed after user confirmation.
- The UI list updates without requiring a manual refresh.
- Data remains deleted after app restart.

## Assumptions

- The app already has a functional list of workouts on the Home Page.
- `shared_preferences` is used for persistence.
