# Data Model: Workout

## Entity: Workout
Represents a single training session record.

| Field | Type | JSON Key | Validation |
|-------|------|----------|------------|
| id | String | `id` | Required, must be unique (UUID recommended). |
| exerciseName | String | `exercise_name` | Required, non-empty. |
| load | double | `load` | Required, positive value (kg). |
| repetitions | int | `repetitions` | Required, positive integer. |
| date | DateTime | `date` | Required, stored as ISO-8601 string. |

## Relationships
- None (isolated entity).

## State Transitions
- **Creation**: Initial recording of a set.
- **Update**: Modifying load or reps.
- **Deletion**: Permanent removal from storage.
