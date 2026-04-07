# Data Model: Auth Credentials

**Feature**: user-login
**Last updated**: 2026-04-07

## LoginCredentials

Simple immutable model to encapsulate username and password inputs.

### Fields
| Name | Type | Key | Description |
| :--- | :--- | :---: | :--- |
| `username` | `String` | - | User input for login. |
| `password` | `String` | - | Password input for login. |

### Validation Rules
- `username` NOT empty.
- `password` NOT empty.
- Credentials matching: `username == 'admin'` AND `password == '1234'`.

### State Transitions
- **Idle**: No login attempt.
- **Validating**: Checking against hardcoded rules.
- **Success**: Navigation to `/home`.
- **Failure**: Display of `SnackBar` with "Credenciais inválidas".
