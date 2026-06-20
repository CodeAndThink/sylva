import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sylva/core/extensions/num_extensions.dart';

class AppSvgImage extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final BoxFit fit;
  final ColorFilter? colorFilter;

  const AppSvgImage({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.colorFilter,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: width,
      height: height,
      fit: fit,
      colorFilter: colorFilter,
      placeholderBuilder: (context) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: 8.borderRadius,
        ),
        child: Center(
          child: SizedBox(
            width: 16,
            height: 16,
            child: SpinKitRipple(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
    );
  }
}
