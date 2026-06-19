import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/core/utils/color_utils.dart';
import 'package:sylva/presentation/features/photo_preview/photo_preview_cubit.dart';
import 'package:sylva/presentation/features/photo_preview/photo_preview_navigator.dart';
import 'package:sylva/presentation/features/photo_preview/photo_preview_state.dart';
import 'package:sylva/presentation/features/photo_preview/widgets/palette_color_list_item.dart';
import 'package:sylva/presentation/widgets/images/app_file_image.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';

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
  ValueNotifier<bool> showColorList = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
    _cubit = context.read<PhotoPreviewCubit>();
    _cubit.extractPalette(widget.imagePath);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(showAppBar: false, body: _buildBody());
  }

  Widget _buildBody() {
    return SafeArea(
      child: Padding(
        padding: 12.paddingAll,
        child: Column(
          children: [
            Expanded(child: _buildPhotoWidget()),
            12.height,
            _buildBottomActions(),
          ],
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

          return SizedBox(
            width: double.maxFinite,
            child: Stack(
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
                      child: BlocBuilder<PhotoPreviewCubit, PhotoPreviewState>(
                        buildWhen: (previous, current) =>
                            current.filteredImageBytes !=
                            previous.filteredImageBytes,
                        builder: (context, state) {
                          if (state.filteredImageBytes != null) {
                            return Image.memory(
                              state.filteredImageBytes!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            );
                          }
                          return AppFileImage(
                            path: widget.imagePath,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Positioned(bottom: 12, right: 12, child: _buildColorSet()),
                // Filter Loading Overlay
                _buildColorOverlay(),
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
            ),
          );
        },
      ),
    );
  }

  Widget _buildColorSet() {
    return BlocBuilder<PhotoPreviewCubit, PhotoPreviewState>(
      buildWhen: (previous, current) =>
          current.getColorStatus != previous.getColorStatus ||
          current.filterColorStatus != previous.filterColorStatus ||
          current.selectedColor != previous.selectedColor,
      builder: (context, state) {
        if (state.getColorStatus.isLoading) {
          return const CircularProgressIndicator(color: Colors.white);
        }
        if (state.getColorStatus.isFailure) {
          return Container(
            padding: 8.paddingAll,
            color: Colors.black54,
            child: const Text(
              'Failed to load colors',
              style: TextStyle(color: Colors.red),
            ),
          );
        }
        return ValueListenableBuilder(
          valueListenable: showColorList,
          builder: (context, show, child) {
            return Container(
              width: 75,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.6),
                borderRadius: 12.borderRadius,
              ),
              child: AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOutCubic,
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (show) ...[
                      Padding(
                        padding: 8.paddingHorizontal.copyWith(top: 8),
                        child: Column(
                          spacing: 8,
                          mainAxisSize: MainAxisSize.min,
                          children: state.paletteColors.map((color) {
                            final hex = ColorUtils.colorToHex(color: color);
                            return PaletteColorListItem(
                              color: color,
                              hex: hex,
                              isSelected: state.selectedColor == color,
                              onTap: () {
                                _cubit.filterColor(widget.imagePath, color);
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: 12.borderRadiusBottom,
                        child: Material(
                          color: Colors.transparent,
                          child: SizedBox(
                            width: 75,
                            child: InkWell(
                              onTap: () {
                                showColorList.value = false;
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.0),
                                child: Icon(
                                  Icons.expand_less_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ] else ...[
                      ClipRRect(
                        borderRadius: 12.borderRadius,
                        child: Material(
                          color: Colors.transparent,
                          child: SizedBox(
                            width: 75,
                            child: InkWell(
                              onTap: () {
                                showColorList.value = true;
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Icon(
                                  Icons.expand_more_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildColorOverlay() {
    return BlocBuilder<PhotoPreviewCubit, PhotoPreviewState>(
      buildWhen: (previous, current) =>
          current.filterColorStatus != previous.filterColorStatus,
      builder: (context, state) {
        if (state.filterColorStatus.isLoading) {
          return Positioned.fill(
            child: Container(
              color: Colors.black.withValues(alpha: 0.8),
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildBottomActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            _cubit.navigator.safePop();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 36),
        ),
        48.width,
        IconButton(
          onPressed: () {
            _cubit.navigator.safePop();
          },
          icon: const Icon(Icons.save, color: Colors.white, size: 36),
        ),
      ],
    );
  }
}
