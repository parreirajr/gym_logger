# Feature Specification: Workout Record Update and Navigation

**Feature Branch**: `005-workout-update`  
**Created**: 2026-04-07  
**Status**: Draft  
**Input**: User description: "Atualização de registros de treinos: Implementar navegação para WorkoutFormPage, receber retorno, atualizar lista (novo ou edição) e UI."

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Add a New Workout (Priority: P1)

As a user on the Home Page, I want to tap the FAB (Floating Action Button), navigate to the Workout Form, save a new workout, and see it immediately added to my list upon returning.

**Why this priority**: Fundamental flow for data entry in a logger app.

**Independent Test**: Can be verified via widget test in `test/presentation/pages/home_page_test.dart`.

**Acceptance Scenarios**:

1. **Given** the user is on HomePage, **When** they tap the add button, **Then** they are navigated to WorkoutFormPage.
2. **Given** the user saves a valid workout on WorkoutFormPage, **When** the navigator pops back to HomePage, **Then** the new workout appears at the end of the list.

---

### User Story 2 - Edit an Existing Workout (Priority: P1)

As a user, I want to tap an existing workout tile, navigate to the form with values pre-filled, edit them, save, and see the updated values in the list.

**Why this priority**: Essential for correcting mistakes or updating routine progress.

**Acceptance Scenarios**:

1. **Given** a workout in the list, **When** the user taps it, **Then** they are navigated to WorkoutFormPage with existing data.
2. **Given** the user modifies values and saves, **When** returning to HomePage, **Then** the existing item in the list is updated with new values.

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: `HomePage` navigation to `WorkoutFormPage` MUST use `Navigator.push`.
- **FR-002**: Navigation MUST return a `Workout` object or `null`.
- **FR-003**: If a `Workout` is returned:
    - If the `id` already exists in the current list, the item MUST be updated (replaced).
    - If the `id` does not exist, the item MUST be added to the list.
- **FR-004**: The UI MUST be updated using `setState` after the list modification.
- **FR-005**: The update logic MUST be isolated (e.g., in a dedicated method) for clarity.

### Key Entities

- **Workout**: The domain model containing `id`, `exerciseName`, `load`, `repetitions`, and `date`.

## Success Criteria

- New workouts are added to the list without duplicates.
- Edited workouts reflect changes immediately without adding new tiles.
- The UI remains responsive and consistent after updates.

## Assumptions

- Navigation is handled via `Navigator.push` (standard for return-value flows in this project's current state).
- The `Workout` model is immutable (uses `copyWith` or replacement in the list).
