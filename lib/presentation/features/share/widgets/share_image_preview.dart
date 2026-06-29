import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/enums/template_enums.dart';
import 'package:sylva/presentation/features/share/share_cubit.dart';
import 'package:sylva/presentation/features/share/share_state.dart';
import 'package:sylva/presentation/widgets/images/app_file_image.dart';
import 'package:sylva/presentation/widgets/shapes/capsule_shape.dart';
import 'package:sylva/presentation/widgets/shapes/card_shape.dart';
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

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: alignment,
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Estimate size. We want the shapes to be a reasonable size relative to the image.
            // But TemplateListItem takes up constraints.maxWidth/3 if left unbounded it might expand.
            // Let's constrain the size based on the available area.
            final size = constraints.maxWidth * 0.2;

            Widget list = isVertical
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: _buildShapes(
                      state.selectedShape,
                      state.selectedColors.toList(),
                      size,
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: _buildShapes(
                      state.selectedShape,
                      state.selectedColors.toList(),
                      size,
                    ),
                  );

            return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.primaryContainer.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: list,
            );
          },
        ),
      ),
    );
  }

  List<Widget> _buildShapes(
    PaletteShape shape,
    List<Color> colors,
    double size,
  ) {
    if (colors.isEmpty) {
      colors = [Colors.white, Colors.white, Colors.white]; // fallback
    }

    // We only display up to 3 colors for simplicity or loop through all selected colors.
    // The TemplateListItem shows 3. If we dynamically build it here based on selected colors:
    final List<Widget> children = [];
    for (int i = 0; i < 3; i++) {
      final color = colors.isNotEmpty
          ? colors[i % colors.length]
          : Colors.white;
      children.add(_buildShapeWidget(shape, color, size));
      if (i < 2) {
        children.add(const SizedBox(width: 8, height: 8)); // spacing
      }
    }
    return children;
  }

  Widget _buildShapeWidget(PaletteShape shape, Color color, double size) {
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
      case PaletteShape.card:
        return CardShape(color: color, size: size);
      case PaletteShape.roundedSquare:
        return RoundedSquareShape(color: color, size: size);
    }
  }
}
