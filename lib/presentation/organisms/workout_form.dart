import 'package:flutter/material.dart';
import '../../domain/models/workout_model.dart';
import '../atoms/custom_button.dart';
import '../atoms/custom_text.dart';
import '../molecules/form_field_group.dart';

/// An organism that renders the complete workout entry form.
///
/// Composes [FormFieldGroup] molecules for inputs, a date picker section,
/// and a [CustomButton] atom for submission. Extracts all form build logic
/// from the page layer.
class WorkoutForm extends StatefulWidget {
  final Workout? initialWorkout;
  final void Function(Workout workout) onSave;

  const WorkoutForm({
    super.key,
    this.initialWorkout,
    required this.onSave,
  });

  @override
  State<WorkoutForm> createState() => _WorkoutFormState();
}

class _WorkoutFormState extends State<WorkoutForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _exerciseController;
  late final TextEditingController _loadController;
  late final TextEditingController _repsController;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _exerciseController = TextEditingController(
      text: widget.initialWorkout?.exerciseName ?? '',
    );
    _loadController = TextEditingController(
      text: widget.initialWorkout?.load.toString() ?? '',
    );
    _repsController = TextEditingController(
      text: widget.initialWorkout?.repetitions.toString() ?? '',
    );
    _selectedDate = widget.initialWorkout?.date ?? DateTime.now();
  }

  @override
  void dispose() {
    _exerciseController.dispose();
    _loadController.dispose();
    _repsController.dispose();
    super.dispose();
  }

  /// Opens the material date picker to select a workout date.
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  /// Validates and saves the workout, invoking the [onSave] callback.
  void _handleSave() {
    if (_formKey.currentState!.validate()) {
      final workout = Workout(
        id: widget.initialWorkout?.id ??
            DateTime.now().millisecondsSinceEpoch.toString(),
        exerciseName: _exerciseController.text.trim(),
        load: double.parse(_loadController.text),
        repetitions: int.parse(_repsController.text),
        date: _selectedDate,
      );

      widget.onSave(workout);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.initialWorkout != null;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Exercise Name Field
            FormFieldGroup(
              label: 'Exercício',
              controller: _exerciseController,
              hint: 'Ex: Supino Reto',
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Informe o nome do exercício';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Load and Reps Row
            Row(
              children: [
                Expanded(
                  child: FormFieldGroup(
                    label: 'Carga (kg)',
                    controller: _loadController,
                    hint: '0.0',
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe a carga';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Valor numérico inválido';
                      }
                      if (double.parse(value) <= 0) {
                        return 'A carga deve ser maior que zero';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: FormFieldGroup(
                    label: 'Repetições',
                    controller: _repsController,
                    hint: '0',
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe as repetições';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Valor numérico inválido';
                      }
                      if (int.parse(value) <= 0) {
                        return 'As repetições devem ser maior que zero';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Date Selection
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0, left: 4.0),
              child: CustomText(
                text: 'Data',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white70,
                ),
              ),
            ),
            InkWell(
              onTap: () => _selectDate(context),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text:
                          '${_selectedDate.day.toString().padLeft(2, '0')}/${_selectedDate.month.toString().padLeft(2, '0')}/${_selectedDate.year}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Icon(
                      Icons.calendar_today_rounded,
                      color: Colors.white70,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Save Button
            CustomButton(
              label: isEditing ? 'ATUALIZAR' : 'SALVAR',
              onPressed: _handleSave,
            ),
          ],
        ),
      ),
    );
  }
}
