# Implementation Plan: Auth Flow Persistence

**Branch**: `008-auth-flow-persistence` | **Date**: 2026-04-09 | **Spec**: [spec.md](file:///d:/Projetos%20J%C3%BAnior/gym_logger/specs/008-auth-flow-persistence/spec.md)
**Input**: Feature specification from `/specs/008-auth-flow-persistence/spec.md`

## Summary

Implement persistent authentication state using `shared_preferences`, a dedicated `AuthService`, and a logout feature in the `HomePage`. The app will check the login status at startup in `main.dart` and redirect the user accordingly (Home or Login).

## Technical Context

**Language/Version**: Flutter 3.x / Dart 3.x
**Primary Dependencies**: shared_preferences
**Storage**: shared_preferences (simple boolean storage)
**Testing**: flutter_test (Widget & Unit tests)
**Target Platform**: Mobile (Android/iOS)
**Project Type**: Mobile App
**Performance Goals**: Instant startup redirection (no UI flicker)
**Constraints**: No external state management, Navigator 1.0
**Scale/Scope**: Gym Logger Auth System (Persistence + Logout)

## Constitution Check

- [x] No external state management (Provider/Bloc)?
- [x] Layered architecture (presentation/domain/data)?
- [x] Navigator 1.0 used?
- [x] Material 3 applied?
- [x] Immutable models with toJson/fromJson?

## Project Structure

### Documentation (this feature)

```text
specs/008-auth-flow-persistence/
├── plan.md              # This file
├── research.md          # Implementation decisions
├── data-model.md        # Entities involved
├── quickstart.md        # How to use
├── contracts/           # API contracts
└── tasks.md             # To be generated
```

### Source Code (repository root)

```text
lib/
├── data/
│   └── services/
│       └── auth_service.dart     # [NEW]
├── main.dart                      # [MODIFY]
└── presentation/
    ├── app.dart                   # [MODIFY]
    ├── pages/
    │   ├── login_page.dart        # [MODIFY]
    │   └── home_page.dart         # [MODIFY]
```

## Proposed Changes

### [NEW] `auth_service.dart`
- Class `AuthService`.
- `static Future<bool> isLoggedIn()`: Read `'is_logged'` from `SharedPreferences`.
- `static Future<void> setLoggedIn(bool value)`: Write to `SharedPreferences`.

### [MODIFY] `main.dart`
- Make `main()` async.
- Determine `initialRoute` using `AuthService.isLoggedIn()`.
- Pass `initialRoute` to `GymLoggerApp`.

### [MODIFY] `app.dart`
- Update `GymLoggerApp` constructor to accept `initialRoute`.
- Pass `initialRoute` to `MaterialApp`.

### [MODIFY] `login_page.dart`
- Call `AuthService.setLoggedIn(true)` on successful validation before navigating.

### [MODIFY] `home_page.dart`
- Add a Logout button (`Icons.logout_rounded`) to the `AppBar`.
- Implement `_handleLogout` to clear auth state and redirect to `AppRoutes.root` using `pushReplacementNamed`.

## Verification Plan

### Automated Tests
- `test/unit/auth_service_test.dart`: Test persistence logic (isLogged/setLogged).
- `test/widget/auth_redirection_test.dart`: Test initial redirection flows.
- `test/widget/logout_test.dart`: Test that logout clears state and redirects.

### Manual Verification
1. Login successfully -> shows Home.
2. Restart app -> shows Home directly.
3. Click Logout on Home -> shows Login.
4. Restart app after logout -> shows Login.
