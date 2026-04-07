# UI Contracts: Workout List Interactions

Because this is a local client application using Flutter without remote backend services for this MVP phase, instead of an API contract, we define the interaction parameters and callback contracts between the presentation layer boundaries.

## 1. Delete Contract
When the user clicks the "Delete" icon on a `WorkoutTile`.

**Action**: `onDelete(String id)`
- **Request Parameters**:
  - `id` (String): The unique identifier of the workout to be deleted.
- **Expected Outcome**: The specific item is removed from the in-memory array `List<Workout>`, and local state is rebuilt via `setState`.

## 2. Edit Contract
When the user clicks the "Edit" icon on a `WorkoutTile`.

**Action**: `onEdit(Workout workout)`
- **Request Parameters**:
  - `workout` (Workout): The entire workout object encapsulating its current state.
- **Expected Outcome**: Emits event upwards to presentation to open an editing environment (to be detailed in future specific task, currently a stub).

## 3. Add Contract
When the user taps the Floating Action Button.

**Action**: `onAddRequested()`
- **Expected Outcome**: Initiates the workflow to add a new workout entry (to be detailed in future form implementation, currently expected to add a mock item to the list for MVP testing).
