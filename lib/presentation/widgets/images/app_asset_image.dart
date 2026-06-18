import 'package:flutter/material.dart';
import 'package:sylva/core/extensions/num_extensions.dart';

class AppAssetImage extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final BoxFit? fit;
  const AppAssetImage({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: 8.borderRadius,
          ),
          child: const Icon(Icons.error_outline, color: Colors.grey),
        );
      },
    );
  }
}
