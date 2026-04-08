# Data Model: Workout

## Entity: Workout

Represents a single set of an exercise performed on a specific date.

| Field | Type | Validation | Description |
|-------|------|------------|-------------|
| `id` | String | Unique, Non-empty | Generated using milliseconds Since Epoch |
| `exerciseName` | String | Required, Min 1 char | Name of the exercise (e.g., Supino Reto) |
| `load` | Double | Required, > 0 | Weight used in kg |
| `repetitions` | Integer | Required, > 0 | Number of reps performed |
| `date` | DateTime | Required | Date the exercise was performed |

## Relationships
- **None**: For the MVP, workouts are independent records.

## State Transitions
- **Creation**: Blank form -> Populated fields -> Save -> New immutable object.
- **Editing**: Received object -> Pre-filled fields -> Modified fields -> Save -> New immutable object (retaining original ID).

## Persistence JSON Structure
```json
{
  "id": "1712534400000",
  "exercise_name": "Supino Reto",
  "load": 80.0,
  "repetitions": 10,
  "date": "2024-04-07T21:47:16.000Z"
}
```
