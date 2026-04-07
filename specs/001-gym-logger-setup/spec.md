# Feature Specification: GymLogger Initial Setup and Dark Theme

**Feature Branch**: `001-gym-logger-setup`  
**Created**: 2026-04-06
**Status**: Draft  
**Input**: User description: "Projeto Flutter mobile chamado 'GymLogger'. Null-safety habilitado. Arquitetura baseada em separação por camadas (presentation, domain, data). Dependências padrão Flutter (sem libs externas inicialmente). Domínio: Aplicação de Registro de Treinos contendo: exercício, carga (kg), repetições, data. Identidade Visual: Tema dark obrigatório: Fundo: #121212, Superfícies: #1E1E1E, Primária: #7C4DFF (roxo intenso). Instruções de Implementação: Criar o ponto de entrada (main.dart), Configurar MaterialApp com rotas nomeadas, Definir rotas inicais: '/' -> LoginPage, '/home' -> HomePage, Criar arquivo app_theme.dart com ThemeData customizado (GymLogger), Aplicar tema no MaterialApp, Criar arquivos: login_page.dart, home_page.dart (placeholder), Separar responsabilidades (widgets stateless quando possível). Padrões de Código: Código limpo (Clean Code), Nomes descritivos, Separação de widgets, Evitar lógica dentro de build(). Formato de Saída: Código Dart completo dos arquivos: main.dart, app.dart, routes.dart, app_theme.dart, login_page.dart, home_page.dart. Critérios de Aceitação: App inicia corretamente, Tema dark aplicado globalmente, Tela de login exibida ao iniciar, Navegação via rotas nomeadas funcional."

## User Scenarios & Testing *(mandatory)*

### User Story 1 - App Initialization and Navigation (Priority: P1)

As a gym goer, I want to open the app and be presented with a professional dark-themed login screen. I should be able to navigate to the home screen after interacting with the login.

**Why this priority**: Fundamental UX for the app launch. Sets the tone for the design system.

**Independent Test**: Verified via `test/widget/` by checking the presence of the login screen and verifying the route navigation.

**Acceptance Scenarios**:

1. **Given** the app starts, **When** it loads, **Then** the `LoginPage` is displayed on the root route ('/').
2. **Given** the app is running, **When** navigated to '/home', **Then** the `HomePage` placeholder is displayed.

---

### User Story 2 - Consistent Visual Identity (Priority: P1)

As a user, I want the app to have a consistent dark theme that is easy on the eyes and follows the predefined color palette.

**Why this priority**: Essential for brand identity and user comfort in high-contrast environments.

**Acceptance Scenarios**:

1. **Given** any screen in the app, **When** viewed, **Then** the background is #121212 and surface color is #1E1E1E.
2. **Given** primary buttons or actions, **When** highlighted, **Then** they use the primary color #7C4DFF.

---

### Edge Cases

- App starting on a deep link route.
- Theme application behavior on different OS brightness settings (should force Dark Mode as per requirements).

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: Implement custom `GymLogger` theme using `ThemeData`.
- **FR-002**: Use `MaterialApp` with named routes for navigation.
- **FR-003**: Define primary routes: `/` for `LoginPage` and `/home` for `HomePage`.
- **FR-004**: Architecture must follow presentation/domain/data separation.
- **FR-005**: All code must be null-safe.
- **FR-006**: Widgets must be separated and keep `build()` methods logic-free.

### Key Entities

- **Exercise Record**: (Draft placeholder for future implementation) Represents a single set of an exercise with name, load (kg), repetitions, and date.
- **GymLogger Theme**: Centralized design tokens for colors and typography.

## Success Criteria

- App starts without errors on Android/iOS/Web emulators.
- The root route ('/') correctly loads `LoginPage`.
- The theme is applied globally, using specified hex codes for background and primary colors.
- Navigation to `/home` is functional via named routes.

## Assumptions

- Login page is initially descriptive/static for the skeleton setup.
- Persistence and full domain logic (CRUD) are planned for the next implementation phase but identified as part of the core domain.
- The project structure follows standard Flutter directory hierarchy.
- The app is oriented towards mobile use (Portrait).
