import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class FileUtils {
  static late String appDocDirPath;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    appDocDirPath = dir.path;
  }

  static Future<String> saveImageToAppDirectory(String sourcePath) async {
    final file = File(sourcePath);
    final filename = p.basename(sourcePath);
    final targetDir = Directory(p.join(appDocDirPath, 'sylva_images'));
    if (!await targetDir.exists()) {
      await targetDir.create(recursive: true);
    }
    final targetPath = p.join(targetDir.path, filename);

    if (sourcePath != targetPath) {
      if (await file.exists()) {
        await file.copy(targetPath);
      }
    }
    return p.join('sylva_images', filename);
  }

  static Future<Uint8List?> compressImageToBytes(
    String sourcePath, {
    int quality = 80,
  }) async {
    return await FlutterImageCompress.compressWithFile(
      sourcePath,
      quality: quality,
      // Keep original resolution, only reduce quality
    );
  }

  static Future<String> saveCompressedImageToAppDirectory(
    String sourcePath, {
    int quality = 80,
  }) async {
    final filename = p.basename(sourcePath);
    final targetDir = Directory(p.join(appDocDirPath, 'sylva_images'));
    if (!await targetDir.exists()) {
      await targetDir.create(recursive: true);
    }

    // Compression defaults to JPG format, change extension if needed
    final ext = p.extension(filename).toLowerCase();
    String newFilename = filename;
    if (ext != '.jpg' && ext != '.jpeg') {
      newFilename = '${p.basenameWithoutExtension(filename)}.jpg';
    }
    final targetPath = p.join(targetDir.path, newFilename);

    if (sourcePath != targetPath) {
      final compressedBytes = await compressImageToBytes(
        sourcePath,
        quality: quality,
      );
      if (compressedBytes != null) {
        final targetFile = File(targetPath);
        await targetFile.writeAsBytes(compressedBytes);
      } else {
        // Fallback: copy original file if compression fails
        final file = File(sourcePath);
        if (await file.exists()) {
          await file.copy(targetPath);
        }
        newFilename = filename; // Keep old filename since compression failed
      }
    }
    return p.join('sylva_images', newFilename);
  }

  static String getFullImagePath(String path) {
    if (p.isAbsolute(path)) {
      if (File(path).existsSync()) {
        return path;
      }
      return path; // Fallback to let UI show broken image or handle error
    }
    return p.join(appDocDirPath, path);
  }

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
