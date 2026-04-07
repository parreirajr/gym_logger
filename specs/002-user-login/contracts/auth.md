# Auth Contract: Validation rules

**Feature**: user-login
**Contract version**: 0.1.0

## LoginValidator

Central logic for checking credentials validity.

### Function: `bool validate(String username, String password)`

- **Purpose**: Checks if user provided input matches internal records.
- **Input**:
  - `username` (String): Raw text from UI.
  - `password` (String): Raw text from UI.
- **Output**:
  - `true`: Matches "admin" / "1234".
  - `false`: Any other case.

### Function: `String? getErrorMessage(String username, String password)`

- **Purpose**: Returns user-friendly error message for validation.
- **Rules**:
  - IF `username` is empty: "Usuário é obrigatório".
  - IF `password` is empty: "Senha é obrigatória".
  - IF credentials do not match: "Acesso negado".
- **Output**: `String` error or `null` if valid.
