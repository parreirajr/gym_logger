# Research: Auth Flow Persistence

## Decisions

### 1. Initialization and Redirection
- **Decision**: Determine initial route in `main()` before calling `runApp()`.
- **Rationale**: Prevents "screen flash" where the login page is momentarily visible before the app redirects to the home page.
- **Implementation**: `main()` will be asynchronous, initialize `shared_preferences` (via `AuthService`), and pass the determined route to `GymLoggerApp`.

### 2. AuthService Implementation
- **Decision**: Create a dedicated `AuthService` in `lib/data/services/auth_service.dart`.
- **Rationale**: Adheres to the "Architectural Separation" principle (Data layer).
- **Storage**: Use `shared_preferences` with the key `'is_logged'`.

### 3. Navigation Pattern
- **Decision**: Use `pushReplacementNamed` in `LoginPage` once login succeeds.
- **Rationale**: Ensures the login page is removed from the navigation stack, preventing the user from going back to it using the system back button.

## Alternatives Considered

| Alternative | Rationale for Rejection |
|-------------|-------------------------|
| Redirecting inside `LoginPage` | Causes a flicker of UI as the app loads the login page first. |
| Using `home` property with conditional logic | Conflicts with the existing named route architecture (`AppRoutes.routes`). |

## Dependencies
- `shared_preferences: ^2.2.2` (Already in `pubspec.yaml` based on previous features).
