import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:photo_manager/photo_manager.dart';

class FileUtils {
  static String formatBytes(int bytes, {int decimals = 1}) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  static Future<bool> saveImageToLibrary({
    required Uint8List bytes,
    String titlePrefix = 'sylva',
    String extension = '.jpg',
  }) async {
    try {
      final filename =
          '${titlePrefix}_${DateTime.now().millisecondsSinceEpoch}$extension';
      await PhotoManager.editor.saveImage(bytes, filename: filename);
      return true;
    } catch (e) {
      debugPrint('Error saving image to library: $e');
      return false;
    }
  }
}
