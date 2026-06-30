import 'package:flutter/material.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/core/utils/app_feedback.dart';
import 'package:sylva/presentation/widgets/containers/app_transparent_container.dart';

class AppSlidingSegmentedControl<T> extends StatelessWidget {
  final T selectedValue;
  final List<(T, Widget)> segments;
  final ValueChanged<T> onValueChanged;
  final double height;
  final double? width;
  final Color? activeColor;
  final bool isFlexible;
  final double unselectedWidth;

  const AppSlidingSegmentedControl({
    super.key,
    required this.selectedValue,
    required this.segments,
    required this.onValueChanged,
    this.height = 52,
    this.width,
    this.activeColor,
    this.isFlexible = false,
    this.unselectedWidth = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = activeColor ?? theme.colorScheme.primary;

    return AppTransparentContainer(
      height: height,
      width: width,
      padding: 4.paddingAll,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double tabWidth;
          final double selectedWidth;

          if (isFlexible) {
            selectedWidth =
                constraints.maxWidth - (segments.length - 1) * unselectedWidth;
            tabWidth = 0; // Not used when flexible
          } else {
            tabWidth = constraints.maxWidth / segments.length;
            selectedWidth = tabWidth;
          }

          return Row(
            children: segments.map((tab) {
              final isSelected = tab.$1 == selectedValue;
              final currentWidth = isFlexible
                  ? (isSelected ? selectedWidth : unselectedWidth)
                  : tabWidth;

              return AnimatedContainer(
                duration: 300.milliseconds,
                curve: Curves.easeInOutCubic,
                width: currentWidth,
                decoration: BoxDecoration(
                  color: isSelected ? primaryColor : Colors.transparent,
                  borderRadius: 100.borderRadius,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: 100.borderRadius,
                    onTap: () {
                      AppFeedback.playInteract(context);
                      onValueChanged(tab.$1);
                    },
                    child: Padding(
                      padding: 4.paddingHorizontal,
                      child: Center(
                        child: ClipRect(
                          child: _buildSegmentChild(
                            context,
                            tab.$2,
                            isSelected,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Widget _buildSegmentChild(
    BuildContext context,
    Widget child,
    bool isSelected,
  ) {
    final theme = Theme.of(context);
    final color = isSelected
        ? theme.colorScheme.onPrimary
        : theme.colorScheme.onPrimaryContainer;

    return IconTheme(
      data: IconThemeData(color: color, size: isSelected ? 22 : 20),
      child: DefaultTextStyle(
        style: theme.textTheme.labelMedium!.copyWith(
          color: color,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
        ),
        child: child,
      ),
    );
  }
}
