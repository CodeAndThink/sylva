import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  final Widget child;
  final bool enabled;
  final Color? baseColor;
  final Color? highlightColor;

  const AppShimmer({
    super.key,
    required this.child,
    this.enabled = true,
    this.baseColor,
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    if (!enabled) return child;

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final defaultBaseColor = isDark ? Colors.grey[800]! : Colors.grey[300]!;
    final defaultHighlightColor = isDark
        ? Colors.grey[700]!
        : Colors.grey[100]!;

    return Shimmer.fromColors(
      baseColor: baseColor ?? defaultBaseColor,
      highlightColor: highlightColor ?? defaultHighlightColor,
      enabled: enabled,
      child: child,
    );
  }
}

class AppShimmerBox extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final bool isCircle;
  final EdgeInsetsGeometry? margin;

  const AppShimmerBox({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.isCircle = false,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: isCircle
            ? null
            : BorderRadius.circular(borderRadius ?? 12),
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
      ),
    );
  }
}

class AppShimmerCircle extends StatelessWidget {
  final double size;
  final EdgeInsetsGeometry? margin;

  const AppShimmerCircle({super.key, required this.size, this.margin});

  @override
  Widget build(BuildContext context) {
    return AppShimmerBox(
      width: size,
      height: size,
      isCircle: true,
      margin: margin,
    );
  }
}
