# Research: Workout Form Implementation

## Decisions

### ID Generation
- **Decision**: Use `DateTime.now().millisecondsSinceEpoch.toString()`.
- **Rationale**: Minimalist approach that avoids adding external dependencies like `uuid`. Sufficient for local persistence in a mobile MVP where records are created sequentially by a single user.
- **Alternatives Considered**: `uuid` package (rejected for "no unnecessary dependencies" principle).

### Navigation & Data Return
- **Decision**: Use `Navigator.of(context).pushNamed` to open the form and `Navigator.pop(context, workout)` to return the result.
- **Rationale**: Follows the Navigator 1.0 standard mandated by the Constitution. Returning the object on `pop` is the idiomatic way to handle forms in Flutter without global state.

### Form State Management
- **Decision**: Use `TextEditingController` for each field inside a `StatefulWidget`.
- **Rationale**: Follows the "Local State ONLY" principle. Provides granular control over validation and pre-filling.

### UI Styling (Material 3)
- **Decision**: Use `TextField` with `InputDecoration` and `ButtonStyle`.
- **Rationale**:
  - Input Background: `fillColor: Color(0xFF1E1E1E), filled: true`.
  - Save Button: `backgroundColor: Color(0xFF7C4DFF)`.
  - These match the requirements and the existing visual identity of the app.

### Date Selection
- **Decision**: Use `showDatePicker` standard material function.
- **Rationale**: Best UX for mobile, consistent with Material 3, and requires no extra libraries.
