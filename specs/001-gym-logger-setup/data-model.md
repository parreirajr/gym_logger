# Data Model: GymLogger Exercise Record

**Feature**: [001-gym-logger-setup](file:///D:/Projetos%20J%C3%BAnior/gym_logger/specs/001-gym-logger-setup/spec.md)
**Status**: Preliminary Design

## Entity: ExerciseRecord

This model represents a single set of a gym exercise.

### Fields

- `id`: `String` (UUID/Required) - Unique identifier.
- `exercise`: `String` (Required) - Name of the activity.
- `loadKg`: `double` (Required) - Weight used in kg.
- `repetitions`: `int` (Required) - Number of units completed.
- `date`: `DateTime` (Required) - Timestamp of the record.

### Validation Rules

- `exercise`: Must not be empty.
- `loadKg`: Must be positive (> 0).
- `repetitions`: Must be positive (> 0).

### Methods

- `toJson()`: Map<String, dynamic>
- `fromJson(Map<String, dynamic> json)`: ExerciseRecord instance.
- `copyWith(...)`: Immutable copy helper.

## Relationships

- For this phase, all records are stored in a simple global list serialized to `shared_preferences`.
