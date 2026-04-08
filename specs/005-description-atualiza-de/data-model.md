# Data Model: Workout

The `Workout` model is the central entity for this feature. It represents a single gym record.

## Entity: Workout (Domain Layer)

| Field | Type | Description |
|-------|------|-------------|
| id | String | Unique identifier (required for list reconciliation). |
| exerciseName | String | Name of the exercise. |
| load | double | Weight in kg. |
| repetitions | int | Number of reps. |
| date | DateTime | Date of the workout. |

## JSON Structure
Required for `shared_preferences` persistence.

```json
{
  "id": "uuid-v4",
  "exercise_name": "Supino",
  "load": 80.0,
  "repetitions": 10,
  "date": "2026-04-07T22:30:00Z"
}
```

## State Transitions
- **Create**: Result returned with a new `id`. `HomePage` adds it to the list.
- **Update**: Result returned with an existing `id`. `HomePage` replaces the existing entry.
