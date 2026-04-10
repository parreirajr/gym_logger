# Quickstart: Auth Flow Persistence

## 1. Initial Route Detection
In `main.dart`, wait for `isLoggedIn()` to decide where to start.

```dart
final isLoggedIn = await AuthService.isLoggedIn();
final initialRoute = isLoggedIn ? AppRoutes.home : AppRoutes.root;
```

## 2. Persisting Auth State
In `LoginPage`, update the state after successful authentication.

```dart
if (isValidCrendetials) {
  await AuthService.setLoggedIn(true);
  Navigator.pushReplacementNamed(context, AppRoutes.home);
}
```

## 3. AuthService Class Definition
Located at `lib/data/services/auth_service.dart`.
Uses `shared_preferences` with `is_logged` key.
