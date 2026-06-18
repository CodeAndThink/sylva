import 'package:flutter/material.dart';
import 'package:sylva/core/constants/app_colors.dart';
import 'package:sylva/core/extensions/num_extensions.dart';

class AppTransparentContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final BorderRadiusGeometry? border;
  final Color? backgroundColor;
  final Color? borderColor;
  final VoidCallback? onTap;
  const AppTransparentContainer({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.padding,
    this.borderRadius,
    this.border,
    this.backgroundColor,
    this.borderColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: border ?? (borderRadius ?? 28).borderRadius,
        border: Border.all(
          color: isDark
              ? borderColor ?? AppColors.glassStroke
              : borderColor ??
                    theme.colorScheme.secondary.withValues(alpha: 0.24),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: (borderColor ?? theme.colorScheme.primary).withValues(
              alpha: isDark ? 0.18 : 0.08,
            ),
            blurRadius: 24,
            spreadRadius: -6,
          ),
        ],
      ),
      child: Material(
        color:
            backgroundColor ?? theme.colorScheme.surface.withValues(alpha: 0.8),
        borderRadius: border ?? (borderRadius ?? 26.5).borderRadius,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(padding: padding ?? 12.paddingAll, child: child),
        ),
      ),
    );
  }
}
