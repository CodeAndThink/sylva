import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/enums/template_enums.dart';
import 'package:sylva/presentation/features/share/share_cubit.dart';
import 'package:sylva/presentation/features/share/share_state.dart';
import 'package:sylva/presentation/widgets/images/app_file_image.dart';
import 'package:sylva/presentation/widgets/shapes/capsule_shape.dart';
import 'package:sylva/presentation/widgets/shapes/circle_shape.dart';
import 'package:sylva/presentation/widgets/shapes/diamond_shape.dart';
import 'package:sylva/presentation/widgets/shapes/rounded_square_shape.dart';
import 'package:sylva/presentation/widgets/shapes/square_shape.dart';

class ShareImagePreview extends StatelessWidget {
  final String imagePath;

  const ShareImagePreview({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShareCubit, ShareState>(
      builder: (context, state) {
        if (state.selectedShape == PaletteShape.none) {
          return Center(
            child: AppFileImage(path: imagePath, fit: BoxFit.contain),
          );
        }

        // We use a LayoutBuilder to know the size of the container,
        // but Image.file gives us the aspect ratio if we use it directly,
        // or we can just use a Stack with fit.
        return Center(
          child: Stack(
            fit: StackFit.loose,
            children: [
              AppFileImage(path: imagePath, fit: BoxFit.contain),
              Positioned.fill(child: _buildOverlay(context, state)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOverlay(BuildContext context, ShareState state) {
    // Determine alignment based on selectedPosition
    Alignment alignment = Alignment.center;
    switch (state.selectedPosition) {
      case PalettePosition.topLeft:
        alignment = Alignment.topLeft;
        break;
      case PalettePosition.topCenter:
        alignment = Alignment.topCenter;
        break;
      case PalettePosition.topRight:
        alignment = Alignment.topRight;
        break;
      case PalettePosition.centerLeft:
        alignment = Alignment.centerLeft;
        break;
      case PalettePosition.center:
        alignment = Alignment.center;
        break;
      case PalettePosition.centerRight:
        alignment = Alignment.centerRight;
        break;
      case PalettePosition.bottomLeft:
        alignment = Alignment.bottomLeft;
        break;
      case PalettePosition.bottomCenter:
        alignment = Alignment.bottomCenter;
        break;
      case PalettePosition.bottomRight:
        alignment = Alignment.bottomRight;
        break;
    }

    // Determine direction layout
    final isVertical = state.selectedDirection == PaletteDirection.vertical;

    return LayoutBuilder(
      builder: (context, constraints) {
        final marginValue =
            constraints.maxWidth * (0.01 + state.shapeMargin * 0.2);

        // Estimate size based on available area and selected size.
        final boxSize = constraints.maxWidth * state.shapeSize;
        final padding = boxSize * 0.2;
        final spacing = boxSize * state.shapeSpacing;
        final size = boxSize - padding * 2;

        Widget list = Container(
          child: isVertical
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: spacing,
                  children: _buildShapes(
                    state.selectedShape,
                    state.selectedColors.toList(),
                    size,
                    state,
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: spacing,
                  children: _buildShapes(
                    state.selectedShape,
                    state.selectedColors.toList(),
                    size,
                    state,
                  ),
                ),
        );

        return Align(
          alignment: alignment,
          child: Padding(padding: EdgeInsets.all(marginValue), child: list),
        );
      },
    );
  }

  List<Widget> _buildShapes(
    PaletteShape shape,
    List<Color> colors,
    double size,
    ShareState state,
  ) {
    if (colors.isEmpty) {
      colors = [Colors.white, Colors.white, Colors.white]; // fallback
    }

    final List<Widget> children = [];
    for (int i = 0; i < colors.length; i++) {
      final color = colors.isNotEmpty
          ? colors[i % colors.length]
          : Colors.white;
      children.add(_buildShapeWithText(shape, color, size, state));
    }
    return children;
  }

  Widget _buildShapeWithText(
    PaletteShape shape,
    Color color,
    double size,
    ShareState state,
  ) {
    Widget shapeWidget = _buildShapeWidget(
      shape: shape,
      color: color,
      size: size,
    );

    if (state.textOption == ShareTextOption.none) {
      return shapeWidget;
    }

    String textStr = '';
    if (state.textOption == ShareTextOption.hex) {
      textStr =
          '#${(color.toARGB32() & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
    } else if (state.textOption == ShareTextOption.rgba) {
      textStr =
          'rgba(${(color.r * 255).round()}, ${(color.g * 255).round()}, ${(color.b * 255).round()}, ${color.a.toStringAsFixed(1)})';
    }

    final textColor = state.textColor ?? Colors.white;
    final actualFontSize = size * (0.08 + state.textSize * 0.16);
    final textStyle = TextStyle(
      color: textColor,
      fontSize: actualFontSize,
      fontWeight: state.isTextBold ? FontWeight.bold : FontWeight.normal,
      fontStyle: state.isTextItalic ? FontStyle.italic : FontStyle.normal,
      decoration: state.isTextUnderline
          ? TextDecoration.underline
          : TextDecoration.none,
      decorationColor: textColor,
    );

    final textWidget = Text(textStr, style: textStyle);

    switch (state.textPosition) {
      case ShareTextPosition.top:
        return Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: [textWidget, shapeWidget],
        );
      case ShareTextPosition.bottom:
        return Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: [shapeWidget, textWidget],
        );
      case ShareTextPosition.left:
        return Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: [textWidget, shapeWidget],
        );
      case ShareTextPosition.right:
        return Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: [shapeWidget, textWidget],
        );
      case ShareTextPosition.inside:
        final brightness = ThemeData.estimateBrightnessForColor(color);
        final insideTextColor =
            state.textColor ??
            (brightness == Brightness.dark ? Colors.white : Colors.black);
        return Stack(
          alignment: Alignment.center,
          children: [
            shapeWidget,
            SizedBox(
              width: size * 0.9,
              child: Text(
                textStr,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: textStyle.copyWith(
                  color: insideTextColor,
                  decorationColor: insideTextColor,
                ),
              ),
            ),
          ],
        );
    }
  }

  Widget _buildShapeWidget({
    required PaletteShape shape,
    required Color color,
    required double size,
  }) {
    switch (shape) {
      case PaletteShape.none:
        return Container();
      case PaletteShape.circle:
        return CircleShape(color: color, size: size);
      case PaletteShape.square:
        return SquareShape(color: color, size: size);
      case PaletteShape.diamond:
        return DiamondShape(color: color, size: size);
      case PaletteShape.capsule:
        return CapsuleShape(color: color, size: size);
      case PaletteShape.roundedSquare:
        return RoundedSquareShape(color: color, size: size);
    }
  }
}
