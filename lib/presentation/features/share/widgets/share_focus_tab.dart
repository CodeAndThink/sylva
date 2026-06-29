import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/enums/template_enums.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/presentation/features/share/share_cubit.dart';
import 'package:sylva/presentation/features/share/share_state.dart';

class ShareFocusTab extends StatelessWidget {
  const ShareFocusTab({super.key});

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

        return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: positions.length,
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
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: 10.borderRadius,
                  border: Border.all(
                    color: theme.colorScheme.onSurface,
                    width: 1,
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: _getAlignment(position),
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onSurfaceVariant,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    if (isSelected)
                      Center(
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.onSurface,
                            borderRadius: 10.borderRadius,
                          ),
                          child: Icon(
                            Icons.check_rounded,
                            color: theme.colorScheme.surface,
                            size: 18,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
