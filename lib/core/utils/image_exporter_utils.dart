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
    required double shapeSize,
    required double shapeSpacing,
    required double shapeMargin,
    required ShareTextOption textOption,
    required ShareTextPosition textPosition,
    required double textSize,
    required bool isTextBold,
    required bool isTextItalic,
    required bool isTextUnderline,
    Color? textColor,
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
        _drawOverlay(
          canvas,
          width,
          height,
          shape,
          position,
          direction,
          colors,
          shapeSize,
          shapeSpacing,
          shapeMargin,
          textOption,
          textPosition,
          textSize,
          isTextBold,
          isTextItalic,
          isTextUnderline,
          textColor,
        );
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
    double shapeSizeState,
    double shapeSpacingState,
    double shapeMarginState,
    ShareTextOption textOption,
    ShareTextPosition textPosition,
    double textSizeState,
    bool isTextBold,
    bool isTextItalic,
    bool isTextUnderline,
    Color? textColorState,
  ) {
    if (colors.isEmpty) {
      colors = [Colors.white, Colors.white, Colors.white];
    }
    final int colorCount = colors.length;

    // Determine scale based on image size and selected size.
    final boxSize = imageWidth * shapeSizeState;

    // Draw background container
    final isVertical = direction == PaletteDirection.vertical;
    final padding = boxSize * 0.2;
    final spacing = boxSize * shapeSpacingState;
    final shapeSize = boxSize - padding * 2;

    // Calculate shape actual dimensions
    double shapeWidth = shapeSize;
    double shapeHeight = shapeSize;
    if (shape == PaletteShape.capsule) {
      shapeWidth = shapeSize * 1.5;
      shapeHeight = shapeSize * 0.8;
    } else if (shape == PaletteShape.diamond) {
      shapeWidth = shapeSize * 0.7 + 4;
      shapeHeight = shapeSize * 0.7 + 4;
    }

    // Calculate text dimensions if text is enabled
    double textHeight = 0;
    double textWidth = 0;
    ui.Paragraph? sampleParagraph;
    if (textOption != ShareTextOption.none) {
      final actualFontSize = shapeSize * (0.08 + textSizeState * 0.16);
      ui.TextStyle textStyle = ui.TextStyle(
        color: Colors.white,
        fontSize: actualFontSize,
        fontWeight: isTextBold ? FontWeight.bold : FontWeight.normal,
        fontStyle: isTextItalic ? FontStyle.italic : FontStyle.normal,
        decoration: isTextUnderline
            ? TextDecoration.underline
            : TextDecoration.none,
      );
      final paragraphStyle = ui.ParagraphStyle(textAlign: TextAlign.center);
      final paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
        ..pushStyle(textStyle)
        ..addText('#FFFFFF'); // dummy text for measurement
      sampleParagraph = paragraphBuilder.build()
        ..layout(ui.ParagraphConstraints(width: double.infinity));
      textHeight = sampleParagraph.height;
      textWidth = sampleParagraph.maxIntrinsicWidth;
    }

    double blockWidth = shapeWidth;
    double blockHeight = shapeHeight;
    if (textOption != ShareTextOption.none) {
      if (textPosition == ShareTextPosition.top ||
          textPosition == ShareTextPosition.bottom) {
        blockHeight = shapeHeight + textHeight + 4;
        blockWidth = shapeWidth > textWidth ? shapeWidth : textWidth;
      } else if (textPosition == ShareTextPosition.left ||
          textPosition == ShareTextPosition.right) {
        blockWidth = shapeWidth + textWidth + 4;
        blockHeight = shapeHeight > textHeight ? shapeHeight : textHeight;
      }
    }

    final containerWidth = isVertical
        ? blockWidth
        : (blockWidth * colorCount + spacing * (colorCount - 1));
    final containerHeight = isVertical
        ? (blockHeight * colorCount + spacing * (colorCount - 1))
        : blockHeight;

    // Position
    double dx = 0;
    double dy = 0;
    final margin = imageWidth * (0.01 + shapeMarginState * 0.2);

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

    // Background removed as per user request

    // Draw shapes
    for (int i = 0; i < colorCount; i++) {
      final sDx =
          dx +
          (isVertical
              ? (blockWidth - shapeWidth) / 2
              : i * (blockWidth + spacing) + (blockWidth - shapeWidth) / 2);
      final sDy =
          dy +
          (isVertical
              ? i * (blockHeight + spacing) + (blockHeight - shapeHeight) / 2
              : (blockHeight - shapeHeight) / 2);
      _drawShapeWithText(
        canvas,
        sDx,
        sDy,
        shapeSize,
        shapeWidth,
        shapeHeight,
        shape,
        colors[i],
        textOption,
        textPosition,
        textSizeState,
        isTextBold,
        isTextItalic,
        isTextUnderline,
        textColorState,
      );
    }
  }

  static void _drawShapeWithText(
    Canvas canvas,
    double x,
    double y,
    double size,
    double shapeWidth,
    double shapeHeight,
    PaletteShape shape,
    Color color,
    ShareTextOption textOption,
    ShareTextPosition textPosition,
    double textSizeState,
    bool isTextBold,
    bool isTextItalic,
    bool isTextUnderline,
    Color? textColorState,
  ) {
    if (textOption == ShareTextOption.none) {
      _drawShape(canvas, x, y, size, shapeWidth, shapeHeight, shape, color);
      return;
    }

    String textStr = '';
    if (textOption == ShareTextOption.hex) {
      textStr =
          '#${(color.toARGB32() & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
    } else if (textOption == ShareTextOption.rgba) {
      textStr =
          'rgba(${(color.r * 255).round()}, ${(color.g * 255).round()}, ${(color.b * 255).round()}, ${color.a.toStringAsFixed(1)})';
    }

    // Let's use proportional font size based on the shape size.
    final actualFontSize = size * (0.08 + textSizeState * 0.16);

    final textColor = textColorState ?? Colors.white;

    ui.TextStyle textStyle = ui.TextStyle(
      color: textColor,
      fontSize: actualFontSize,
      fontWeight: isTextBold ? FontWeight.bold : FontWeight.normal,
      fontStyle: isTextItalic ? FontStyle.italic : FontStyle.normal,
      decoration: isTextUnderline
          ? TextDecoration.underline
          : TextDecoration.none,
      decorationColor: textColor,
    );

    final paragraphStyle = ui.ParagraphStyle(textAlign: TextAlign.center);
    final paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
      ..pushStyle(textStyle)
      ..addText(textStr);
    final paragraph = paragraphBuilder.build()
      ..layout(ui.ParagraphConstraints(width: double.infinity));

    double textDx = x;
    double textDy = y;

    if (textPosition == ShareTextPosition.top) {
      textDx = x + (shapeWidth - paragraph.maxIntrinsicWidth) / 2;
      textDy = y - paragraph.height - 4;
      canvas.drawParagraph(paragraph, Offset(textDx, textDy));
      _drawShape(canvas, x, y, size, shapeWidth, shapeHeight, shape, color);
    } else if (textPosition == ShareTextPosition.bottom) {
      textDx = x + (shapeWidth - paragraph.maxIntrinsicWidth) / 2;
      textDy = y + shapeHeight + 4;
      _drawShape(canvas, x, y, size, shapeWidth, shapeHeight, shape, color);
      canvas.drawParagraph(paragraph, Offset(textDx, textDy));
    } else if (textPosition == ShareTextPosition.left) {
      textDx = x - paragraph.maxIntrinsicWidth - 4;
      textDy = y + (shapeHeight - paragraph.height) / 2;
      canvas.drawParagraph(paragraph, Offset(textDx, textDy));
      _drawShape(canvas, x, y, size, shapeWidth, shapeHeight, shape, color);
    } else if (textPosition == ShareTextPosition.right) {
      textDx = x + shapeWidth + 4;
      textDy = y + (shapeHeight - paragraph.height) / 2;
      _drawShape(canvas, x, y, size, shapeWidth, shapeHeight, shape, color);
      canvas.drawParagraph(paragraph, Offset(textDx, textDy));
    } else if (textPosition == ShareTextPosition.inside) {
      _drawShape(canvas, x, y, size, shapeWidth, shapeHeight, shape, color);
      final brightness = ThemeData.estimateBrightnessForColor(color);
      final insideTextColor =
          textColorState ??
          (brightness == Brightness.dark ? Colors.white : Colors.black);

      final insideTextStyle = ui.TextStyle(
        color: insideTextColor,
        fontSize: actualFontSize,
        fontWeight: isTextBold ? FontWeight.bold : FontWeight.normal,
        fontStyle: isTextItalic ? FontStyle.italic : FontStyle.normal,
        decoration: isTextUnderline
            ? TextDecoration.underline
            : TextDecoration.none,
        decorationColor: insideTextColor,
      );

      final insideParagraphStyle = ui.ParagraphStyle(
        textAlign: TextAlign.center,
        maxLines: 1,
        ellipsis: '...',
      );

      final pb = ui.ParagraphBuilder(insideParagraphStyle)
        ..pushStyle(insideTextStyle)
        ..addText(textStr);

      final maxWidth = size * 0.9;
      final p = pb.build()..layout(ui.ParagraphConstraints(width: maxWidth));

      textDx = x + (shapeWidth - p.width) / 2;
      textDy = y + (shapeHeight - p.height) / 2;
      canvas.drawParagraph(p, Offset(textDx, textDy));
    }
  }

  static void _drawShape(
    Canvas canvas,
    double x,
    double y,
    double size,
    double shapeWidth,
    double shapeHeight,
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
            Radius.circular(size * 0.15),
          ),
          paint,
        );
        break;
      case PaletteShape.capsule:
        final w = size * 1.5;
        final h = size * 0.8;
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(x, y, w, h),
            Radius.circular(size),
          ),
          paint,
        );
        break;
      case PaletteShape.diamond:
        canvas.save();
        canvas.translate(x + shapeWidth / 2, y + shapeHeight / 2);
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
