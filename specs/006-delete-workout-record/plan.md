# Implementation Plan: Delete Workout Record

**Branch**: `006-delete-workout-record` | **Date**: 2026-04-08 | **Spec**: [spec.md](file:///D:/Projetos%20J%C3%BAnior/gym_logger/specs/006-delete-workout-record/spec.md)
**Input**: Feature specification from `/specs/006-delete-workout-record/spec.md`

## Summary

Implement a confirmation flow for deleting workout records. This includes a reusable dark-themed `AlertDialog` with a distinctive red delete action, and updating the `HomePage` logic to require confirmation before removal.

## Technical Context

**Language/Version**: Flutter 3.x / Dart 3.x
**Primary Dependencies**: shared_preferences (already implemented)
**Storage**: shared_preferences (JSON serialization)
**Testing**: flutter_test (Widget test for the dialog and deletion flow)
**Target Platform**: Mobile (Android/iOS)
**Project Type**: Mobile App
**Performance Goals**: Instant UI feedback after confirmation
**Constraints**: No external state management, Navigator 1.0
**Scale/Scope**: Update Home Page deletion flow

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

- [x] No external state management (Provider/Bloc)?
- [x] Layered architecture (presentation/domain/data)?
- [x] Navigator 1.0 used?
- [x] Material 3 applied?
- [x] Immutable models with toJson/fromJson?

## Project Structure

### Documentation (this feature)

```text
specs/006-delete-workout-record/
├── plan.md              # This file
├── research.md          # Research findings
├── data-model.md        # No changes to model
├── quickstart.md        # Integration guide
├── contracts/           # UI Contract (Dialog result)
└── tasks.md             # Implementation tasks
```

### Source Code (repository root)

```text
lib/
├── presentation/
│   ├── widgets/
│   │   └── delete_confirmation_dialog.dart (NEW)
│   └── pages/
│       └── home_page.dart (MODIFY)
```

## Complexity Tracking

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
| None | N/A | N/A |

## Phase 1: Design & Contracts

### UI Contract (Dialog)
- **Component**: `DeleteConfirmationDialog`
- **Method**: `static Future<bool> show(BuildContext context)`
- **Behavior**: Returns `true` if "Excluir" is pressed, `false` otherwise.

### Implementation Logic
1. `HomePage._deleteWorkout(id)` becomes `async`.
2. `final confirmed = await DeleteConfirmationDialog.show(context);`
3. If `confirmed`, execute removal logic.
