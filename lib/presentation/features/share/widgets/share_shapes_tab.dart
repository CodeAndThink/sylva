import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/enums/template_enums.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/presentation/features/share/share_cubit.dart';
import 'package:sylva/presentation/features/share/share_state.dart';
import 'package:sylva/presentation/features/share/widgets/template_list_item.dart';

class ShareShapesTab extends StatefulWidget {
  const ShareShapesTab({super.key});

  @override
  State<ShareShapesTab> createState() => _ShareShapesTabState();
}

class _ShareShapesTabState extends State<ShareShapesTab> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShareCubit, ShareState>(
      buildWhen: (previous, current) =>
          previous.selectedShape != current.selectedShape ||
          previous.shapeSize != current.shapeSize ||
          previous.shapeSpacing != current.shapeSpacing ||
          previous.shapeMargin != current.shapeMargin,
      builder: (context, state) {
        final cubit = context.read<ShareCubit>();
        final shapes = PaletteShape.values;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(Icons.photo_size_select_small),
                Expanded(
                  child: Slider(
                    value: state.shapeSize,
                    min: 0.1,
                    max: 0.5,
                    onChanged: (v) => cubit.changeShapeSize(v),
                    onChangeStart: (_) => cubit.beginSliderChange(),
                    onChangeEnd: (_) => cubit.commitSliderChange(),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.space_bar),
                Expanded(
                  child: Slider(
                    value: state.shapeSpacing,
                    min: 0.0,
                    max: 1.0,
                    onChanged: (v) => cubit.changeShapeSpacing(v),
                    onChangeStart: (_) => cubit.beginSliderChange(),
                    onChangeEnd: (_) => cubit.commitSliderChange(),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.margin),
                Expanded(
                  child: Slider(
                    value: state.shapeMargin,
                    min: 0.0,
                    max: 1.0,
                    onChanged: (v) => cubit.changeShapeMargin(v),
                    onChangeStart: (_) => cubit.beginSliderChange(),
                    onChangeEnd: (_) => cubit.commitSliderChange(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 67,
              child: Scrollbar(
                controller: _scrollController,
                thumbVisibility: true,
                child: ListView.separated(
                  controller: _scrollController,
                  padding: 12.paddingBottom,
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
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
