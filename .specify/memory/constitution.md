<!--
Sync Impact Report:
- Version change: 0.1.0 → 1.1.0 (Initial Template → Flutter/Dart Specialization)
- Modified principles:
  - Role: Senior Flutter/Dart Engineer
  - Objective: Quality, consistency, and professional standards for Gym Logger
  - Core Principles: Layered architecture, StatefulWidget-only, Material 3, Navigator 1.0, Immutable Models, shared_preferences, validation, and error handling.
- Added sections:
  - Application Domain (Gym Logger)
- Templates requiring updates:
  - ✅ plan-template.md 
  - ✅ spec-template.md
  - ✅ tasks-template.md
- Follow-up TODOs: None
-->
# Gym Logger (Registro de Treinos) Constitution

## Role & Objective

**Atue como um Engenheiro de Software Sênior especialista em Flutter e Dart**, responsável por garantir qualidade, consistência e boas práticas em todo o código gerado. O objetivo é garantir que todas as implementações do projeto sigam padrões profissionais de desenvolvimento, com foco em legibilidade, organização, escalabilidade e funcionamento correto.

## Core Principles

### I. Architectural Separation
- **Layered approach mandatory**: presentation (UI), domain (models), and data (services/persistence).
- Each responsibility must be isolated.
- Business logic is strictly forbidden within Widgets.

### II. State Management Discipline
- **Local State ONLY**: Use `StatefulWidget` for simple local states.
- **Strict Prohibition**: Do not use external libraries like Provider, Bloc, Riverpod, etc., unless explicitly requested for scaling exceptions.
- Keep state logic simple and direct.

### III. UI/UX Standards (Material 3)
- Utilize Material Design (Material 3) for all interfaces.
- Interfaces must be simple, clear, and functional.
- Prioritize mobile usability and avoid unnecessary visual complexity.

### IV. Navigation (Navigator 1.0)
- Use Navigator 1.0 with named routes.
- Prefer `pushReplacement` for context-sensitive transitions (e.g., after login or destructive actions).

### V. Data Model Integrity
- Models must be immutable whenever possible.
- Strong typing required (avoid `dynamic`).
- Implementation of `toJson()` and `fromJson()` is mandatory for all domain models.

### VI. Persistent Storage (JSON Serialization)
- Use `shared_preferences` for local storage.
- All data must be serialized to JSON before storage.
- Ensure safe data loading and error state handling for persistence.

### VII. Code Quality & Formatting
- **Full & Functional**: Never leave functions incomplete or commented out.
- **DRY (Don't Repeat Yourself)**: Avoid duplicated code.
- **Null-Safety**: Correct application of Dart null-safety is non-negotiable.
- **Dartfmt**: Follow official Flutter/Dart naming conventions and formatting.

## Application Domain: Gym Logger

The system domain is strictly defined around "Gym Logger" (Registro de Treinos), containing:
- **Exercise**: Name or identifier of the activity.
- **Load (kg)**: Numeric weight used.
- **Repetitions**: Quantity of completions.
- **Date**: Chronological record of the set.

## Development Workflow

### Validation & Error Handling
- Validate all user inputs (required fields, valid numeric types).
- Avoid crashes by handling invalid inputs gracefully.
- Utilize `try/catch` blocks for operations that may fail (e.g., I/O).
- Provide immediate user feedback via `SnackBar` or `AlertDialog`.

### Modularization
- Methods must be small with a single responsibility.
- Descriptive and clear naming conventions.
- No logic inside `build()` methods.
- Re-use widgets and split complex components into smaller, maintainable units.

## Governance

- The Constitution supersedes all other ad-hoc development practices.
- Amendments require specific updates to this document and synchronization of all templates.
- Any deviation from the "No External State Management" or "Navigator 1.0" rules must be explicitly justified in the Implementation Plan.

**Version**: 1.1.0 | **Ratified**: 2026-04-06 | **Last Amended**: 2026-04-06
