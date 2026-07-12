import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/utils/color_utils.dart';
import 'package:sylva/core/enums/template_enums.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/share/share_cubit.dart';
import 'package:sylva/presentation/features/share/share_state.dart';
import 'package:sylva/presentation/widgets/buttons/app_sliding_segmented_control.dart';
import 'package:sylva/presentation/features/share/widgets/share_font_bottom_sheet.dart';

class ShareTextTab extends StatefulWidget {
  const ShareTextTab({super.key});

  @override
  State<ShareTextTab> createState() => _ShareTextTabState();
}

class _ShareTextTabState extends State<ShareTextTab> {
  late ThemeData _theme;
  late S _l10n;
  late final ShareCubit _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = context.read<ShareCubit>();
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    _l10n = S.of(context);

    return BlocBuilder<ShareCubit, ShareState>(
      buildWhen: (previous, current) =>
          previous.textOption != current.textOption ||
          previous.textPosition != current.textPosition ||
          previous.textSize != current.textSize ||
          previous.isTextBold != current.isTextBold ||
          previous.isTextItalic != current.isTextItalic ||
          previous.isTextUnderline != current.isTextUnderline ||
          previous.selectedShape != current.selectedShape ||
          previous.textColor != current.textColor,
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Option Segmented Control
            AppSlidingSegmentedControl<ShareTextOption>(
              selectedValue: state.textOption,
              onValueChanged: _cubit.changeTextOption,
              segments: [
                (
                  ShareTextOption.none,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.do_not_disturb),
                      4.width,
                      Text(_l10n.textOptionNone),
                    ],
                  ),
                ),
                (
                  ShareTextOption.hex,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.tag),
                      4.width,
                      const Text('HEX'),
                    ],
                  ),
                ),
                (
                  ShareTextOption.rgba,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.color_lens),
                      4.width,
                      Text.rich(
                        TextSpan(
                          style: _theme.textTheme.titleSmall,
                          children: [
                            const TextSpan(
                              text: 'R',
                              style: TextStyle(color: Colors.red),
                            ),
                            const TextSpan(
                              text: 'G',
                              style: TextStyle(color: Colors.green),
                            ),
                            const TextSpan(
                              text: 'B',
                              style: TextStyle(color: Colors.blue),
                            ),
                            TextSpan(
                              text: 'A',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            if (state.textOption != ShareTextOption.none &&
                state.selectedShape != PaletteShape.none) ...[
              8.height,
              // Position Segmented Control
              AppSlidingSegmentedControl<ShareTextPosition>(
                isFlexible: true,
                selectedValue: state.textPosition,
                onValueChanged: _cubit.changeTextPosition,
                segments: [
                  (
                    ShareTextPosition.top,
                    _buildPositionSegment(
                      icon: Icons.align_vertical_top_outlined,
                      label: _l10n.textPositionTop,
                      isSelected: state.textPosition.isTop,
                    ),
                  ),
                  (
                    ShareTextPosition.bottom,
                    _buildPositionSegment(
                      icon: Icons.align_vertical_bottom_outlined,
                      label: _l10n.textPositionBottom,
                      isSelected: state.textPosition.isBottom,
                    ),
                  ),
                  (
                    ShareTextPosition.left,
                    _buildPositionSegment(
                      icon: Icons.align_horizontal_left_outlined,
                      label: _l10n.textPositionLeft,
                      isSelected: state.textPosition.isLeft,
                    ),
                  ),
                  (
                    ShareTextPosition.right,
                    _buildPositionSegment(
                      icon: Icons.align_horizontal_right_outlined,
                      label: _l10n.textPositionRight,
                      isSelected: state.textPosition.isRight,
                    ),
                  ),
                  (
                    ShareTextPosition.inside,
                    _buildPositionSegment(
                      icon: Icons.center_focus_strong,
                      label: _l10n.textPositionInside,
                      isSelected: state.textPosition.isInside,
                    ),
                  ),
                ],
              ),
              8.height,

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  4.width,
                  _buildStyleButton(
                    icon: Icons.format_bold,
                    isSelected: state.isTextBold,
                    onPressed: _cubit.toggleTextBold,
                    primaryColor: _theme.colorScheme.primary,
                  ),
                  4.width,
                  _buildStyleButton(
                    icon: Icons.format_italic,
                    isSelected: state.isTextItalic,
                    onPressed: _cubit.toggleTextItalic,
                    primaryColor: _theme.colorScheme.primary,
                  ),
                  4.width,
                  _buildStyleButton(
                    icon: Icons.format_underlined,
                    isSelected: state.isTextUnderline,
                    onPressed: _cubit.toggleTextUnderline,
                    primaryColor: _theme.colorScheme.primary,
                  ),
                  const Spacer(),
                  InkWell(
                    borderRadius: 20.borderRadius,
                    onTap: () {
                      final Color initialColor =
                          state.textColor ?? _theme.colorScheme.surface;
                      ColorUtils.showColorPicker(
                        context,
                        initialColor: initialColor,
                        onColorPicked: (color) {
                          _cubit.changeTextColor(color);
                        },
                      );
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: state.textColor ?? _theme.colorScheme.surface,
                      ),
                      child: const Icon(
                        Icons.colorize,
                        size: 20,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  if (state.textColor != null) ...[
                    4.width,
                    Tooltip(
                      message: _l10n.clearColor,
                      child: InkWell(
                        onTap: () => _cubit.changeTextColor(null),
                        borderRadius: 20.borderRadius,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _theme.colorScheme.primary.withValues(
                              alpha: 0.2,
                            ),
                          ),
                          child: const Icon(Icons.format_color_reset, size: 24),
                        ),
                      ),
                    ),
                  ],
                ],
              ),

              // Size slider & styling buttons
              Row(
                children: [
                  const Icon(Icons.format_size),
                  Expanded(
                    child: Slider(
                      value: state.textSize,
                      min: 0.1,
                      max: 1.0,
                      onChanged: (v) => _cubit.changeTextSize(v),
                    ),
                  ),
                  4.width,
                  InkWell(
                    borderRadius: 20.borderRadius,
                    onTap: () {
                      _cubit.navigator.showAppBottomSheet(
                        child: BlocProvider.value(
                          value: _cubit,
                          child: const ShareFontBottomSheet(),
                        ),
                      );
                    },
                    child: Container(
                      height: 40,
                      padding: 12.paddingHorizontal,
                      decoration: BoxDecoration(
                        color: _theme.colorScheme.primary.withValues(
                          alpha: 0.1,
                        ),
                        borderRadius: 20.borderRadius,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.font_download,
                            color: _theme.colorScheme.primary,
                            size: 20,
                          ),
                          8.width,
                          Flexible(
                            child: Text(
                              state.textFontFamily,
                              style: TextStyle(
                                color: _theme.colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        );
      },
    );
  }

  Widget _buildPositionSegment({
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        if (isSelected) ...[
          4.width,
          Flexible(
            child: Text(
              label,
              style: _theme.textTheme.bodySmall?.copyWith(
                color: _theme.colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildStyleButton({
    required IconData icon,
    required bool isSelected,
    required VoidCallback onPressed,
    required Color primaryColor,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: 20.borderRadius,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? primaryColor.withValues(alpha: 0.2) : null,
        ),
        child: Icon(
          icon,
          color: isSelected ? primaryColor : _theme.colorScheme.onSurface,
        ),
      ),
    );
  }
}
