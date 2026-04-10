# Implementation Plan: SQLite Persistence Migration

**Branch**: `009-sqlite-persistence` | **Date**: 2026-04-10 | **Spec**: [spec.md](./spec.md)
**Input**: Feature specification from `specs/009-sqlite-persistence/spec.md`

## Summary

Migrate the GymLogger application from using `shared_preferences` for workout persistence to using a structured relational database with SQLite (`sqflite`). This involves adding new dependencies, creating a `DatabaseHelper`, abstracting access through a `WorkoutRepository`, and refactoring the UI to perform asynchronous CRUD operations on the SQLite backend while keeping the data layer strictly isolated.

## Technical Context

**Language/Version**: Flutter 3.x / Dart 3.x
**Primary Dependencies**: `sqflite`, `path`
**Storage**: SQLite local database
**Testing**: flutter_test (Widget & Unit tests)
**Target Platform**: Mobile (Android/iOS)
**Project Type**: Mobile App
**Performance Goals**: 60 FPS, smooth transitions
**Constraints**: No external state management, Navigator 1.0, Variables/methods in English
**Scale/Scope**: Gym Logger MVP (Exercise, Load, Reps, Date)

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

- [x] No external state management (Provider/Bloc)?
- [x] Layered architecture (presentation/domain/data)?
- [x] Navigator 1.0 used?
- [x] Material 3 applied?
- [x] Immutable models with toJson/fromJson? *(Wait, SQLite uses toMap/fromMap, but we can maintain toJson/fromJson compatibility and add toMap/fromMap or use the json methods directly. We will stick to the model properties.)*
- [ ] Use `shared_preferences` for local storage. -> VIOLATION. Justified in complexity tracking.

## Project Structure

### Documentation (this feature)

```text
specs/009-sqlite-persistence/
├── plan.md              # This file
├── research.md          # Phase 0 output
├── data-model.md        # Phase 1 output
├── quickstart.md        # Phase 1 output
├── contracts/           # Phase 1 output
└── tasks.md             # Phase 2 output
```

### Source Code (repository root)

```text
lib/
├── data/
│   ├── database/        # DatabaseHelper using sqflite
│   ├── repositories/    # WorkoutRepository
├── domain/models/       # Immutable models
└── presentation/        # UI logic and widgets
```

**Structure Decision**: Layered architecture (Data/Domain/Presentation). Introduce a `database` folder specifically for SQLite connection setup.

## Complexity Tracking

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
| Constitution VI (Use `shared_preferences`) | The user explicitly requested migration to SQLite. Relational DB fits structured workout lists better as data grows. | Continuing with `shared_preferences` is rejected by the new specification. SQLite is more robust for querying and data manipulation. |
