# Implementation Plan: Workout Record Update and Navigation

**Branch**: `005-workout-update` | **Date**: 2026-04-07 | **Spec**: [spec.md](spec.md)
**Input**: Feature specification from `/specs/005-description-atualiza-de/spec.md`

## Summary

Implement the navigation flow between `HomePage` and `WorkoutFormPage`. The `HomePage` will initiate navigation for both adding new and editing existing workouts, await the returned `Workout` object, and update the local `workouts` list using `setState`.

## Technical Context

**Language/Version**: Flutter 3.x / Dart 3.x
**Primary Dependencies**: shared_preferences (already included)
**Storage**: shared_preferences (JSON serialization)
**Testing**: flutter_test (Widget tests for HomePage navigation/list update)
**Target Platform**: Mobile
**Project Type**: Mobile App
**Performance Goals**: Instant UI refresh upon returning from form.
**Constraints**: No external state management, Navigator 1.0.
**Scale/Scope**: Local list management in `HomePage`.

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

[x] No external state management (Provider/Bloc)?
[x] Layered architecture (presentation/domain/data)?
[x] Navigator 1.0 used?
[x] Material 3 applied?
[x] Immutable models with toJson/fromJson?

## Project Structure

### Documentation (this feature)

```text
specs/005-workout-update/
├── plan.md              # This file
├── research.md          # Navigator return patterns
├── data-model.md        # Workout model review
├── quickstart.md        # How to test adding/editing
└── tasks.md             # Implementation tasks
```

### Source Code (repository root)

```text
lib/
├── domain/models/workout_model.dart
├── presentation/pages/home_page.dart
└── presentation/pages/workout_form_page.dart

test/
└── presentation/pages/home_page_test.dart
```

**Structure Decision**: Logic for list update will reside within `HomePage` state, with possible isolation in a private method `_handleWorkoutResult`.

## Complexity Tracking

*No violations.*
