import 'package:flutter/material.dart';

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
}
