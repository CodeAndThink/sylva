import 'package:flutter/cupertino.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

class AppAssetEntityImage extends StatelessWidget {
  final AssetEntity? assetEntity;
  final ThumbnailSize thumbnailSize;
  final bool isOriginal;
  final BoxFit fit;
  final Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;

  const AppAssetEntityImage({
    super.key,
    this.assetEntity,
    this.thumbnailSize = const ThumbnailSize.square(100),
    this.isOriginal = false,
    this.fit = BoxFit.cover,
    this.errorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    if (assetEntity == null) {
      return const SizedBox.shrink();
    }
    return AssetEntityImage(
      assetEntity!,
      thumbnailSize: thumbnailSize,
      isOriginal: isOriginal,
      fit: fit,
      errorBuilder:
          errorBuilder ??
          (context, error, stackTrace) {
            return const SizedBox.shrink();
          },
    );
  }
}
