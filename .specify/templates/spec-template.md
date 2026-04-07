# Feature Specification: [FEATURE NAME]

**Feature Branch**: `[###-feature-name]`  
**Created**: [DATE]  
**Status**: Draft  
**Input**: User description: "$ARGUMENTS"

## User Scenarios & Testing *(mandatory)*

### User Story 1 - [Brief Title] (Priority: P1)

[Describe this user journey in plain language]

**Why this priority**: Core value for "Registro de Treinos".

**Independent Test**: Can be verified via widget test in `test/widget/`.

**Acceptance Scenarios**:

1. **Given** exercise data, **When** user saves, **Then** it persists in shared_preferences.
2. **Given** empty fields, **When** user saves, **Then** error SnackBar is shown.

---

### Edge Cases

- Database/Preferences corruption handling.
- Input validation for non-numeric weight/reps.

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: Use Material 3 design tokens.
- **FR-002**: Navigation MUST follow Navigator 1.0 (Named routes).
- **FR-003**: Persistence MUST use JSON serialization to `shared_preferences`.
- **FR-004**: No external state management allowed.
- **FR-005**: All domain models MUST include `toJson`/`fromJson`.

### Key Entities

- **Exercise**: Name of the gym exercise.
- **Load**: Weight in kg (Numeric).
- **Repetitions**: Count of reps (Numeric).
- **Date**: Record date (DateTime).

## Success Criteria

- UI matches Material 3.
- Data persists across app restarts.
- Clear error feedback for invalid inputs.

## Assumptions

- Offline-only persistence for MVP.
- Mobile-first (Portrait mode prioritize).
