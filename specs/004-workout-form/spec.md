# Feature Specification: Workout Form (Creation & Edition)

**Feature Branch**: `004-workout-form`  
**Created**: 2026-04-07  
**Status**: Draft  
**Input**: User description: "Cadastro de treinos (exercício, carga, repetições, data). Criar página form (WorkoutFormPage). Campos: exercício, carga, repetições, data. Receber Workout opcional (edição). Se item existir → preencher campos. Ao salvar: Retornar workout via Navigator.pop. Diferenciar modo criação vs edição. Identidade Visual: Inputs com fundo #1E1E1E, Botão principal com cor #7C4DFF."

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Create a new workout (Priority: P1)

As an athlete, I want to record my workout details so that I can track my progress.

**Why this priority**: Core value for "Gym Logger". Essential for data entry.

**Independent Test**: Can be verified via widget test in `test/widget/workout_form_page_test.dart`.

**Acceptance Scenarios**:

1. **Given** the user is on the WorkoutFormPage in creation mode, **When** they fill "Supino", "80", "10", and a date, and press "Save", **Then** the page pops and returns a new `Workout` object with these values.
2. **Given** the user is on the WorkoutFormPage, **When** they leave mandatory fields empty and press "Save", **Then** validation errors are shown on the inputs.

---

### User Story 2 - Edit an existing workout (Priority: P2)

As an athlete, I want to correct or update my recorded workouts.

**Why this priority**: Correcting mistakes is a fundamental user need.

**Acceptance Scenarios**:

1. **Given** an existing Workout object is passed to the form, **When** the page opens, **Then** all fields are pre-filled with the workout data.
2. **Given** the user modifies "load" from "80" to "85" and saves, **When** the page pops, **Then** the returned `Workout` object has the same ID but the updated load value.

---

### Edge Cases

- **Invalid Load/Reps**: Ensure only positive numbers are accepted for load and repetitions.
- **Future Dates**: Depending on requirements, we might want to restrict or allow future dates (Assumed: allow for now, but usually restricted in gym trackers).
- **Empty Exercise Name**: Exercise name MUST be provided and not just whitespace.

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: Use Material 3 design tokens and components.
- **FR-002**: Inputs MUST use a specific background color `#1E1E1E`.
- **FR-003**: The primary save button MUST use the color `#7C4DFF`.
- **FR-004**: The form MUST handle both "Creation" and "Edition" modes based on whether a `Workout` object is provided.
- **FR-005**: Upon successful save, the form MUST use `Navigator.pop(context, workout)` to return the result.
- **FR-006**: Form validation MUST prevent saving if data is invalid (e.g., empty names, negative numbers).
- **FR-007**: Date selection MUST be intuitive (Date picker or consistent input format).

### Key Entities

- **Workout**:
    - `id`: Unique identifier (UUID generated if new).
    - `exerciseName`: String (e.g., "Supino").
    - `load`: Double (e.g., 85.0).
    - `repetitions`: Integer (e.g., 12).
    - `date`: DateTime.

## Success Criteria

- UI matches the visual specifications (Dark theme consistent with provided hex codes).
- Data is correctly returned to the calling page (Home Page).
- Errors are clearly communicated when the form is invalid.
- Form pre-fills correctly when in edition mode.

## Assumptions

- UUID generation will be used for new records if not provided.
- The UI follows a strict dark theme established in the project.
- No remote API integration needed; pure business logic and UI return.
