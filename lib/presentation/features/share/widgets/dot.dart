import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  const Dot({super.key, required this.isSelected});
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: isSelected
            ? theme.colorScheme.onPrimary
            : theme.colorScheme.onSurface.withValues(alpha: 0.5),
        shape: BoxShape.circle,
      ),
    );
  }
}
