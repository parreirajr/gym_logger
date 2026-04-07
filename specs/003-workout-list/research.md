# Research & Decisions: Workout List

## 1. Storage Backend for MVP
**Decision**: In-memory list (`List<Workout>`) within the `HomePage`'s State.
**Rationale**: The initial MVP specification explicitly requires establishing the UI and testing the listing interactions via an in-memory structure before integrating persistent storage (as outlined in the Constitution using `shared_preferences`). This allows us to rapidly prototype the UI and layout.
**Alternatives considered**: Proceeding directly to `shared_preferences` (rejected to maintain parity with the exact feature spec scope, which is limited to rendering the UI layout and an in-memory list first).

## 2. Widget Modularity
**Decision**: Extract the item view into a separate `WorkoutTile` widget and standard model `Workout`.
**Rationale**: Required by the Constitution to prevent logic from accumulating inside `build` methods and ensuring separation of concerns. `WorkoutTile` allows isolated testing.
**Alternatives considered**: Inline layout in `ListView.builder` (rejected due to Constitution rules).

## 3. Theming & Colors
**Decision**: Hardcode the specified tokens (#1E1E1E, #7C4DFF) directly into the widgets or rely on a centralized Flutter Theme if available, applying Material 3 properties.
**Rationale**: Fast and explicitly conforms to visual requirements.
**Alternatives considered**: Building a robust parsing token system (too complex for MVP).
