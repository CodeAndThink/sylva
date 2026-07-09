import 'package:flutter/material.dart';
import 'package:sylva/core/extensions/num_extensions.dart';

class AppRadioTile<T> extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final T value;
  final T groupValue;
  final ValueChanged<T?>? onChanged;
  final double height;
  final EdgeInsetsGeometry? padding;
  final Widget? trailingWidget;

  const AppRadioTile({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    this.onChanged,
    this.titleStyle,
    this.height = 40,
    this.padding,
    this.trailingWidget,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSelected = value == groupValue;

    return InkWell(
      borderRadius: 10.borderRadius,
      onTap: () => onChanged?.call(value),
      child: Container(
        height: height,
        padding: padding ?? EdgeInsets.zero,
        child: Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSurfaceVariant,
                    width: isSelected ? 6 : 2,
                  ),
                ),
              ),
            ),
            12.width,
            if (trailingWidget != null) ...{
              Flexible(
                child: Text(
                  title,
                  style: titleStyle ?? theme.textTheme.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              12.width,
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: trailingWidget,
                ),
              ),
            } else ...{
              Expanded(
                child: Text(
                  title,
                  style: titleStyle ?? theme.textTheme.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            },
          ],
        ),
      ),
    );
  }
}
