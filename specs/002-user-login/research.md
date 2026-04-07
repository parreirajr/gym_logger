# Research Log: User Login implementation

**Feature**: user-login
**Decision date**: 2026-04-07

## Decisions

### 1. Validation logic isolation
- **Problem**: Where to place the logic for checking "admin" and "1234"?
- **Decision**: Create a `LoginValidator` class in `lib/domain/validators/login_validator.dart`.
- **Rationale**: Keeps `LoginPage` focused only on UI/UX (presentation layer). Provides testability without requiring Flutter widgets.
- **Alternatives Considered**: 
  - Inline logic in `LoginPage`: (Rejected) Violates Constitution Principle I (Architectural Separation).
  - Model validation: (Rejected) Credentials model should be a simple data container.

### 2. Form state management
- **Problem**: How to handle input changes and errors?
- **Decision**: Use `StatefulWidget` with `TextEditingController`.
- **Rationale**: High compliance with Constitution (Local State ONLY). Simple and native to Flutter.
- **Alternatives Considered**:
  - `GlobalKey<FormState>`: Useful but optional for this simple case. I will use standard controllers for direct access.

### 3. Reusable UI components
- **Problem**: How to maintain UI consistency and DRY?
- **Decision**: Create `lib/presentation/widgets/custom_text_field.dart` and `lib/presentation/widgets/custom_button.dart`.
- **Rationale**: Allows consistent styling (colors, padding, borders) and reuse in future screens.
- **Alternatives Considered**:
  - Ad-hoc styling: (Rejected) Harder to maintain and maintain "Premium Design" standards.

## Next Steps

1. Create `LoginCredentials` model.
2. Implement `LoginValidator`.
3. Build the `LoginPage` using the new reusable components.
