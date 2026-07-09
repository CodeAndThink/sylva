import 'package:flutter/material.dart';

class AppSwitchTile extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? secondary;
  final Widget? subtitle;

  const AppSwitchTile({
    super.key,
    required this.title,
    required this.value,
    this.onChanged,
    this.titleStyle,
    this.contentPadding = EdgeInsets.zero,
    this.secondary,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: titleStyle ?? theme.textTheme.bodyMedium),
        Switch(value: value, onChanged: onChanged),
      ],
    );
  }
}
