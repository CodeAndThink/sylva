import 'package:flutter/material.dart';
import 'package:sylva/core/extensions/num_extensions.dart';

class AppTitleHeader extends StatelessWidget {
  final String title;
  final Color? color;
  final Widget? action;

  const AppTitleHeader({
    super.key,
    required this.title,
    this.color,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final displayColor = color ?? theme.colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 12),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 16,
            decoration: BoxDecoration(
              color: displayColor,
              borderRadius: 2.borderRadius,
              boxShadow: [
                BoxShadow(
                  color: displayColor.withValues(alpha: 0.3),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
          ),
          12.width,
          Text(
            title.toUpperCase(),
            style: theme.textTheme.titleSmall?.copyWith(
              color: displayColor,
              letterSpacing: 1.5,
            ),
          ),
          if (action != null) ...[const Spacer(), action!],
        ],
      ),
    );
  }
}
