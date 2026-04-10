# Tasks: UI Atomic Design Refactor

**Input**: Design documents from `/specs/010-ui-atomic-refactor/`
**Prerequisites**: plan.md (required), spec.md (required for user stories)

---

## Phase 1: Setup & Architecture

- [x] T001 Create Atomic Design folder structure: `lib/presentation/atoms/`, `lib/presentation/molecules/`, `lib/presentation/organisms/`, `lib/presentation/pages/`

---

## Phase 2: Foundational — Atoms (Blocking)

> **Goal**: Build all atomic-level components that every higher layer depends on. These are pure, stateless, zero-logic widgets.

- [x] T002 [P] Move and refactor `CustomButton` from `lib/presentation/widgets/custom_button.dart` to `lib/presentation/atoms/custom_button.dart` — add optional `isDestructive` prop, use theme colors from `AppTheme`
- [x] T003 [P] Move and refactor `CustomTextField` from `lib/presentation/widgets/custom_text_field.dart` to `lib/presentation/atoms/custom_text_field.dart` — add `validator` prop and `FormField` support (switch internal `TextField` to `TextFormField`), add `hintText` support
- [x] T004 [P] Create `CustomText` atom in `lib/presentation/atoms/custom_text.dart` — accepts `text`, `style`, `textAlign`, `maxLines`; renders themed `Text` widget using `AppTheme` colors
- [x] T005 [P] Create `CustomIconButton` atom in `lib/presentation/atoms/custom_icon_button.dart` — accepts `icon`, `onPressed`, `color`, `tooltip`; renders themed `IconButton`

---

## Phase 3: User Story 1 — Maintain Fully Functional UI Post-Refactor (Priority: P1)

> **Goal**: Compose atoms into molecules, organisms, and refactored pages so that all existing functionality (login, list, add/edit/delete workouts) works identically with the new Atomic architecture.
>
> **Independent Test**: Navigate through login → home list → add workout → edit workout → delete workout. All flows must work. Dark theme colors (#121212, #1E1E1E, #7C4DFF) must be consistent.

### Molecules

- [x] T006 [P] [US1] Create `WorkoutInfoRow` molecule in `lib/presentation/molecules/workout_info_row.dart` — composes `CustomText` atoms to display a label-value pair (e.g. icon + "Carga: 80.0 kg"); accepts `IconData icon`, `String label`, `String value`
- [x] T007 [P] [US1] Create `FormFieldGroup` molecule in `lib/presentation/molecules/form_field_group.dart` — composes `CustomText` (label) + `CustomTextField` (input) with standardized spacing; accepts label text and all `CustomTextField` props
- [x] T008 [P] [US1] Create `ActionButtonsRow` molecule in `lib/presentation/molecules/action_buttons_row.dart` — composes two `TextButton.icon` widgets for Edit (purple) and Delete (red) actions; accepts `VoidCallback onEdit`, `VoidCallback onDelete`

### Organisms

- [x] T009 [US1] Create `WorkoutCard` organism in `lib/presentation/organisms/workout_card.dart` — composes `WorkoutInfoRow` molecules + `ActionButtonsRow` molecule inside a themed `Card`; accepts `Workout workout`, `VoidCallback onEdit`, `VoidCallback onDelete`; replaces existing `WorkoutTile` widget
- [x] T010 [US1] Create `WorkoutList` organism in `lib/presentation/organisms/workout_list.dart` — renders a `ListView.builder` of `WorkoutCard` items with empty-state handling; accepts `List<Workout> workouts`, edit/delete callbacks
- [x] T011 [US1] Create `WorkoutForm` organism in `lib/presentation/organisms/workout_form.dart` — composes `FormFieldGroup` molecules + date picker + `CustomButton` atom inside a `Form`; accepts `Workout? initialWorkout`, `void Function(Workout) onSave`; extracts all form build logic from current `WorkoutFormPage`
- [x] T012 [US1] Move `DeleteConfirmationDialog` from `lib/presentation/widgets/delete_confirmation_dialog.dart` to `lib/presentation/organisms/delete_confirmation_dialog.dart` (preserve static `show` method)

### Pages (Refactor)

- [x] T013 [US1] Move and refactor `LoginPage` to `lib/presentation/pages/login_page.dart` — replace inline `Text`, `CustomTextField`, and `CustomButton` imports with atoms from `lib/presentation/atoms/`; use `CustomText` for title and subtitle; keep all business logic (auth, navigation) in-page
- [x] T014 [US1] Move and refactor `HomePage` to `lib/presentation/pages/home_page.dart` — replace `_buildEmptyState()` and `_buildWorkoutList()` inline widgets with `WorkoutList` organism; replace `WorkoutTile` usage with `WorkoutCard` via organism; keep all business logic (load, delete, edit, logout) in-page
- [x] T015 [US1] Move and refactor `WorkoutFormPage` to `lib/presentation/pages/workout_form_page.dart` — delegate all form rendering to `WorkoutForm` organism; page only handles route arguments extraction and `Navigator.pop` on save; remove all inline `TextFormField`, `_buildLabel`, `_buildInputDecoration` methods

### Wiring

- [x] T016 [US1] Update `lib/presentation/routes.dart` — adjust imports to point to new `pages/` paths (verify all three routes: `/`, `/home`, `/workout_form`)
- [x] T017 [US1] Update `lib/presentation/app.dart` — adjust imports if changed by route updates
- [x] T018 [US1] Delete old `lib/presentation/widgets/` directory after all widgets have been migrated to atoms/molecules/organisms

---

## Phase 4: Polish & Cross-Cutting Concerns

- [x] T019 Run `flutter analyze` from project root and fix any reported warnings or errors
- [x] T020 Run the application (`flutter run`) and manually verify all three user flows: login → home list → add/edit/delete workout — confirm no regressions
- [x] T021 Verify Atomic Design directory structure is correct: `lib/presentation/atoms/` (4 files), `lib/presentation/molecules/` (3 files), `lib/presentation/organisms/` (4 files), `lib/presentation/pages/` (3 files); no files remain in `lib/presentation/widgets/`

---

## Dependencies

```text
T001 ──► T002, T003, T004, T005   (folders must exist before atoms)
T002, T003, T004, T005 ──► T006, T007, T008   (atoms before molecules)
T006, T007, T008 ──► T009, T010, T011, T012   (molecules before organisms)
T009, T010, T011, T012 ──► T013, T014, T015   (organisms before page refactor)
T013, T014, T015 ──► T016, T017   (pages before wiring)
T016, T017 ──► T018   (wiring before cleanup)
T018 ──► T019, T020, T021   (cleanup before polish)
```

## Parallel Execution Opportunities

| Phase | Parallelizable Tasks | Reason |
|-------|---------------------|--------|
| Phase 2 | T002, T003, T004, T005 | Each atom is an independent file with no cross-dependencies |
| Phase 3 (Molecules) | T006, T007, T008 | Each molecule is an independent file composing different atoms |
| Phase 4 | T019, T020, T021 | Independent verification steps |

## Implementation Strategy

1. **Phase 1** (T001): Create empty directories — instant setup.
2. **Phase 2** (T002–T005): Build all 4 atoms in parallel. Two are migrations of existing widgets, two are new.
3. **Phase 3** (T006–T018): Build bottom-up — molecules → organisms → page refactors → wiring → cleanup. This is the core of the refactor.
4. **Phase 4** (T019–T021): Validate the entire application works identically to before.

**MVP Scope**: All phases are mandatory for this refactor — the feature is a single atomic unit (US1) with no optional stories.
