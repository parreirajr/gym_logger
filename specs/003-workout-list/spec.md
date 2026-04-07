# Feature Specification: Workout List

**Feature Branch**: `003-workout-list`  
**Created**: 2026-04-07  
**Status**: Draft  

## User Scenarios & Testing *(mandatory)*

### User Story 1 - View Logged Workouts (Priority: P1)

As an authenticated user, I want to see a list of my logged workouts on the main screen so that I can track my exercise history.

**Why this priority**: Core value for "Registro de Treinos". It's the primary dashboard for the user.

**Acceptance Scenarios**:

1. **Given** the user lands on the Home Page, **When** they have recorded workouts, **Then** a scrollable list of workouts is displayed.
2. **Given** a workout in the list, **Then** its corresponding card clearly displays the exercise (highlighted), load and repetitions, formatted date, and distinct buttons to edit and delete the entry.
3. **Given** a list of workouts, **When** the user scrolls, **Then** the scrolling is smooth and functional.

### User Story 2 - Initiate Workout Addition (Priority: P1)

As an authenticated user, I need a clear way to add a new workout entry directly from the home screen.

**Why this priority**: Recording new entries is the foundational action of a logging app.

**Acceptance Scenarios**:

1. **Given** the user is on the Home Page, **Then** there is a prominent, primary action button available on the screen.
2. **Given** the primary action button, **When** the user observes it, **Then** it stands out using the primary brand color.

---

### Edge Cases

- No workouts logged yet (empty state rendering).
- Exceptionally long exercise names that might break the card layout.

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: The system must display all previously recorded workouts in a sequential list.
- **FR-002**: Each workout item must include actionable controls for editing and deleting the specific record.
- **FR-003**: A primary, persistent action must be provided to trigger the inclusion of new workout records.

### Non-Functional & UI Requirements

- **NFR-001**: The UI must be consistent with the application's overall dark theme.
- **NFR-002**: Workout cards must use the specific background color #1E1E1E.
- **NFR-003**: The primary inclusion button must use the specific color #7C4DFF.
- **NFR-004**: The system's underlying architecture must strictly separate the data representation from the interface representation.

### Key Entities

- **Workout**: 
  - `id`: Unique identifier
  - `exercicio`: Name of the gym exercise (Text)
  - `carga`: Weight load (Numeric)
  - `repeticoes`: Count of reps (Numeric)
  - `data`: Record date (Date/Time)

## Success Criteria

- The list of workouts renders correctly and handles overflow via scrolling.
- All action buttons (edit, delete, add) are clearly visible and accessible.
- The visual presentation perfectly matches the specified dark theme and color tokens.
- The underlying structure follows a clean separation between data models and reusable interface widgets.

## Assumptions

- For the MVP version, the list of workouts will be maintained in memory.
- The user is already authenticated and has been navigated to this page.
