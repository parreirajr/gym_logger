# Data Model: Delete Workout Record

This feature utilizes the existing `Workout` model. No modifications are required to the domain layer.

## Entities

### Workout (Existing)
| Field | Type | Description |
|-------|------|-------------|
| id | String | Unique identifier |
| exerciseName | String | Name of the exercise |
| load | double | Weight in kg |
| repetitions | int | Number of reps |
| date | DateTime | Date of the record |
