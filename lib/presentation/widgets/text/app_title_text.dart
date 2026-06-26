import 'package:flutter/material.dart';
import 'package:sylva/core/extensions/num_extensions.dart';

class AppTitleText extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final IconData? icon;
  const AppTitleText({super.key, required this.title, this.style, this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 36),
      child: Row(
        spacing: 12,
        children: [
          if (icon != null) Icon(icon, size: 24),
          Container(
            height: 20,
            width: 4,
            decoration: BoxDecoration(
              borderRadius: 2.borderRadius,
              color: theme.colorScheme.primary,
            ),
          ),
          Text(
            title,
            style: style ?? Theme.of(context).textTheme.titleMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
