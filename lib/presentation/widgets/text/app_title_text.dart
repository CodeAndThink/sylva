import 'package:flutter/material.dart';

class AppTitleText extends StatelessWidget {
  final String title;
  final TextStyle? style;
  const AppTitleText({super.key, required this.title, this.style});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 48),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: style ?? Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
