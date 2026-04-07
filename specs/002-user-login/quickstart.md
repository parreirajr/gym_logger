# Quickstart: Testing User Login

**Feature**: user-login

## Verification Steps (after implementation)

1. **Successful Login**:
   - Username: `admin`
   - Password: `1234`
   - Action: Click **Login**
   - Expected: Redirection to Home screen, back button DOES NOT return to login.

2. **Failed Login**:
   - Username: `random`
   - Password: `wrong`
   - Action: Click **Login**
   - Expected: `SnackBar` with "Acesso negado" message.

3. **Empty Fields**:
   - Username/Password: [Leave blank]
   - Expected: `SnackBar` with "Usuário e senha são obrigatórios".

## Technical Note

- To reset state for testing: Restart the app.
- Ensure `AppRoutes.root` points to `LoginPage`.
- Navigation uses `Navigator.pushReplacementNamed`.
