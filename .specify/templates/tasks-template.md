---
description: "Task list template for Gym Logger feature implementation"
---

# Tasks: [FEATURE NAME]

**Input**: Design documents from `/specs/[###-feature-name]/`
**Prerequisites**: plan.md (required), spec.md (required for user stories)

## Phase 1: Setup & Architecture

- [ ] T001 Initialize Flutter project structure (lib/data, lib/domain, lib/presentation)
- [ ] T002 Add dependencies: `shared_preferences`
- [ ] T003 Configure Material 3 theme in `main.dart`

## Phase 2: Foundational (Models & Data)

- [ ] T004 Create `ExerciseModel` in `lib/domain/models/` (Immutable + toJson/fromJson)
- [ ] T005 Implement `LocalDataService` in `lib/data/services/` (shared_preferences + JSON)

## Phase 3: User Story 1 - [Title] (Priority: P1)

### Tests (Priority: P1)
- [ ] T006 [P] [US1] Unit test for model serialization in `test/unit/`
- [ ] T007 [P] [US1] Widget test for input form in `test/widget/`

### Implementation
- [ ] T008 [US1] Create [ScreenName] using `StatefulWidget` in `lib/presentation/screens/`
- [ ] T009 [US1] Implement input validation for Exercise, Load, and Reps
- [ ] T010 [US1] Connect UI to `LocalDataService`
- [ ] T011 [US1] Show success SnackBar on save

## Phase 4: Navigation & Polish

- [ ] T012 Register named route in `main.dart` (Navigator 1.0)
- [ ] T013 Final visual polish (Material 3 components)
