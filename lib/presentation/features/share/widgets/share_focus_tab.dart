import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/enums/template_enums.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/presentation/features/share/share_cubit.dart';
import 'package:sylva/presentation/features/share/share_state.dart';
import 'package:sylva/presentation/features/share/widgets/dot.dart';

class ShareFocusTab extends StatefulWidget {
  const ShareFocusTab({super.key});

  @override
  State<ShareFocusTab> createState() => _ShareFocusTabState();
}

class _ShareFocusTabState extends State<ShareFocusTab> {
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

  Alignment _getAlignment(PalettePosition position) {
    switch (position) {
      case PalettePosition.topLeft:
        return Alignment.topLeft;
      case PalettePosition.topCenter:
        return Alignment.topCenter;
      case PalettePosition.topRight:
        return Alignment.topRight;
      case PalettePosition.centerLeft:
        return Alignment.centerLeft;
      case PalettePosition.center:
        return Alignment.center;
      case PalettePosition.centerRight:
        return Alignment.centerRight;
      case PalettePosition.bottomLeft:
        return Alignment.bottomLeft;
      case PalettePosition.bottomCenter:
        return Alignment.bottomCenter;
      case PalettePosition.bottomRight:
        return Alignment.bottomRight;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShareCubit, ShareState>(
      buildWhen: (previous, current) =>
          previous.selectedPosition != current.selectedPosition,
      builder: (context, state) {
        final cubit = context.read<ShareCubit>();
        final theme = Theme.of(context);
        final positions = PalettePosition.values;

        return Scrollbar(
          controller: _scrollController,

          thumbVisibility: true,
          child: ListView.separated(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: positions.length,
            padding: 12.paddingBottom,
            separatorBuilder: (context, index) => 10.width,
            itemBuilder: (context, index) {
              final position = positions[index];
              final isSelected = state.selectedPosition == position;

              return InkWell(
                onTap: () {
                  cubit.selectPosition(position);
                },
                borderRadius: 10.borderRadius,
                child: Container(
                  width: 55,
                  height: 55,
                  padding: 8.paddingAll,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? theme.colorScheme.primary
                        : Colors.transparent,
                    borderRadius: 10.borderRadius,
                    border: Border.all(
                      color:
                          (isSelected
                                  ? theme.colorScheme.onPrimary
                                  : theme.colorScheme.onSurface)
                              .withValues(alpha: 0.5),
                      width: 1,
                    ),
                  ),
                  child: Align(
                    alignment: _getAlignment(position),
                    child: Dot(isSelected: isSelected),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
