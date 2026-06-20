import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/core/utils/color_utils.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/photo_preview/photo_preview_cubit.dart';
import 'package:sylva/presentation/features/photo_preview/photo_preview_navigator.dart';
import 'package:sylva/presentation/features/photo_preview/photo_preview_state.dart';
import 'package:sylva/presentation/features/photo_preview/widgets/palette_color_list_item.dart';
import 'package:sylva/presentation/widgets/containers/app_transparent_container.dart';
import 'package:sylva/presentation/widgets/images/app_file_image.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';
import 'package:sylva/presentation/widgets/text/app_title_text.dart';

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
  late ThemeData _theme;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<PhotoPreviewCubit>();
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
                Positioned.fill(child: _buildImage()),
                Positioned(
                  bottom: 8,
                  left: 8,
                  right: 8,
                  child: _buildColorDetails(),
                ),
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

  Widget _buildImage() {
    return AppTransparentContainer(
      padding: EdgeInsets.zero,
      child: GestureDetector(
        onPanStart: (details) {
          setState(() {
            _showMagnifier = true;
            _touchPosition = details.localPosition;
          });
        },
        onPanUpdate: (details) {
          setState(() {
            _touchPosition = details.localPosition;
          });
        },
        onPanEnd: (details) {
          setState(() {
            _showMagnifier = false;
          });
        },
        child: BlocBuilder<PhotoPreviewCubit, PhotoPreviewState>(
          buildWhen: (previous, current) =>
              current.filteredImageBytes != previous.filteredImageBytes,
          builder: (context, state) {
            if (state.filteredImageBytes != null) {
              return Image.memory(
                state.filteredImageBytes!,
                fit: BoxFit.cover,
                width: double.infinity,
              );
            }
            return AppFileImage(path: widget.imagePath, fit: BoxFit.cover);
          },
        ),
      ),
    );
  }

  Widget _buildColorSet() {
    return AnimatedSize(
      duration: 150.milliseconds,
      curve: Curves.decelerate,
      alignment: Alignment.topCenter,
      child: BlocBuilder<PhotoPreviewCubit, PhotoPreviewState>(
        buildWhen: (previous, current) =>
            current.getColorStatus != previous.getColorStatus ||
            current.filterColorStatus != previous.filterColorStatus ||
            current.selectedColor != previous.selectedColor,
        builder: (context, state) {
          Widget child;
          if (state.getColorStatus.isLoading) {
            child = Column(
              key: const ValueKey('loading'),
              children: [
                AppTitleText(title: S.of(context).autoDetectColors),
                const SizedBox(
                  height: 80,
                  child: Center(child: CircularProgressIndicator()),
                ),
              ],
            );
          } else if (state.getColorStatus.isFailure) {
            child = Container(
              key: const ValueKey('failure'),
              padding: 8.paddingAll,
              child: Text(
                S.of(context).failedToLoadColors,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (state.paletteColors.isEmpty) {
            child = const SizedBox.shrink(key: ValueKey('empty'));
          } else {
            child = Column(
              key: const ValueKey('loaded'),
              children: [
                AppTitleText(title: S.of(context).autoDetectColors),
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
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          }

          return AnimatedSwitcher(duration: 150.milliseconds, child: child);
        },
      ),
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
              color: Colors.black38,
              child: const Center(child: CircularProgressIndicator()),
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
        if (color == null) return const SizedBox.shrink();

        return AppTransparentContainer(
          onTap: () {
            _cubit.copyColorToClipboard(color: color);
          },
          borderRadius: 20,
          padding: 8.paddingAll,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildColorDetailItem(
                label: 'R',
                value: (color.r * 255.0).round().clamp(0, 255),
                labelColor: Colors.red,
              ),
              _buildColorDetailItem(
                label: 'G',
                value: (color.g * 255.0).round().clamp(0, 255),
                labelColor: Colors.green,
              ),
              _buildColorDetailItem(
                label: 'B',
                value: (color.b * 255.0).round().clamp(0, 255),
                labelColor: Colors.blue,
              ),
              _buildColorDetailItem(
                label: 'A',
                value: (color.a * 255.0).round().clamp(0, 255),
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
              _cubit.navigator.safePop();
            },
            icon: const Icon(Icons.save_outlined, size: 24),
          ),
        ),
        48.width,
        Tooltip(
          message: S.of(context).autoDetectColors,
          child: IconButton(
            onPressed: () {
              _cubit.extractPalette(widget.imagePath);
            },
            icon: Icon(Icons.auto_awesome, color: Colors.amberAccent),
          ),
        ),
      ],
    );
  }
}
