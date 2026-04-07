# Tasks: User Login

**Input**: Design documents from `/specs/002-user-login/`
**Prerequisites**: plan.md (required), spec.md (required for user stories)

## Phase 1: Setup & Architecture

- [X] T001 Create logic for authentication in `lib/domain/validators/login_validator.dart`
- [X] T002 Implement `LoginCredentials` model in `lib/domain/models/login_credentials.dart`

## Phase 2: Foundational (Reusable Widgets)

- [X] T003 [P] Create reusable `CustomTextField` in `lib/presentation/widgets/custom_text_field.dart`
- [X] T004 [P] Create reusable `CustomButton` in `lib/presentation/widgets/custom_button.dart`

## Phase 3: User Story 1 - Secure Access to GymLogger (Priority: P1)

### Goal
Allow the user to authenticate using the hardcoded credentials "admin" and "1234" to gain access to the application.

### Independent Test Criteria
- Successful login with "admin"/"1234" redirects to `/home`.
- Invalid login displays "Acesso negado" via `SnackBar`.
- Empty fields display specific error messages.
- Navigation history is cleared after login.

### Implementation Tasks
- [X] T005 [P] [US1] Create widget test for login scenarios in `test/widget/login_page_test.dart`
- [X] T006 [US1] Implement `LoginPage` as a `StatefulWidget` in `lib/presentation/pages/login_page.dart`
- [X] T007 [US1] Add `TextEditingController` for username and password in `lib/presentation/pages/login_page.dart`
- [X] T008 [US1] Build centralized layout with "GymLogger" title in `lib/presentation/pages/login_page.dart`
- [X] T009 [US1] Integrate `LoginValidator` into the login button callback in `lib/presentation/pages/login_page.dart`
- [X] T010 [US1] Implement `Navigator.pushReplacementNamed` to `/home` in `lib/presentation/pages/login_page.dart`
- [X] T011 [US1] Add error feedback using `ScaffoldMessenger.showSnackBar` in `lib/presentation/pages/login_page.dart`

## Phase 4: Polish & Integration

- [X] T012 Verify `LoginPage` adherence to the Dark Theme and primary color #7C4DFF
- [X] T013 Final review of code patterns: No inline logic in `build` and widget modularization

---

## Dependencies
- Phase 1 must be completed before Phase 3.
- Phase 2 can be developed in parallel with Phase 1.
- All tasks in Phase 3 must be completed before Phase 4.

## Parallel Execution Examples
- **T003** & **T004**: Both are independent UI components.
- **T005**: Can be updated as implementation progresses to maintain TDD.

## Implementation Strategy
- **MVP First**: Focus on the functional redirect (T001, T006, T009, T010).
- **Refinement**: Extract components (T003, T004) and add feedback (T011) once the core flow works.
