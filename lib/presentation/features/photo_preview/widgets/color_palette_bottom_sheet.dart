import 'package:flutter/material.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/core/utils/app_feedback.dart';
import 'package:sylva/core/utils/color_utils.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/photo_preview/widgets/palette_color_list_item.dart';
import 'package:sylva/presentation/widgets/text/app_title_text.dart';

class ColorPaletteBottomSheet extends StatelessWidget {
  final List<Color> paletteColors;
  final List<Color> userColors;
  final ValueChanged<Color> onColorTap;
  final ValueChanged<Color> onColorLongPress;

  const ColorPaletteBottomSheet({
    super.key,
    required this.paletteColors,
    required this.userColors,
    required this.onColorTap,
    required this.onColorLongPress,
  });

  static Future<void> show({
    required BuildContext context,
    required List<Color> paletteColors,
    required List<Color> userColors,
    required ValueChanged<Color> onColorTap,
    required ValueChanged<Color> onColorLongPress,
  }) {
    return showModalBottomSheet(
      showDragHandle: true,
      context: context,
      isScrollControlled: true,
      builder: (_) => ColorPaletteBottomSheet(
        paletteColors: paletteColors,
        userColors: userColors,
        onColorTap: onColorTap,
        onColorLongPress: onColorLongPress,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = S.of(context);

    return SafeArea(
      child: Padding(
        padding: 12.paddingAll,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTitleText(title: l10n.autoDetectColors),
                    12.height,
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: paletteColors.map((color) {
                        final hex = ColorUtils.colorToHex(color: color);
                        return PaletteColorListItem(
                          color: color,
                          hex: hex,
                          isSelected: false,
                          onTap: () {
                            AppFeedback.playInteract(context);
                            onColorLongPress(color);
                          },
                          onLongPress: () {
                            AppFeedback.playLongInteract(context);
                            onColorLongPress(color);
                          },
                        );
                      }).toList(),
                    ),
                    24.height,
                    AppTitleText(title: l10n.myColors),
                    12.height,
                    userColors.isEmpty
                        ? Center(
                            child: Text(
                              l10n.useMagnifierToPickColors,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurface.withValues(
                                  alpha: 0.5,
                                ),
                              ),
                            ),
                          )
                        : Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: userColors.map((color) {
                              final hex = ColorUtils.colorToHex(color: color);
                              return PaletteColorListItem(
                                color: color,
                                hex: hex,
                                isSelected: false,
                                onTap: () {
                                  AppFeedback.playInteract(context);
                                  onColorLongPress(color);
                                },
                                onLongPress: () {
                                  AppFeedback.playLongInteract(context);
                                  onColorLongPress(color);
                                },
                              );
                            }).toList(),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
