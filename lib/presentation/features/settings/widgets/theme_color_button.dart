import 'package:flutter/material.dart';
import 'package:sylva/core/extensions/num_extensions.dart';

class ThemeColorButton extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final Function()? onTap;
  const ThemeColorButton({
    super.key,
    required this.color,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: color,
      shape: CircleBorder(
        side: BorderSide(
          color: isSelected ? theme.colorScheme.onSurface : Colors.transparent,
          width: 2.5,
        ),
      ),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: AnimatedContainer(
          duration: 250.milliseconds,
          curve: Curves.easeInOut,
          width: isSelected ? 38 : 30,
          height: isSelected ? 38 : 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: color.withValues(alpha: 0.45),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: isSelected
              ? const Icon(Icons.check_rounded, color: Colors.white, size: 22)
              : null,
        ),
      ),
    );
  }
}
