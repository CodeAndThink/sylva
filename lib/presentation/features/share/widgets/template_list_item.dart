import 'package:flutter/material.dart';
import 'package:sylva/core/enums/template_enums.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/presentation/widgets/shapes/capsule_shape.dart';
import 'package:sylva/presentation/widgets/shapes/card_shape.dart';
import 'package:sylva/presentation/widgets/shapes/circle_shape.dart';
import 'package:sylva/presentation/widgets/shapes/diamond_shape.dart';
import 'package:sylva/presentation/widgets/shapes/rounded_square_shape.dart';
import 'package:sylva/presentation/widgets/shapes/square_shape.dart';

class TemplateListItem extends StatelessWidget {
  final PaletteShape shape;
  final bool isSelected;
  final VoidCallback? onTap;

  const TemplateListItem({
    super.key,
    required this.shape,
    this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: 12.borderRadius,
      child: ClipRRect(
        borderRadius: 10.borderRadius,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(
                        context,
                      ).colorScheme.primaryContainer.withValues(alpha: 0.8),
                borderRadius: 10.borderRadius,
                // border: Border.all(
                //   color: theme.colorScheme.onSurface,
                //   width: 1,
                // ),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final size = constraints.maxWidth / 2;
                  return Center(child: _buildShape(size: size));
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShape({required double size}) {
    const color = Colors.white;

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
