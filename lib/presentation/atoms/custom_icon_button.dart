import 'package:flutter/material.dart';

/// A reusable, themed icon button atom.
///
/// Contains zero business logic. Renders a styled [IconButton]
/// with optional color override and tooltip.
class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? color;
  final String? tooltip;
  final double? size;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.color,
    this.tooltip,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: color ?? Colors.white70,
        size: size ?? 24,
      ),
      tooltip: tooltip,
    );
  }
}
