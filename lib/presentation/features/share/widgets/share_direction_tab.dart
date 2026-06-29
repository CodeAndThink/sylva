import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/enums/template_enums.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/presentation/features/share/share_cubit.dart';
import 'package:sylva/presentation/features/share/share_state.dart';

class ShareDirectionTab extends StatelessWidget {
  const ShareDirectionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShareCubit, ShareState>(
      buildWhen: (previous, current) =>
          previous.selectedDirection != current.selectedDirection,
      builder: (context, state) {
        final cubit = context.read<ShareCubit>();
        final theme = Theme.of(context);
        final directions = PaletteDirection.values;

        return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: directions.length,
          separatorBuilder: (context, index) => 10.width,
          itemBuilder: (context, index) {
            final direction = directions[index];
            final isSelected = state.selectedDirection == direction;

            return InkWell(
              onTap: () {
                cubit.selectDirection(direction);
              },
              borderRadius: 10.borderRadius,
              child: Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  color: isSelected
                      ? theme.colorScheme.primaryContainer
                      : Colors.transparent,
                  borderRadius: 10.borderRadius,
                  border: Border.all(
                    color: theme.colorScheme.onSurface,
                    width: 1,
                  ),
                ),
                child: Icon(
                  direction == PaletteDirection.horizontal
                      ? Icons.swap_horiz_rounded
                      : Icons.swap_vert_rounded,
                  color: isSelected
                      ? theme.colorScheme.onPrimaryContainer
                      : theme.colorScheme.onSurface,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
