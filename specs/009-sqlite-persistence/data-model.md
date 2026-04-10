# Entity Models

## Workout

_Immutable model representing a single gym workout record._

**Fields**:
- `id` (String): A mathematically unique UUID. Acts as the Primary Key.
- `exercise_name` (String): The name of the exercise performed.
- `load` (double): The weight lifted in kilograms.
- `repetitions` (int): Count of repetitions completed.
- `date` (DateTime): Chronological record of the workout.

**SQL Schema Equivalent**:
```sql
CREATE TABLE workouts (
  id TEXT PRIMARY KEY,
  exercise_name TEXT,
  load REAL,
  repetitions INTEGER,
  date TEXT
)
```

**Serializations**:
- Uses `fromMap(Map<String, dynamic> map)` to convert SQLite SQL row Maps back to strongly typed `Workout` objects.
- Uses `toMap()` to export the instance into a SQLite compatible `Map<String, Object?>`.
Note: The existing `fromJson` and `toJson` methods map natively to `fromMap` and `toMap` structures, as JSON maps are essentially identical to SQLite maps in Dart mapping logic. The date will be serialized as an ISO8601 string.

**State Transitions**:
- **Created**: Inserted as a new SQLite row using `Repository.insertWorkout()`.
- **Modified**: Updated over an existing SQLite row using `Repository.updateWorkout()`.
- **Deleted**: Removed from the SQLite table using `Repository.deleteWorkout()`.
