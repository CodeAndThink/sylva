import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/presentation/features/photo_preview/widgets/palette_color_list_item.dart';
import 'package:sylva/presentation/features/share/share_cubit.dart';
import 'package:sylva/presentation/features/share/share_state.dart';

class ShareColorsTab extends StatelessWidget {
  final List<Color> colors;

  const ShareColorsTab({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShareCubit, ShareState>(
      buildWhen: (previous, current) {
        return previous.selectedColors != current.selectedColors;
      },
      builder: (context, state) {
        final cubit = context.read<ShareCubit>();
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          separatorBuilder: (context, index) => 10.width,
          itemBuilder: (context, index) {
            final Color color = colors[index];
            return PaletteColorListItem(
              color: color,
              isSelected: state.selectedColors.contains(color),
              onTap: () {
                cubit.toggleSelectedColor(color: color);
              },
            );
          },
        );
      },
    );
  }
}
