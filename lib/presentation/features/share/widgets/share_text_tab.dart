import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/enums/template_enums.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/share/share_cubit.dart';
import 'package:sylva/presentation/features/share/share_state.dart';
import 'package:sylva/presentation/features/photo_preview/widgets/palette_color_list_item.dart';

class ShareTextTab extends StatelessWidget {
  final List<Color> colors;

  const ShareTextTab({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShareCubit, ShareState>(
      buildWhen: (previous, current) =>
          previous.textOption != current.textOption ||
          previous.textPosition != current.textPosition ||
          previous.textSize != current.textSize ||
          previous.isTextBold != current.isTextBold ||
          previous.isTextItalic != current.isTextItalic ||
          previous.isTextUnderline != current.isTextUnderline ||
          previous.selectedShape != current.selectedShape,
      builder: (context, state) {
        final cubit = context.read<ShareCubit>();
        final primaryColor = Theme.of(context).colorScheme.primary;
        final l10n = S.of(context);

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Option Segmented Control
            SegmentedButton<ShareTextOption>(
              segments: [
                ButtonSegment(
                  value: ShareTextOption.none,
                  label: Text(l10n.textOptionNone),
                  icon: const Icon(Icons.do_not_disturb),
                ),
                const ButtonSegment(
                  value: ShareTextOption.hex,
                  label: Text('HEX'),
                  icon: Icon(Icons.tag),
                ),
                const ButtonSegment(
                  value: ShareTextOption.rgba,
                  label: Text('RGBA'),
                  icon: Icon(Icons.color_lens),
                ),
              ],
              selected: {state.textOption},
              onSelectionChanged: (Set<ShareTextOption> newSelection) {
                cubit.changeTextOption(newSelection.first);
              },
            ),
            12.height,
            if (state.textOption != ShareTextOption.none &&
                state.selectedShape != PaletteShape.none) ...[
              // Position Segmented Control
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SegmentedButton<ShareTextPosition>(
                  segments: [
                    ButtonSegment(
                      value: ShareTextPosition.top,
                      label: Text(l10n.textPositionTop),
                      icon: const Icon(Icons.vertical_align_top),
                    ),
                    ButtonSegment(
                      value: ShareTextPosition.bottom,
                      label: Text(l10n.textPositionBottom),
                      icon: const Icon(Icons.vertical_align_bottom),
                    ),
                    ButtonSegment(
                      value: ShareTextPosition.left,
                      label: Text(l10n.textPositionLeft),
                      icon: const Icon(Icons.align_horizontal_left),
                    ),
                    ButtonSegment(
                      value: ShareTextPosition.right,
                      label: Text(l10n.textPositionRight),
                      icon: const Icon(Icons.align_horizontal_right),
                    ),
                    ButtonSegment(
                      value: ShareTextPosition.inside,
                      label: Text(l10n.textPositionInside),
                      icon: const Icon(Icons.center_focus_strong),
                    ),
                  ],
                  selected: {state.textPosition},
                  onSelectionChanged: (Set<ShareTextPosition> newSelection) {
                    cubit.changeTextPosition(newSelection.first);
                  },
                ),
              ),
              12.height,
              // Size slider & styling buttons
              Row(
                children: [
                  const Icon(Icons.format_size),
                  Expanded(
                    child: Slider(
                      value: state.textSize,
                      min: 0.1,
                      max: 1.0,
                      onChanged: (v) => cubit.changeTextSize(v),
                    ),
                  ),
                  _buildStyleButton(
                    icon: Icons.format_bold,
                    isSelected: state.isTextBold,
                    onPressed: cubit.toggleTextBold,
                    primaryColor: primaryColor,
                  ),
                  _buildStyleButton(
                    icon: Icons.format_italic,
                    isSelected: state.isTextItalic,
                    onPressed: cubit.toggleTextItalic,
                    primaryColor: primaryColor,
                  ),
                  _buildStyleButton(
                    icon: Icons.format_underlined,
                    isSelected: state.isTextUnderline,
                    onPressed: cubit.toggleTextUnderline,
                    primaryColor: primaryColor,
                  ),
                ],
              ),
              12.height,
              // Text Color Picker
              SizedBox(
                height: 55,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    // Auto Color Option
                    Center(
                      child: GestureDetector(
                        onTap: () => cubit.changeTextColor(null),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade800,
                            border: state.textColor == null
                                ? Border.all(color: primaryColor, width: 2)
                                : null,
                          ),
                          child: const Icon(
                            Icons.auto_awesome,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    10.width,
                    // White
                    PaletteColorListItem(
                      color: Colors.white,
                      isSelected: state.textColor == Colors.white,
                      onTap: () => cubit.changeTextColor(Colors.white),
                    ),
                    10.width,
                    // Black
                    PaletteColorListItem(
                      color: Colors.black,
                      isSelected: state.textColor == Colors.black,
                      onTap: () => cubit.changeTextColor(Colors.black),
                    ),
                    10.width,
                    // Image Colors
                    ...colors.map(
                      (c) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: PaletteColorListItem(
                          color: c,
                          isSelected: state.textColor == c,
                          onTap: () => cubit.changeTextColor(c),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        );
      },
    );
  }

  Widget _buildStyleButton({
    required IconData icon,
    required bool isSelected,
    required VoidCallback onPressed,
    required Color primaryColor,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      color: isSelected ? primaryColor : Colors.grey,
      style: IconButton.styleFrom(
        backgroundColor: isSelected
            ? primaryColor.withValues(alpha: 0.2)
            : null,
      ),
    );
  }
}
