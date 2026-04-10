import 'package:flutter/material.dart';
import '../atoms/custom_text.dart';
import '../atoms/custom_text_field.dart';

/// A molecule that groups a label with a text input field.
///
/// Composes [CustomText] (label) + [CustomTextField] (input)
/// with standardized spacing. Used in forms for consistent layout.
class FormFieldGroup extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? hint;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const FormFieldGroup({
    super.key,
    required this.label,
    required this.controller,
    this.hint,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0, left: 4.0),
          child: CustomText(
            text: label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white70,
            ),
          ),
        ),
        CustomTextField(
          controller: controller,
          hint: hint,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
        ),
      ],
    );
  }
}
