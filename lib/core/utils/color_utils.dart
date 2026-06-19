import 'package:flutter/material.dart';

class ColorUtils {
  ColorUtils._();

  static String colorToHex({required Color color}) {
    return '#${color.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';
  }
}
