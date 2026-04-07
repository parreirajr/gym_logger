# Data Model: Workout List

## Entity: `Workout`

The core domain entity representing a single set or complete workout exercise record.

**Location**: `lib/domain/models/workout_model.dart`

> **Naming Convention**: All code identifiers (class names, fields, methods, variables) MUST be written in **English**. Portuguese is reserved exclusively for UI display labels shown to the user.

### Fields

| Code Field | Type | Display Label (PT-BR) | Description | Validation |
|---|---|---|---|---|
| `id` | `String` | — | Unique identifier. | Required, system-generated (e.g., `DateTime.now().millisecondsSinceEpoch.toString()`). |
| `exerciseName` | `String` | "Exercício" | Name of the exercise. | Required, non-empty. |
| `load` | `double` | "Carga (kg)" | Weight lifted in kilograms. | Required, > 0. |
| `repetitions` | `int` | "Repetições" | Number of repetitions. | Required, > 0. |
| `date` | `DateTime` | "Data" | Date and time of the record. | Required. |

### JSON Key Mapping

To decouple the JSON storage format from code identifiers, use explicit key strings in `toJson`/`fromJson`:

| Code Field | JSON Key |
|---|---|
| `id` | `"id"` |
| `exerciseName` | `"exercise_name"` |
| `load` | `"load"` |
| `repetitions` | `"repetitions"` |
| `date` | `"date"` |

### Relationships & Traits
- Independent root entity.
- Must be strictly immutable (`final` properties).
- Will implement `toJson()` and `fromJson(Map<String, dynamic> json)` as mandated by the Constitution for persistence handling.
