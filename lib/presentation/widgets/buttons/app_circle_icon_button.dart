import 'package:flutter/material.dart';

class AppCircleIconButton extends StatelessWidget {
  const AppCircleIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.tooltipMessage,
    this.backgroundColor,
    this.iconColor = Colors.white,
    this.size = 38.0,
    this.iconSize = 24.0,
  });

  final IconData icon;
  final VoidCallback onTap;
  final String? tooltipMessage;
  final Color? backgroundColor;
  final Color iconColor;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    Widget button = Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(size / 2),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: size,
          width: size,
          child: Center(
            child: Icon(icon, size: iconSize, color: iconColor),
          ),
        ),
      ),
    );

    if (tooltipMessage != null) {
      return Tooltip(message: tooltipMessage, child: button);
    }

    return button;
  }
}
