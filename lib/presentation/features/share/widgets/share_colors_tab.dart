import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/presentation/features/photo_preview/widgets/palette_color_list_item.dart';
import 'package:sylva/presentation/features/share/share_cubit.dart';
import 'package:sylva/presentation/features/share/share_state.dart';

class ShareColorsTab extends StatefulWidget {
  final List<Color> colors;

  const ShareColorsTab({super.key, required this.colors});

  @override
  State<ShareColorsTab> createState() => _ShareColorsTabState();
}

class _ShareColorsTabState extends State<ShareColorsTab> {
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
      buildWhen: (previous, current) {
        return previous.selectedColors != current.selectedColors;
      },
      builder: (context, state) {
        final cubit = context.read<ShareCubit>();
        return Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          child: ListView.separated(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            padding: 12.paddingBottom,
            itemCount: widget.colors.length,
            separatorBuilder: (context, index) => 10.width,
            itemBuilder: (context, index) {
              final Color color = widget.colors[index];
              return PaletteColorListItem(
                color: color,
                isSelected: state.selectedColors.contains(color),
                onTap: () {
                  cubit.toggleSelectedColor(color: color);
                },
              );
            },
          ),
        );
      },
    );
  }
}
