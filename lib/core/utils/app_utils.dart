import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

/// General utility functions for the application.
class AppUtils {
  AppUtils._();

  /// Returns a singleton instance of [AppUtils].
  static AppUtils get instance => AppUtils._();

  /// Formats byte sizes into human-readable strings (e.g., KB, MB, GB).
  static String formatBytes(int bytes, {int decimals = 2}) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB"];
    var i = (log(bytes) / log(1024)).floor();
    return "${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}";
  }

  /// Opens the device's gallery and allows the user to pick an image.
  static Future<XFile?> pickImage() async {
    try {
      return await ImagePicker().pickImage(source: ImageSource.gallery);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  /// Detects the file extension (jpg, png, gif, webp) based on the image's magic bytes.
  static String detectExtension(Uint8List bytes) {
    if (bytes.length >= 3 &&
        bytes[0] == 0xFF &&
        bytes[1] == 0xD8 &&
        bytes[2] == 0xFF) {
      return '.jpg';
    }
    if (bytes.length >= 8 &&
        bytes[0] == 0x89 &&
        bytes[1] == 0x50 &&
        bytes[2] == 0x4E &&
        bytes[3] == 0x47 &&
        bytes[4] == 0x0D &&
        bytes[5] == 0x0A &&
        bytes[6] == 0x1A &&
        bytes[7] == 0x0A) {
      return '.png';
    }
    if (bytes.length >= 3 &&
        bytes[0] == 0x47 &&
        bytes[1] == 0x49 &&
        bytes[2] == 0x46) {
      return '.gif';
    }
    if (bytes.length >= 12 &&
        bytes[0] == 0x52 &&
        bytes[1] == 0x49 &&
        bytes[2] == 0x46 &&
        bytes[3] == 0x46 &&
        bytes[8] == 0x57 &&
        bytes[9] == 0x45 &&
        bytes[10] == 0x42 &&
        bytes[11] == 0x50) {
      return '.webp';
    }
    return '.png';
  }

  /// Opens a URL using the appropriate launcher (in-app browser or external app).
  Future<void> openLink(String url) async {
    final uri = Uri.parse(url);
    try {
      if (Platform.isAndroid && uri.host.contains('play.google.com')) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else if (Platform.isAndroid && url.endsWith('pdf')) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
      }
    } catch (e) {
      debugPrint('Error opening link: $e');
    }
  }
}
