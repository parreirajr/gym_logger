# Quickstart: Workout Form

## Integration Guide

To integrate the new `WorkoutFormPage` into your flow:

1. **Define the Route**:
   Add the following to your `onGenerateRoute` or `routes` map in `main.dart`:
   ```dart
   '/workout_form': (context) => const WorkoutFormPage(),
   ```

2. **Trigger Creation**:
   ```dart
   final newWorkout = await Navigator.pushNamed(context, '/workout_form');
   if (newWorkout != null) {
     _addWorkout(newWorkout as Workout);
   }
   ```

3. **Trigger Edition**:
   ```dart
   final updatedWorkout = await Navigator.pushNamed(
     context, 
     '/workout_form', 
     arguments: existingWorkout
   );
   if (updatedWorkout != null) {
     _updateWorkout(updatedWorkout as Workout);
   }
   ```

## Key Components

- **WorkoutFormPage**: The main container (StatefulWidget).
- **WorkoutForm**: Internal widget encapsulating the fields and validation logic.
- **SaveButton**: Styled button using the `#7C4DFF` primary color.
