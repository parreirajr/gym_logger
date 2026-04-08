import 'package:flutter/material.dart';
import '../../domain/models/workout_model.dart';

/// A form page for creating and editing workout records.
class WorkoutFormPage extends StatefulWidget {
  const WorkoutFormPage({super.key});

  @override
  State<WorkoutFormPage> createState() => _WorkoutFormPageState();
}

class _WorkoutFormPageState extends State<WorkoutFormPage> {
  final _formKey = GlobalKey<FormState>();
  
  // Controllers for form fields
  late final TextEditingController _exerciseController;
  late final TextEditingController _loadController;
  late final TextEditingController _repsController;
  
  // Local state for date and the workout being edited (if any)
  DateTime _selectedDate = DateTime.now();
  Workout? _existingWorkout;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _exerciseController = TextEditingController();
    _loadController = TextEditingController();
    _repsController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    // Extract existing workout from route arguments (Edition Mode)
    if (!_isInitialized) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args != null && args is Workout) {
        _existingWorkout = args;
        _exerciseController.text = _existingWorkout!.exerciseName;
        _loadController.text = _existingWorkout!.load.toString();
        _repsController.text = _existingWorkout!.repetitions.toString();
        _selectedDate = _existingWorkout!.date;
      }
      _isInitialized = true;
    }
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

  /// Validates and saves the workout, returning it to the previous screen.
  void _saveWorkout() {
    if (_formKey.currentState!.validate()) {
      final workout = Workout(
        // Retain ID if editing, otherwise generate a new one
        id: _existingWorkout?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
        exerciseName: _exerciseController.text.trim(),
        load: double.parse(_loadController.text),
        repetitions: int.parse(_repsController.text),
        date: _selectedDate,
      );
      
      Navigator.pop(context, workout);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = _existingWorkout != null;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'EDITAR TREINO' : 'NOVO TREINO'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Exercise Name Field
              _buildLabel('Exercício'),
              TextFormField(
                controller: _exerciseController,
                decoration: _buildInputDecoration('Ex: Supino Reto'),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel('Carga (kg)'),
                        TextFormField(
                          controller: _loadController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          decoration: _buildInputDecoration('0.0'),
                          validator: (value) {
                            if (value == null || value.isEmpty) return 'Obrigatório';
                            if (double.tryParse(value) == null) return 'Inválido';
                            if (double.parse(value) <= 0) return '> 0';
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel('Repetições'),
                        TextFormField(
                          controller: _repsController,
                          keyboardType: TextInputType.number,
                          decoration: _buildInputDecoration('0'),
                          validator: (value) {
                            if (value == null || value.isEmpty) return 'Obrigatório';
                            if (int.tryParse(value) == null) return 'Inválido';
                            if (int.parse(value) <= 0) return '> 0';
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Date Selection
              _buildLabel('Data'),
              InkWell(
                onTap: () => _selectDate(context),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${_selectedDate.day.toString().padLeft(2, '0')}/${_selectedDate.month.toString().padLeft(2, '0')}/${_selectedDate.year}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const Icon(Icons.calendar_today_rounded, color: Colors.white70),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Save Button
              ElevatedButton(
                onPressed: _saveWorkout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7C4DFF),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  isEditing ? 'ATUALIZAR' : 'SALVAR',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds a standard label for form fields.
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.white70,
        ),
      ),
    );
  }

  /// Builds the common input decoration with the required charcoal background.
  InputDecoration _buildInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: const Color(0xFF1E1E1E),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }
}
