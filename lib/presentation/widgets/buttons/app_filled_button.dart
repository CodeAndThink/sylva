import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sylva/core/constants/app_colors.dart';
import 'package:sylva/core/extensions/num_extensions.dart';

class AppFilledButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool enabled;
  final double borderRadius;
  final EdgeInsets? padding;

  const AppFilledButton({
    super.key,
    required this.text,
    this.textStyle,
    this.onPressed,
    this.isLoading = false,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.enabled = true,
    this.borderRadius = 20,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final foreColor = foregroundColor ?? theme.colorScheme.onPrimary;
    final style = FilledButton.styleFrom(
      backgroundColor: backgroundColor ?? theme.colorScheme.primary,
      foregroundColor: foreColor,
      disabledBackgroundColor: AppColors.placeholderText.withValues(
        alpha: 0.32,
      ),
      disabledForegroundColor: Colors.white70,
      elevation: 0,
      padding: padding ?? 12.paddingAll,
      shape: RoundedRectangleBorder(borderRadius: borderRadius.borderRadius),
    );
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 48),
      child: FilledButton(
        onPressed: enabled && !isLoading ? onPressed : null,
        style: style,
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: SpinKitRipple(color: foreColor),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 20, color: foreColor),
                    8.width,
                  ],
                  Flexible(
                    child: Text(
                      text,
                      style: (textStyle ?? theme.textTheme.titleMedium)
                          ?.copyWith(color: foreColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
