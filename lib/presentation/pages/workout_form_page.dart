import 'package:flutter/material.dart';
import '../../domain/models/workout_model.dart';
import '../organisms/workout_form.dart';

/// A page that wraps the [WorkoutForm] organism for routing.
///
/// Handles route argument extraction and passes the save callback
/// to pop the result back to the calling page. Contains no form
/// build logic — that is fully delegated to the organism.
class WorkoutFormPage extends StatelessWidget {
  const WorkoutFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Extract existing workout from route arguments (Edition Mode)
    final args = ModalRoute.of(context)?.settings.arguments;
    final existingWorkout = args is Workout ? args : null;
    final isEditing = existingWorkout != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'EDITAR TREINO' : 'NOVO TREINO')),
      body: WorkoutForm(
        initialWorkout: existingWorkout,
        onSave: (workout) => Navigator.pop(context, workout),
      ),
    );
  }
}
