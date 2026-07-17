import 'package:flutter/material.dart';
import 'package:sylva/core/extensions/num_extensions.dart';

class SaveOptionButton extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final String title;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const SaveOptionButton({
    super.key,
    this.onTap,
    required this.icon,
    required this.title,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: backgroundColor ?? Colors.transparent,
      borderRadius: 24.borderRadius,
      child: InkWell(
        child: SizedBox(
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: foregroundColor ?? theme.colorScheme.onSurface),
              8.width,
              Text(
                title,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: foregroundColor,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.pop(context);
          onTap?.call();
        },
      ),
    );
  }
}
