import 'package:flutter/material.dart';

/// A reusable, themed text display atom.
///
/// Contains zero business logic. Renders a [Text] widget
/// respecting the application's dark theme color scheme.
class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const CustomText({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? const TextStyle(color: Colors.white),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
