import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/enums/template_enums.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/presentation/features/share/share_cubit.dart';
import 'package:sylva/presentation/features/share/share_state.dart';
import 'package:sylva/presentation/features/share/widgets/template_list_item.dart';

class ShareShapesTab extends StatelessWidget {
  const ShareShapesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShareCubit, ShareState>(
      buildWhen: (previous, current) =>
          previous.selectedShape != current.selectedShape,
      builder: (context, state) {
        final cubit = context.read<ShareCubit>();
        final shapes = PaletteShape.values
            .where((s) => s != PaletteShape.none)
            .toList();

        return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: shapes.length,
          separatorBuilder: (context, index) => 10.width,
          itemBuilder: (context, index) {
            final shape = shapes[index];
            final isSelected = state.selectedShape == shape;

            return TemplateListItem(
              shape: shape,
              isSelected: isSelected,
              onTap: () {
                cubit.selectShape(shape);
              },
            );
          },
        );
      },
    );
  }
}
