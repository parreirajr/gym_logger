# Quickstart: Workout Record Update

## Local Execution
To verify the navigation and list update logic manually:
1. Launch the app in debug mode.
2. Tap the `+` Floating Action Button on the Home Page.
3. Complete the form and tap "Save".
4. Verity that the home page displays the new workout at the bottom of the list.
5. Tap the new workout tile.
6. Modify a value (e.g., change load from 80kg to 90kg) and save.
7. Verify that the tile updates and no new tile is added.

## Automated Testing
Run the following command to test the UI logic:
```bash
flutter test test/presentation/pages/home_page_test.dart
```

## Critical Checks
- Verify `Navigator.push` result is awaited.
- Ensure `setState` is called after list modification.
- Confirm `id` comparison is used for edit detection.
