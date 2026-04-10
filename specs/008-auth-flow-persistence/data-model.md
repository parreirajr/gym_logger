# Data Model: Auth Flow Persistence

## Entities

### AuthStatus
- **Description**: Represents the current authentication state saved in local storage.
- **Fields**:
  - `is_logged`: Boolean (Persistent key: `is_logged`).

## Validation Rules
- `is_logged` defaults to `false` if not found in storage.
