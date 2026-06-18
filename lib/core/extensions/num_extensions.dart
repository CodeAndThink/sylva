import 'dart:math';
import 'package:flutter/material.dart';

extension NumExtensions on num {
  /// Create a [BorderRadius] with the given radius.
  BorderRadius get borderRadius => BorderRadius.circular(toDouble());

  BorderRadius get borderRadiusTop => BorderRadius.only(
    topLeft: Radius.circular(toDouble()),
    topRight: Radius.circular(toDouble()),
  );

  BorderRadius get borderRadiusBottom => BorderRadius.only(
    bottomLeft: Radius.circular(toDouble()),
    bottomRight: Radius.circular(toDouble()),
  );

  BorderRadius get borderRadiusLeft => BorderRadius.only(
    topLeft: Radius.circular(toDouble()),
    bottomLeft: Radius.circular(toDouble()),
  );

  BorderRadius get borderRadiusRight => BorderRadius.only(
    topRight: Radius.circular(toDouble()),
    bottomRight: Radius.circular(toDouble()),
  );

  Radius get radius => Radius.circular(toDouble());

  /// Create a [SizedBox] with the given height.
  SizedBox get height => SizedBox(height: toDouble());

  /// Create a [SizedBox] with the given width.
  SizedBox get width => SizedBox(width: toDouble());

  /// Create a [EdgeInsets] with the given padding.
  EdgeInsets get padding => EdgeInsets.all(toDouble());

  /// Create a [EdgeInsets] with the given padding.
  EdgeInsets get paddingAll => EdgeInsets.all(toDouble());

  EdgeInsets get paddingBottom => EdgeInsets.only(bottom: toDouble());

  EdgeInsets get paddingTop => EdgeInsets.only(top: toDouble());

  EdgeInsets get paddingLeft => EdgeInsets.only(left: toDouble());

  EdgeInsets get paddingRight => EdgeInsets.only(right: toDouble());

  /// Create a [EdgeInsets] with the given padding.
  EdgeInsets get paddingHorizontal =>
      EdgeInsets.symmetric(horizontal: toDouble());

  /// Create a [EdgeInsets] with the given padding.
  EdgeInsets get paddingVertical => EdgeInsets.symmetric(vertical: toDouble());

  /// Create a [SizedBox] with both given width and height.
  SizedBox square({Widget? child}) =>
      SizedBox(width: toDouble(), height: toDouble(), child: child);

  /// Create a [Duration] with the given milliseconds.
  Duration get milliseconds => Duration(milliseconds: toInt());

  Duration get seconds => Duration(seconds: toInt());

  Duration get minutes => Duration(minutes: toInt());

  Duration get hours => Duration(hours: toInt());

  Duration get days => Duration(days: toInt());

  /// Formats the number as bytes (e.g., 1024 -> "1.00 KB").
  String formatBytes([int decimals = 2]) {
    if (this <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(this) / log(1024)).floor();
    return '${(this / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }
}
