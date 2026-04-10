# Feature Specification: SQLite Persistence Migration

**Feature Branch**: `009-sqlite-persistence`  
**Created**: 2026-04-10  
**Status**: Draft  
**Input**: User description: "Implementar persistência de treinos utilizando SQLite (sqflite) no projeto GymLogger, substituindo a implementação atual em memória/shared_preferences."

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Robust Workout Persistence (Priority: P1)

As a gym-goer, I want my workout records to be saved in a reliable local database so that I don't lose my progress and can access my history even after restarting the app.

**Why this priority**: Core value for the application is reliable data tracking.

**Independent Test**: Can be verified via unit tests for the repository and integration tests for the database layer.

**Acceptance Scenarios**:

1. **Given** a new workout entry, **When** the user saves it, **Then** a new record is inserted into the SQLite `workouts` table.
2. **Given** existing records in the database, **When** the app starts, **Then** all records are loaded and displayed on the Home Page.
3. **Given** an existing workout, **When** the user edits its details, **Then** the corresponding record in SQLite is updated.
4. **Given** an existing workout, **When** the user deletes it, **Then** the record is removed from the SQLite table.

---

### Edge Cases

- **Database Initialization**: Ensure the database is created correctly on first run.
- **Schema Mismatch**: Handle cases where data format in DB doesn't match the Model (though unlikely for a new integration).
- **Concurrent Access**: While unlikely for a single-user app, ensure async operations are handled properly.
- **Empty State**: Correctly handle and display when the database is empty.

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: Add `sqflite` and `path` dependencies to `pubspec.yaml`.
- **FR-002**: Initialize a local database named `gym_logger.db`.
- **FR-003**: Create a table `workouts` with fields: `id` (TEXT PRIMARY KEY), `exercise_name` (TEXT), `load` (REAL), `repetitions` (INTEGER), `date` (TEXT).
- **FR-004**: Implement `DatabaseHelper` following the Singleton pattern for database access.
- **FR-005**: Update `Workout` model with `toMap()` and `fromMap()` methods.
- **FR-006**: Create `WorkoutRepository` to abstract SQLite operations from the rest of the app.
- **FR-007**: Refactor `HomePage` to use the new repository and load data in `initState`.
- **FR-008**: All persistence operations MUST be asynchronous using `async/await`.
- **FR-009**: All code identifiers (variables, methods, classes, database columns) MUST be in English. Portuguese is strictly reserved for text displayed in the UI.

### Key Entities

- **Workout**:
    - `id`: Unique identifier (UUID string).
    - `exercise_name`: Name of the exercise.
    - `load`: Weight load in kilograms (decimal).
    - `repetitions`: Number of repetitions (integer).
    - `date`: Date of the workout (stored as ISO8601 string).

## Success Criteria

- Workout data persists across app restarts using SQLite.
- CRUD functionality is fully operational without regressions.
- No database logic leaks into the UI layer.
- Code follows the project's layered architecture (presentation, domain, data).

## Assumptions

- We are replacing the `shared_preferences` persistence logic entirely.
- UUIDs are used for IDs to ensure uniqueness across the database.
- ISO8601 strings are used for dates in the database for better compatibility.
