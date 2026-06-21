import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/core/utils/color_utils.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/photo_preview/photo_preview_cubit.dart';
import 'package:sylva/presentation/features/photo_preview/photo_preview_navigator.dart';
import 'package:sylva/presentation/features/photo_preview/photo_preview_state.dart';
import 'package:sylva/presentation/features/photo_preview/widgets/color_palette_bottom_sheet.dart';
import 'package:sylva/presentation/features/photo_preview/widgets/palette_color_list_item.dart';
import 'package:sylva/presentation/features/photo_preview/widgets/palette_shimmer_list.dart';
import 'package:sylva/presentation/widgets/containers/app_transparent_container.dart';
import 'package:sylva/presentation/widgets/images/app_file_image.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';
import 'package:sylva/presentation/widgets/text/app_title_text.dart';

class PhotoPreviewPage extends StatelessWidget {
  final String imagePath;
  final List<Color>? initialColors;
  final Color? initialSelectedColor;

  const PhotoPreviewPage({
    super.key,
    required this.imagePath,
    this.initialColors,
    this.initialSelectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PhotoPreviewCubit(
        navigator: PhotoPreviewNavigator(context),
        initialColors: initialColors,
        initialSelectedColor: initialSelectedColor,
      ),
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
  final ValueNotifier<bool> _showMagnifier = ValueNotifier<bool>(false);
  final ValueNotifier<Offset> _touchPosition = ValueNotifier<Offset>(
    Offset.zero,
  );
  late ThemeData _theme;
  final GlobalKey _imageKey = GlobalKey();

  final PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
    _cubit = context.read<PhotoPreviewCubit>();
    _cubit.extractPalette(imagePath: widget.imagePath);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<Color?> _getColorAtPosition(Offset position) async {
    try {
      final BuildContext? context = _imageKey.currentContext;
      if (context == null) return null;

      final RenderObject? renderObject = context.findRenderObject();
      if (renderObject == null || renderObject is! RenderRepaintBoundary) {
        return null;
      }

      // Use devicePixelRatio for an accurate, high-res snapshot
      final double pixelRatio = MediaQuery.of(context).devicePixelRatio;
      final ui.Image image = await renderObject.toImage(pixelRatio: pixelRatio);
      final ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.rawRgba,
      );

      // IMPORTANT: dispose the image to prevent memory leaks!
      image.dispose();

      if (byteData == null) return null;

      // Adjust coordinates based on the pixel ratio used for the snapshot
      final int x = (position.dx * pixelRatio).toInt();
      final int y = (position.dy * pixelRatio).toInt();

      if (x < 0 || x >= image.width || y < 0 || y >= image.height) return null;

      final int byteOffset = (y * image.width + x) * 4;
      final int r = byteData.getUint8(byteOffset);
      final int g = byteData.getUint8(byteOffset + 1);
      final int b = byteData.getUint8(byteOffset + 2);
      final int a = byteData.getUint8(byteOffset + 3);

      return Color.fromARGB(a, r, g, b);
    } catch (e) {
      debugPrint('Error getting color at position: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return AppScaffold(showAppBar: false, body: _buildBody());
  }

  Widget _buildBody() {
    return AppScaffold(
      showAppBar: false,
      body: SafeArea(
        child: Padding(
          padding: 12.paddingAll,
          child: Column(
            children: [
              Expanded(child: _buildPhotoWidget()),
              _buildColorSet(),
              _buildBottomActions(),
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
          return SizedBox(
            width: double.maxFinite,
            child: Stack(
              children: [
                Positioned.fill(child: _buildImage()),
                BlocBuilder<PhotoPreviewCubit, PhotoPreviewState>(
                  buildWhen: (previous, current) =>
                      current.filteredImageBytes != previous.filteredImageBytes,
                  builder: (context, state) {
                    final isFiltering = state.filteredImageBytes != null;

                    if (isFiltering) {
                      return Positioned(
                        bottom: 50,
                        right: 8,
                        child: Tooltip(
                          message: S.of(context).cancel,
                          child: IconButton(
                            color: Colors.red,
                            onPressed: () {
                              if (state.selectedColor != null) {
                                _cubit.filterColor(
                                  widget.imagePath,
                                  state.selectedColor!,
                                );
                              }
                            },
                            icon: const Icon(Icons.close_rounded, size: 32),
                          ),
                        ),
                      );
                    }

                    return ValueListenableBuilder<bool>(
                      valueListenable: _showMagnifier,
                      builder: (context, showMagnifier, child) {
                        if (!showMagnifier) return const SizedBox.shrink();
                        return Positioned(
                          bottom: 50,
                          right: 8,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Tooltip(
                                message: S.of(context).saveColor,
                                child: IconButton(
                                  color: Colors.green,
                                  onPressed: () {
                                    if (_cubit.state.selectedColor != null) {
                                      _cubit.saveUserColor(
                                        color: _cubit.state.selectedColor!,
                                      );
                                    }
                                    _showMagnifier.value = false;
                                    _pageController.animateToPage(
                                      1,
                                      duration: 200.milliseconds,
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.check_circle_outline,
                                    size: 32,
                                  ),
                                ),
                              ),
                              Tooltip(
                                message: S.of(context).cancel,
                                child: IconButton(
                                  color: Colors.red,
                                  onPressed: () {
                                    _showMagnifier.value = false;
                                    _cubit.clearSelectedColor();
                                  },
                                  icon: const Icon(
                                    Icons.block_outlined,
                                    size: 32,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  right: 8,
                  child: _buildColorDetails(),
                ),
                // Filter Loading Overlay
                _buildColorOverlay(),
                ValueListenableBuilder<bool>(
                  valueListenable: _showMagnifier,
                  builder: (context, showMagnifier, child) {
                    if (!showMagnifier) return const SizedBox.shrink();

                    return ValueListenableBuilder<Offset>(
                      valueListenable: _touchPosition,
                      builder: (context, touchPos, child) {
                        final double radius = 60.0;
                        final double offsetDistance = 100.0;

                        Offset magnifierCenter = touchPos.translate(
                          0,
                          -offsetDistance,
                        );
                        if (magnifierCenter.dy - radius < 0) {
                          magnifierCenter = touchPos.translate(
                            offsetDistance,
                            0,
                          );
                          if (magnifierCenter.dx + radius >
                              constraints.maxWidth) {
                            magnifierCenter = touchPos.translate(
                              -offsetDistance,
                              0,
                            );
                          }
                        }

                        final double magnifierLeft = magnifierCenter.dx - 60;
                        final double magnifierTop = magnifierCenter.dy - 40;

                        final Offset actualMagnifierCenter = Offset(
                          magnifierLeft + radius,
                          magnifierTop + radius,
                        );
                        final Offset focalPointOffset =
                            touchPos - actualMagnifierCenter;

                        return Positioned(
                          left: magnifierLeft,
                          top: magnifierTop,
                          child: RawMagnifier(
                            size: const Size(120, 120),
                            magnificationScale: 10.0,
                            focalPointOffset: focalPointOffset,
                            decoration: MagnifierDecoration(
                              shape: CircleBorder(
                                side: BorderSide(
                                  color: _theme.colorScheme.surface,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: _showMagnifier,
                  builder: (context, showMagnifier, child) {
                    if (!showMagnifier) return const SizedBox.shrink();

                    return ValueListenableBuilder<Offset>(
                      valueListenable: _touchPosition,
                      builder: (context, touchPos, child) {
                        return Positioned(
                          left: touchPos.dx - 10,
                          top: touchPos.dy - 10,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: _theme.colorScheme.surface,
                                width: 2,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildImage() {
    return AppTransparentContainer(
      padding: EdgeInsets.zero,
      child: GestureDetector(
        onPanStart: (details) {
          if (_cubit.state.filteredImageBytes != null) return;
          _showMagnifier.value = true;
          _touchPosition.value = details.localPosition;
        },
        onPanUpdate: (details) {
          if (_cubit.state.filteredImageBytes != null) return;
          _touchPosition.value = details.localPosition;
        },
        onPanEnd: (_) async {
          if (_cubit.state.filteredImageBytes != null) return;
          final color = await _getColorAtPosition(_touchPosition.value);
          if (color != null) {
            _cubit.setSelectedColor(color: color);
          }
        },
        child: RepaintBoundary(
          key: _imageKey,
          child: BlocBuilder<PhotoPreviewCubit, PhotoPreviewState>(
            buildWhen: (previous, current) =>
                current.filteredImageBytes != previous.filteredImageBytes,
            builder: (context, state) {
              if (state.filteredImageBytes != null) {
                return Image.memory(
                  state.filteredImageBytes!,
                  fit: BoxFit.cover,
                );
              }
              return AppFileImage(path: widget.imagePath, fit: BoxFit.cover);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildColorSet() {
    return BlocBuilder<PhotoPreviewCubit, PhotoPreviewState>(
      buildWhen: (previous, current) =>
          current.getColorStatus != previous.getColorStatus ||
          current.filterColorStatus != previous.filterColorStatus ||
          current.selectedColor != previous.selectedColor ||
          previous.userColors != current.userColors,
      builder: (context, state) {
        if (state.getColorStatus.isLoading) {
          return SizedBox(
            key: const ValueKey('loading'),
            height: 120,
            child: PaletteShimmerList(),
          );
        } else if (state.getColorStatus.isFailure) {
          return Container(
            key: const ValueKey('failure'),
            padding: 8.paddingAll,
            child: Text(
              S.of(context).failedToLoadColors,
              style: _theme.textTheme.bodyMedium?.copyWith(color: Colors.red),
            ),
          );
        } else {
          return SizedBox(
            key: const ValueKey('loaded'),
            height: 120, // Enough height for title + list
            child: Row(
              children: [
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    scrollDirection: Axis.vertical,
                    children: [
                      // Page 1: Auto-detected colors
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: AppTitleText(
                                  title: S.of(context).autoDetectColors,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  ColorPaletteBottomSheet.show(
                                    context: context,
                                    paletteColors: _cubit.state.paletteColors,
                                    userColors: _cubit.state.userColors,
                                    onColorTap: (color) {
                                      _cubit.filterColor(
                                        widget.imagePath,
                                        color,
                                      );
                                      _showMagnifier.value = false;
                                    },
                                    onColorLongPress: (color) =>
                                        _cubit.copyColor(color),
                                  );
                                },
                                child: const Icon(Icons.zoom_out_map_outlined),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 80,
                            child: ListView.separated(
                              itemCount: state.paletteColors.length,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) => 10.width,
                              itemBuilder: (context, index) {
                                final color = state.paletteColors[index];
                                final hex = ColorUtils.colorToHex(color: color);
                                return PaletteColorListItem(
                                  color: color,
                                  hex: hex,
                                  isSelected: state.selectedColor == color,
                                  onTap: () {
                                    _cubit.filterColor(widget.imagePath, color);
                                    _showMagnifier.value = false;
                                  },
                                  onLongPress: () {
                                    _cubit.copyColor(color);
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      // Page 2: User-picked colors
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: AppTitleText(
                                  title: S.of(context).myColors,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  ColorPaletteBottomSheet.show(
                                    context: context,
                                    paletteColors: _cubit.state.paletteColors,
                                    userColors: _cubit.state.userColors,
                                    onColorTap: (color) {
                                      _cubit.filterColor(
                                        widget.imagePath,
                                        color,
                                      );
                                      _showMagnifier.value = false;
                                    },
                                    onColorLongPress: (color) =>
                                        _cubit.copyColor(color),
                                  );
                                },
                                child: const Icon(Icons.zoom_out_map_outlined),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 80,
                            child: state.userColors.isEmpty
                                ? Center(
                                    child: Text(
                                      S.of(context).useMagnifierToPickColors,
                                      style: _theme.textTheme.bodyMedium
                                          ?.copyWith(
                                            color: _theme.colorScheme.onSurface
                                                .withValues(alpha: 0.5),
                                          ),
                                    ),
                                  )
                                : ListView.separated(
                                    itemCount: state.userColors.length,
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, index) =>
                                        10.width,
                                    itemBuilder: (context, index) {
                                      final color = state.userColors[index];
                                      final hex = ColorUtils.colorToHex(
                                        color: color,
                                      );
                                      return PaletteColorListItem(
                                        color: color,
                                        hex: hex,
                                        isSelected:
                                            state.selectedColor == color,
                                        onTap: () {
                                          _cubit.filterColor(
                                            widget.imagePath,
                                            color,
                                          );
                                          _showMagnifier.value = false;
                                        },
                                        onLongPress: () {
                                          _cubit.copyColor(color);
                                        },
                                      );
                                    },
                                  ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                8.width,
                Center(
                  child: AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, child) {
                      final double page =
                          (_pageController.hasClients &&
                              _pageController.positions.length == 1)
                          ? _pageController.page ?? 0
                          : 0;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(2, (index) {
                          final isSelected = (page.round() == index);
                          return AnimatedContainer(
                            duration: 200.milliseconds,
                            margin: 4.paddingVertical,
                            width: isSelected ? 8 : 6,
                            height: isSelected ? 8 : 6,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isSelected
                                  ? _theme.colorScheme.primary
                                  : _theme.colorScheme.onSurface.withValues(
                                      alpha: 0.3,
                                    ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
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
              color: Colors.black45,
              child: Center(
                child: SpinKitRipple(
                  color: _theme.colorScheme.primary,
                  size: MediaQuery.sizeOf(context).width * 0.5,
                ),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildColorDetails() {
    return BlocBuilder<PhotoPreviewCubit, PhotoPreviewState>(
      buildWhen: (previous, current) =>
          current.selectedColor != previous.selectedColor,
      builder: (context, state) {
        final color = state.selectedColor;

        return AppTransparentContainer(
          height: 38,
          padding: 8.paddingHorizontal,
          onTap: () {
            _cubit.copyColorToClipboard(color: color);
          },
          borderRadius: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildColorDetailItem(
                label: 'R',
                value: ((color?.r ?? 0.0) * 255.0).round().clamp(0, 255),
                labelColor: Colors.red,
              ),
              _buildColorDetailItem(
                label: 'G',
                value: ((color?.g ?? 0.0) * 255.0).round().clamp(0, 255),
                labelColor: Colors.green,
              ),
              _buildColorDetailItem(
                label: 'B',
                value: ((color?.b ?? 0.0) * 255.0).round().clamp(0, 255),
                labelColor: Colors.blue,
              ),
              _buildColorDetailItem(
                label: 'A',
                value: ((color?.a ?? 0.0) * 255.0).round().clamp(0, 255),
                labelColor: Theme.of(context).colorScheme.onSurface,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildColorDetailItem({
    required String label,
    required int value,
    required Color labelColor,
  }) {
    return Row(
      children: [
        Container(height: 12, width: 12, color: labelColor),
        4.width,
        Text(
          label,
          style: _theme.textTheme.titleSmall?.copyWith(color: labelColor),
        ),

        4.width,
        Text(value.toString(), style: _theme.textTheme.titleSmall),
      ],
    );
  }

  Widget _buildBottomActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Tooltip(
          message: S.of(context).back,
          child: IconButton(
            onPressed: () {
              _cubit.navigator.safePop();
            },
            icon: const Icon(Icons.navigate_before_rounded, size: 36),
          ),
        ),
        48.width,
        Tooltip(
          message: S.of(context).save,
          child: IconButton(
            onPressed: () {
              _cubit.saveHistory(imagePath: widget.imagePath);
            },
            icon: const Icon(Icons.save_outlined, size: 30),
          ),
        ),
        48.width,
        Tooltip(
          message: S.of(context).saveToLibrary,
          child: IconButton(
            onPressed: () => _cubit.saveToLibrary(imagePath: widget.imagePath),
            icon: Icon(Icons.library_add_outlined, size: 28),
          ),
        ),
      ],
    );
  }
}
