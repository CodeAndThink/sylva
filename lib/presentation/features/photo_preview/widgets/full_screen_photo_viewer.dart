import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/presentation/widgets/images/app_file_image.dart';

class FullScreenPhotoViewer extends StatefulWidget {
  final String imagePath;
  final Uint8List? imageBytes;

  const FullScreenPhotoViewer({
    super.key,
    required this.imagePath,
    this.imageBytes,
  });

  static void show(
    BuildContext context, {
    required String imagePath,
    Uint8List? imageBytes,
  }) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black,
        pageBuilder: (context, animation, secondaryAnimation) =>
            FullScreenPhotoViewer(imagePath: imagePath, imageBytes: imageBytes),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  State<FullScreenPhotoViewer> createState() => _FullScreenPhotoViewerState();
}

class _FullScreenPhotoViewerState extends State<FullScreenPhotoViewer> {
  final TransformationController _transformationController =
      TransformationController();

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  void _updateZoom(double delta) {
    final double currentScale = _transformationController.value
        .getMaxScaleOnAxis();
    double targetScale = (currentScale + delta).clamp(1.0, 20.0);
    final double ratio = targetScale / currentScale;

    final Size size = MediaQuery.sizeOf(context);
    final Offset center = Offset(size.width / 2, size.height / 2);
    final Matrix4 matrix = _transformationController.value.clone();

    final Matrix4 scaleMatrix = Matrix4.identity()
      ..multiply(Matrix4.translationValues(center.dx, center.dy, 0.0))
      ..multiply(Matrix4.diagonal3Values(ratio, ratio, 1.0))
      ..multiply(Matrix4.translationValues(-center.dx, -center.dy, 0.0));

    _transformationController.value = scaleMatrix * matrix;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: InteractiveViewer(
                transformationController: _transformationController,
                minScale: 1.0,
                maxScale: 20.0,
                child: widget.imageBytes != null
                    ? Image.memory(widget.imageBytes!, fit: BoxFit.contain)
                    : AppFileImage(path: widget.imagePath, fit: BoxFit.contain),
              ),
            ),
            Positioned(
              bottom: 32,
              left: 12,
              right: 12,
              child: ValueListenableBuilder<Matrix4>(
                valueListenable: _transformationController,
                builder: (context, matrix, child) {
                  final double currentScale = matrix.getMaxScaleOnAxis();
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      40.width,
                      const Spacer(),
                      Material(
                        color: Colors.black54,
                        borderRadius: 20.borderRadius,
                        clipBehavior: Clip.hardEdge,
                        child: InkWell(
                          onTap: () => _updateZoom(-0.5),
                          child: Padding(
                            padding: 8.paddingAll,
                            child: Icon(Icons.remove, color: Colors.white),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.black54,
                        borderRadius: 25.borderRadius,
                        clipBehavior: Clip.hardEdge,
                        child: InkWell(
                          onTap: () {
                            _transformationController.value =
                                Matrix4.identity();
                          },
                          child: Container(
                            width: 50,
                            padding: 5.paddingAll,
                            child: Text(
                              '${currentScale.toStringAsFixed(1)}x',
                              textAlign: TextAlign.center,
                              style: theme.textTheme.titleSmall?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.black54,
                        borderRadius: 20.borderRadius,
                        clipBehavior: Clip.hardEdge,
                        child: InkWell(
                          onTap: () => _updateZoom(0.5),
                          child: Padding(
                            padding: 8.paddingAll,
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Material(
                        color: Colors.black54,
                        borderRadius: 20.borderRadius,
                        clipBehavior: Clip.hardEdge,
                        child: InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: Padding(
                            padding: 8.paddingAll,
                            child: Icon(
                              Icons.zoom_in_map_rounded,
                              size: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
