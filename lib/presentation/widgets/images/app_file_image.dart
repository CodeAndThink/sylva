import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sylva/core/constants/app_colors.dart';

class AppFileImage extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final int? cacheWidth;
  final int? cacheHeight;
  final BoxFit fit;
  final FilterQuality filterQuality;

  const AppFileImage({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.cacheWidth,
    this.cacheHeight,
    this.fit = BoxFit.cover,
    this.filterQuality = FilterQuality.low,
  });

  @override
  Widget build(BuildContext context) {
    return Image.file(
      File(path),
      width: width,
      height: height,
      cacheWidth: cacheWidth,
      filterQuality: filterQuality,
      cacheHeight: cacheHeight,
      fit: fit,
      errorBuilder: (_, _, _) => const Center(
        child: Icon(
          Icons.broken_image,
          size: 50,
          color: AppColors.placeholderText,
        ),
      ),
    );
  }
}
