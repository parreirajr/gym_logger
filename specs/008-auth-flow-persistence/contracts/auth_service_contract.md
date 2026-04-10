# Auth Service Contract

## Class: `AuthService`

| Method | Description | Return Type |
|--------|-------------|-------------|
| `isLoggedIn()` | Checks if the user is currently authenticated in storage. | `Future<bool>` |
| `setLoggedIn(bool)` | Persists the current authentication state. | `Future<void>` |

## Usage
Upon successful login, call `setLoggedIn(true)`.
In `main.dart`, call `isLoggedIn()` to determine the initial route.
