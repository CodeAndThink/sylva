import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sylva/core/constants/app_colors.dart';

class AppFileImage extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final BoxFit fit;
  const AppFileImage({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Image.file(
      File(path),
      width: width,
      height: height,
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
