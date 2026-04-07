# Research: GymLogger Initial Setup and Dark Theme

**Feature**: [001-gym-logger-setup](file:///D:/Projetos%20J%C3%BAnior/gym_logger/specs/001-gym-logger-setup/spec.md)
**Status**: Resolved

## Decision: Visual Identity & Theme Configuration
- **Decision**: Use `ThemeData` with `useMaterial3: true` and explicit `ColorScheme` mapping.
- **Rationale**: Ensures the latest Material 3 tokens are used while strictly adhering to the requested color palette.
- **Implementation Detail**:
  - `brightness: Brightness.dark`
  - `scaffoldBackgroundColor: Color(0xFF121212)`
  - `cardColor: Color(0xFF1E1E1E)`
  - `primaryColor: Color(0xFF7C4DFF)`
- **Alternatives Considered**: Using default Dark Theme, but it doesn't match the specific hex requirements.

## Decision: Navigation Strategy (Navigator 1.0)
- **Decision**: Define a `Map<String, WidgetBuilder>` in a separate `routes.dart` file.
- **Rationale**: Cleanest way to manage named routes without external libraries, as per Constitution Principles.
- **Implementation Detail**: 
  - `/`: LoginPage
  - `/home`: HomePage
- **Alternatives Considered**: In-line routes in `MaterialApp`, but rejected for better modularity.

## Decision: Architectural Structure
- **Decision**: Standard 3-layer structure (data, domain, presentation).
- **Rationale**: Mandatory as per Constitution for scalability even in simple features.
- **Structure**:
  - `lib/presentation/pages/`: login_page.dart, home_page.dart
  - `lib/presentation/theme/`: app_theme.dart
  - `lib/presentation/app.dart`: Main MaterialApp hub.
  - `lib/presentation/routes.dart`: Route definitions.

## Decision: Coding Style & State Management
- **Decision**: `StatelessWidget` for static pages, `StatefulWidget` for local interaction. No external providers.
- **Rationale**: Adheres to the "Local State ONLY" principle.
- **Alternatives Considered**: Provider/Riverpod (Rejected by Constitution).
