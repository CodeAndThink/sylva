import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/core/utils/color_utils.dart';
import 'package:sylva/presentation/features/photo_preview/photo_preview_cubit.dart';
import 'package:sylva/presentation/features/photo_preview/photo_preview_navigator.dart';
import 'package:sylva/presentation/features/photo_preview/photo_preview_state.dart';
import 'package:sylva/presentation/features/photo_preview/widgets/palette_color_list_item.dart';
import 'package:sylva/presentation/widgets/images/app_file_image.dart';

class PhotoPreviewPage extends StatelessWidget {
  final String imagePath;
  const PhotoPreviewPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          PhotoPreviewCubit(navigator: PhotoPreviewNavigator(context)),
      child: _PhotoPreviewChildPage(imagePath: imagePath),
    );
  }
}

class _PhotoPreviewChildPage extends StatefulWidget {
  final String imagePath;
  const _PhotoPreviewChildPage({required this.imagePath});

  @override
  State<_PhotoPreviewChildPage> createState() => __PhotoPreviewChildPageState();
}

class __PhotoPreviewChildPageState extends State<_PhotoPreviewChildPage> {
  late final PhotoPreviewCubit _cubit;
  bool _showMagnifier = false;
  Offset _touchPosition = Offset.zero;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<PhotoPreviewCubit>();
    _cubit.extractPalette(widget.imagePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: 12.paddingAll,
          child: Column(
            children: [
              Expanded(child: _buildPhotoWidget()),
              24.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      _cubit.navigator.safePop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                  48.width,
                  IconButton(
                    onPressed: () {
                      _cubit.navigator.safePop();
                    },
                    icon: const Icon(Icons.save, color: Colors.white, size: 36),
                  ),
                ],
              ),
              16.height,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoWidget() {
    return ClipRRect(
      borderRadius: 16.borderRadius,
      child: LayoutBuilder(
        builder: (context, constraints) {
          Offset? magnifierCenter;
          Offset? focalPointOffset;
          if (_showMagnifier) {
            final double radius = 60.0;
            final double offsetDistance = 100.0;

            magnifierCenter = _touchPosition.translate(0, -offsetDistance);
            if (magnifierCenter.dy - radius < 0) {
              magnifierCenter = _touchPosition.translate(offsetDistance, 0);
              if (magnifierCenter.dx + radius > constraints.maxWidth) {
                magnifierCenter = _touchPosition.translate(-offsetDistance, 0);
              }
            }
            focalPointOffset = _touchPosition - magnifierCenter;
          }

          return Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onLongPressStart: (details) {
                    setState(() {
                      _showMagnifier = true;
                      _touchPosition = details.localPosition;
                    });
                  },
                  onLongPressMoveUpdate: (details) {
                    setState(() {
                      _touchPosition = details.localPosition;
                    });
                  },
                  onLongPressEnd: (details) {
                    setState(() {
                      _showMagnifier = false;
                    });
                  },
                  child: InteractiveViewer(
                    child: AppFileImage(
                      path: widget.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: BlocBuilder<PhotoPreviewCubit, PhotoPreviewState>(
                  buildWhen: (previous, current) =>
                      current.getColorStatus != previous.getColorStatus,
                  builder: (context, state) {
                    if (state.getColorStatus.isLoading) {
                      return const CircularProgressIndicator(
                        color: Colors.white,
                      );
                    }
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: state.paletteColors.map((color) {
                        final hex = ColorUtils.colorToHex(color: color);
                        return PaletteColorListItem(
                          color: color,
                          hex: hex,
                          onTap: () {},
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
              if (_showMagnifier &&
                  magnifierCenter != null &&
                  focalPointOffset != null)
                Positioned(
                  left: magnifierCenter.dx - 60,
                  top: magnifierCenter.dy - 60,
                  child: RawMagnifier(
                    size: const Size(120, 120),
                    magnificationScale: 10.0,
                    focalPointOffset: focalPointOffset,
                    decoration: const MagnifierDecoration(
                      shape: CircleBorder(
                        side: BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
