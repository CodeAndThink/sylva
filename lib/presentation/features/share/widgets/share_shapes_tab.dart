import 'package:flutter/material.dart';
import 'package:sylva/core/enums/template_enums.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/presentation/features/share/widgets/template_list_item.dart';

class ShareShapesTab extends StatefulWidget {
  const ShareShapesTab({super.key});

  @override
  State<ShareShapesTab> createState() => _ShareShapesTabState();
}

class _ShareShapesTabState extends State<ShareShapesTab> {
  PaletteShape _selectedShape = PaletteShape.none;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final shapes = PaletteShape.values
        .where((s) => s != PaletteShape.none)
        .toList();

    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: shapes.length,
      separatorBuilder: (context, index) => 10.width,
      itemBuilder: (context, index) {
        final shape = shapes[index];
        final isSelected = _selectedShape == shape;

        return InkWell(
          onTap: () {
            setState(() {
              _selectedShape = shape;
            });
          },
          borderRadius: 10.borderRadius,
          child: SizedBox(
            width: 55,
            height: 55,

            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: 10.borderRadius,
                    child: TemplateListItem(
                      shape: shape,
                      isSelected: isSelected,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
