import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:sylva/generated/l10n.dart';

class ColorUtils {
  ColorUtils._();

  static String colorToHex({required Color color}) {
    return '#${color.toARGB32().toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';
  }

  static String colorToRgba({required Color color}) {
    final r = (color.r * 255.0).round().clamp(0, 255);
    final g = (color.g * 255.0).round().clamp(0, 255);
    final b = (color.b * 255.0).round().clamp(0, 255);
    final a = double.parse(color.a.toStringAsFixed(2));
    final aStr = a == a.toInt() ? a.toInt().toString() : a.toString();
    return 'rgba($r, $g, $b, $aStr)';
  }

  static Future<Color?> showColorPicker(
    BuildContext context, {
    required Color initialColor,
  }) async {
    Color newColor = initialColor;
    final bool confirmed =
        await ColorPicker(
          color: initialColor,
          onColorChanged: (Color color) {
            newColor = color;
          },
          width: 40,
          height: 40,
          borderRadius: 4,
          spacing: 5,
          runSpacing: 5,
          wheelDiameter: 155,
          heading: Text(
            S.of(context).colorPickerSelectColor,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          subheading: Text(
            S.of(context).colorPickerSelectShade,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          wheelSubheading: Text(
            S.of(context).colorPickerShades,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          showMaterialName: true,
          showColorName: true,
          showColorCode: true,
          copyPasteBehavior: const ColorPickerCopyPasteBehavior(
            longPressMenu: true,
          ),
          pickersEnabled: const <ColorPickerType, bool>{
            ColorPickerType.both: false,
            ColorPickerType.primary: true,
            ColorPickerType.accent: true,
            ColorPickerType.bw: false,
            ColorPickerType.custom: false,
            ColorPickerType.wheel: true,
          },
        ).showPickerDialog(
          context,
          constraints: const BoxConstraints(
            minHeight: 460,
            minWidth: 300,
            maxWidth: 320,
          ),
        );

    if (confirmed) {
      return newColor;
    }
    return null;
  }
}
