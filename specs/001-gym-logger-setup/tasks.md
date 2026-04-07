# Tasks: GymLogger Initial Setup and Dark Theme

**Input**: Design documents from `/specs/001-gym-logger-setup/`
**Prerequisites**: [plan.md](file:///D:/Projetos%20J%C3%BAnior/gym_logger/specs/001-gym-logger-setup/plan.md) (required), [spec.md](file:///D:/Projetos%20J%C3%BAnior/gym_logger/specs/001-gym-logger-setup/spec.md) (required for user stories)

## Phase 1: Setup & Architecture

- [ ] T001 Initialize Flutter project directory structure (lib/data, lib/domain, lib/presentation/pages, lib/presentation/theme)
- [ ] T002 Update `pubspec.yaml` with `shared_preferences` dependency and environment constraints
- [ ] T003 [P] Create `ExerciseRecord` domain model in `lib/domain/exercise_record.dart` (Immutable + toJson/fromJson)

## Phase 2: Foundational (Theme & Routes)

- [ ] T004 [P] Implement `AppTheme` with Material 3 and custom dark colors in `lib/presentation/theme/app_theme.dart`
- [ ] T005 [P] Define named routes map in `lib/presentation/routes.dart`
- [ ] T006 Implement main app class `GymLoggerApp` in `lib/presentation/app.dart` with `MaterialApp` configuration

## Phase 3: User Story 1 - App Initialization and Navigation (Priority: P1)

Goal: App starts correctly on LoginPage and can navigate to HomePage placeholder.

### Tests (Priority: P1)
- [ ] T007 [P] [US1] Create widget test to verify `LoginPage` is initial route in `test/widget/app_navigation_test.dart`
- [ ] T008 [P] [US1] Create unit test for `ExerciseRecord` serialization in `test/unit/exercise_record_test.dart`

### Implementation
- [ ] T009 [US1] Create `LoginPage` as a `StatelessWidget` in `lib/presentation/pages/login_page.dart`
- [ ] T010 [US1] Create `HomePage` as a placeholder `StatelessWidget` in `lib/presentation/pages/home_page.dart`
- [ ] T011 [US1] Implement `main.dart` as the app entry point
- [ ] T012 [US1] Add login-to-home navigation trigger (e.g., button) in `lib/presentation/pages/login_page.dart`

## Phase 4: User Story 2 - Consistent Visual Identity (Priority: P1)

Goal: Ensure all screens strictly follow the #121212, #1E1E1E, #7C4DFF color scheme.

### Implementation
- [ ] T013 [US2] Apply `AppTheme.darkTheme` to `MaterialApp` in `lib/presentation/app.dart`
- [ ] T014 [US2] Verify `Scaffold` background and `AppBar` surfaces use #121212 and #1E1E1E
- [ ] T015 [US2] Style primary login button with #7C4DFF in `lib/presentation/pages/login_page.dart`

## Phase 5: Polish & Validation

- [ ] T016 Final visual check on Android/iOS/Web emulator
- [ ] T017 Remove any remaining boilerplate code or comments
- [ ] T018 Ensure all code is null-safe and follows Clean Code standards

## Dependencies
- Story 2 depends on Story 1 for screen availability.
- All implementation tasks depend on Phase 2 (Foundational) for theme/route constants.

## Parallel Execution
- T003, T004, and T005 can be implemented simultaneously.
- T007 and T008 (Tests) can be written before implementation (TDD).

## Implementation Strategy
- **MVP First**: Deliver Story 1 first to ensure the app boots and navigates.
- **Incremental Styling**: Apply the core theme as soon as the screens are created.
- **Stateless Priority**: Use `StatelessWidget` for this setup phase as no complex state is handled yet.
