import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:share_plus/share_plus.dart';
import 'package:sylva/core/configs/app_configs.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUtils {
  AppUtils._();

  static AppUtils get instance => AppUtils._();

  static String formatBytes(int bytes, {int decimals = 2}) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB"];
    var i = (log(bytes) / log(1024)).floor();
    return "${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}";
  }

  /// Calculate current Level based on total deleted photos/videos
  static int getLevelFromCount(int totalCount) {
    for (int i = AppConfigs.levelMilestones.length - 1; i >= 0; i--) {
      if (totalCount >= AppConfigs.levelMilestones[i]) {
        return i + 1;
      }
    }
    return 1;
  }

  /// Calculate the progression percentage of current Level (from 0.0 to 1.0)
  static double getLevelProgress(int totalCount) {
    final currentLevel = getLevelFromCount(totalCount);

    // If reached max level in config
    if (currentLevel >= AppConfigs.levelMilestones.length) {
      return 1.0;
    }

    final currentMilestone = AppConfigs.levelMilestones[currentLevel - 1];
    final nextMilestone = AppConfigs.levelMilestones[currentLevel];

    final progress =
        (totalCount - currentMilestone) / (nextMilestone - currentMilestone);
    return progress.clamp(0.0, 1.0);
  }

  /// Get the number of additional photos to delete to reach next level
  static int getPhotosToNextLevel(int totalCount) {
    final currentLevel = getLevelFromCount(totalCount);
    if (currentLevel >= AppConfigs.levelMilestones.length) return 0;

    return (AppConfigs.levelMilestones[currentLevel] - totalCount).toInt();
  }

  /// Get the target milestone (number of photos) of next level
  static double getNextMilestone(int totalCount) {
    final currentLevel = getLevelFromCount(totalCount);
    if (currentLevel >= AppConfigs.levelMilestones.length) {
      return AppConfigs.levelMilestones.last;
    }
    return AppConfigs.levelMilestones[currentLevel];
  }

  static Future<XFile?> pickImage() async {
    try {
      return await ImagePicker().pickImage(source: ImageSource.gallery);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  /// Save image bytes to temp directory and open system share sheet
  // static Future<void> shareImage(
  //   Uint8List imageBytes, {
  //   String? fileName,
  // }) async {
  //   try {
  //     final tempDir = await getTemporaryDirectory();
  //     final ext = _detectExtension(imageBytes);
  //     final name =
  //         fileName ??
  //         'shared_image_${DateTime.now().millisecondsSinceEpoch}$ext';
  //     final file = await File('${tempDir.path}/$name').create();
  //     await file.writeAsBytes(imageBytes);
  //     await SharePlus.instance.share(ShareParams(files: [XFile(file.path)]));
  //   } catch (e) {
  //     debugPrint('Error sharing image: $e');
  //   }
  // }

  static String _detectExtension(Uint8List bytes) {
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
