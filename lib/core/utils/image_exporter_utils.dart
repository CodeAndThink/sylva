import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:sylva/core/enums/template_enums.dart';

class ImageExporterUtils {
  static Future<File?> exportImageWithOverlay({
    required String imagePath,
    required PaletteShape shape,
    required PalettePosition position,
    required PaletteDirection direction,
    required List<Color> colors,
  }) async {
    try {
      // 1. Load image
      final file = File(imagePath);
      final bytes = await file.readAsBytes();
      final codec = await ui.instantiateImageCodec(bytes);
      final frame = await codec.getNextFrame();
      final image = frame.image;

      final width = image.width.toDouble();
      final height = image.height.toDouble();

      // 2. Setup canvas
      final recorder = ui.PictureRecorder();
      final canvas = Canvas(recorder);
      final paint = Paint();

      // Draw original image
      canvas.drawImage(image, Offset.zero, paint);

      if (shape != PaletteShape.none) {
        _drawOverlay(canvas, width, height, shape, position, direction, colors);
      }

      // 3. Export
      final picture = recorder.endRecording();
      final finalImage = await picture.toImage(image.width, image.height);
      final finalBytes = await finalImage.toByteData(
        format: ui.ImageByteFormat.png,
      );

      if (finalBytes == null) return null;

      // 4. Save to temporary file
      final tempDir = Directory.systemTemp;
      final tempFile = File(
        '${tempDir.path}/exported_${DateTime.now().millisecondsSinceEpoch}.png',
      );
      await tempFile.writeAsBytes(finalBytes.buffer.asUint8List());

      return tempFile;
    } catch (e) {
      debugPrint('Export error: $e');
      return null;
    }
  }

  static void _drawOverlay(
    Canvas canvas,
    double imageWidth,
    double imageHeight,
    PaletteShape shape,
    PalettePosition position,
    PaletteDirection direction,
    List<Color> colors,
  ) {
    if (colors.isEmpty) {
      colors = [Colors.white, Colors.white, Colors.white];
    }
    final colorsToDraw = [
      colors[0 % colors.length],
      colors.length > 1 ? colors[1 % colors.length] : colors[0],
      colors.length > 2 ? colors[2 % colors.length] : colors[0],
    ];

    // Determine scale based on image size. E.g., 20% of image width.
    final boxSize = imageWidth * 0.2;

    // Draw background container
    final isVertical = direction == PaletteDirection.vertical;
    final padding = boxSize * 0.2;
    final spacing = boxSize * 0.2;
    final shapeSize = boxSize - padding * 2;

    final containerWidth = isVertical
        ? boxSize
        : (boxSize * 3 + spacing * 2 - padding * 4);
    final containerHeight = isVertical
        ? (boxSize * 3 + spacing * 2 - padding * 4)
        : boxSize;

    // Position
    double dx = 0;
    double dy = 0;
    final margin = imageWidth * 0.05;

    switch (position) {
      case PalettePosition.topLeft:
        dx = margin;
        dy = margin;
        break;
      case PalettePosition.topCenter:
        dx = (imageWidth - containerWidth) / 2;
        dy = margin;
        break;
      case PalettePosition.topRight:
        dx = imageWidth - containerWidth - margin;
        dy = margin;
        break;
      case PalettePosition.centerLeft:
        dx = margin;
        dy = (imageHeight - containerHeight) / 2;
        break;
      case PalettePosition.center:
        dx = (imageWidth - containerWidth) / 2;
        dy = (imageHeight - containerHeight) / 2;
        break;
      case PalettePosition.centerRight:
        dx = imageWidth - containerWidth - margin;
        dy = (imageHeight - containerHeight) / 2;
        break;
      case PalettePosition.bottomLeft:
        dx = margin;
        dy = imageHeight - containerHeight - margin;
        break;
      case PalettePosition.bottomCenter:
        dx = (imageWidth - containerWidth) / 2;
        dy = imageHeight - containerHeight - margin;
        break;
      case PalettePosition.bottomRight:
        dx = imageWidth - containerWidth - margin;
        dy = imageHeight - containerHeight - margin;
        break;
    }

    // Draw background
    final bgPaint = Paint()
      ..color = Colors.black.withValues(
        alpha: 0.5,
      ); // equivalent to primaryContainer with opacity roughly
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(dx, dy, containerWidth, containerHeight),
        Radius.circular(boxSize * 0.1),
      ),
      bgPaint,
    );

    // Draw shapes
    for (int i = 0; i < 3; i++) {
      final sDx = dx + padding + (isVertical ? 0 : i * (shapeSize + spacing));
      final sDy = dy + padding + (isVertical ? i * (shapeSize + spacing) : 0);
      _drawShape(canvas, sDx, sDy, shapeSize, shape, colorsToDraw[i]);
    }
  }

  static void _drawShape(
    Canvas canvas,
    double x,
    double y,
    double size,
    PaletteShape shape,
    Color color,
  ) {
    final paint = Paint()..color = color;
    switch (shape) {
      case PaletteShape.circle:
        canvas.drawCircle(Offset(x + size / 2, y + size / 2), size / 2, paint);
        break;
      case PaletteShape.square:
        canvas.drawRect(Rect.fromLTWH(x, y, size, size), paint);
        break;
      case PaletteShape.roundedSquare:
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(x, y, size, size),
            Radius.circular(size * 0.25),
          ),
          paint,
        );
        break;
      case PaletteShape.capsule:
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(x + size * 0.25, y, size * 0.5, size),
            Radius.circular(size),
          ),
          paint,
        );
        break;
      case PaletteShape.card:
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(x + size * 0.15, y, size * 0.7, size),
            Radius.circular(size * 0.1),
          ),
          paint,
        );
        break;
      case PaletteShape.diamond:
        canvas.save();
        canvas.translate(x + size / 2, y + size / 2);
        canvas.rotate(45 * 3.14159 / 180);
        final dSize = size * 0.7;
        canvas.drawRect(
          Rect.fromLTWH(-dSize / 2, -dSize / 2, dSize, dSize),
          paint,
        );
        canvas.restore();
        break;
      case PaletteShape.none:
        break;
    }
  }
}
