# Feature Specification: Auth Flow Persistence

**Feature Branch**: `008-auth-flow-persistence`  
**Created**: 2026-04-09  
**Status**: Draft  
**Input**: User description: "Implement persistent authentication state, redirection, and logout functionality."

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Persistence of Login State (Priority: P1)
As a returning user, I want the app to remember my login status so that I don't have to enter my credentials every time I open the app.

### User Story 2 - Logout Functionality (Priority: P2)
As a user, I want to be able to log out from the app so that my account remains secure and I can log in with different credentials if needed.

**Why this priority**: Essential security and account management feature.

**Independent Test**: Can be verified via widget test in `test/widget/logout_test.dart`.

**Acceptance Scenarios**:

1. **Given** no saved login state, **When** app starts, **Then** it shows the Login Page.
2. **Given** a successfully saved login state, **When** app starts, **Then** it shows the Home Page directly.
3. **Given** user is on Home Page, **When** user clicks Logout, **Then** state is cleared and user is redirected to Login Page.
4. **Given** user is on Home Page after login, **When** user tries to navigate back, **Then** they do not return to the Login Page.

---

### Edge Cases

- Clearing app data removes the login state.
- Errors reading from `shared_preferences` should default to showing the Login Page.

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: Implement `AuthService` to handle authentication state persistence using `shared_preferences`.
- **FR-002**: Redirection flow must be evaluated at app startup before rendering the initial screen.
- **FR-003**: Navigation must strictly use `Navigator.pushReplacementNamed` to avoid stack back-flow.
- **FR-004**: Auth logic (credentials check, state storage) must be isolated from UI classes.
- **FR-005**: Add an "Exit" or "Logout" icon button to the `HomePage` AppBar.
- **FR-006**: Logout must clear the persistent state and redirect immediately to the Login screen.

### Key Entities

- **AuthStatus**: Boolean flag stored in `shared_preferences` as `is_logged`.

## Success Criteria

- App opens Home Page if `is_logged` is true.
- Back-navigation from Home Page never returns to Login.
- Logout button successfully returns user to Login and prevents auto-login on restart.

## Assumptions

- We will continue using the hardcoded credentials (admin/1234) for now.
- Persistence is handled locally via `shared_preferences`.
