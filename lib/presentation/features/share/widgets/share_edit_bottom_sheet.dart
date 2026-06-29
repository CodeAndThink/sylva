import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/share/share_cubit.dart';
import 'package:sylva/presentation/features/share/share_state.dart';
import 'package:sylva/presentation/features/share/widgets/share_colors_tab.dart';
import 'package:sylva/presentation/features/share/widgets/share_direction_tab.dart';
import 'package:sylva/presentation/features/share/widgets/share_focus_tab.dart';
import 'package:sylva/presentation/features/share/widgets/share_shapes_tab.dart';

class ShareEditBottomSheet extends StatelessWidget {
  final List<Color> colors;

  const ShareEditBottomSheet({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 12.paddingAll,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildFeatureActions(context),
          16.height,
          SizedBox(
            height: 55,
            child: BlocBuilder<ShareCubit, ShareState>(
              buildWhen: (previous, current) {
                return previous.currentTab != current.currentTab ||
                    previous.selectedColors != current.selectedColors;
              },
              builder: (context, state) {
                switch (state.currentTab) {
                  case ShareFeatureTab.focus:
                    return const ShareFocusTab();
                  case ShareFeatureTab.shapes:
                    return const ShareShapesTab();
                  case ShareFeatureTab.direction:
                    return const ShareDirectionTab();
                  case ShareFeatureTab.colors:
                    return ShareColorsTab(colors: colors);
                }
              },
            ),
          ),
          SafeArea(child: 8.height),
        ],
      ),
    );
  }

  Widget _buildFeatureActions(BuildContext context) {
    return BlocBuilder<ShareCubit, ShareState>(
      buildWhen: (previous, current) =>
          previous.currentTab != current.currentTab,
      builder: (context, state) {
        final currentTab = state.currentTab;
        final primaryColor = Theme.of(context).colorScheme.primary;
        final cubit = context.read<ShareCubit>();

        return SizedBox(
          width: double.maxFinite,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: 8,
            children: [
              _buildFeatureButton(
                context: context,
                icon: Icons.center_focus_strong,
                isSelected: currentTab.isFocus,
                onTap: () => cubit.changeTab(ShareFeatureTab.focus),
                primaryColor: primaryColor,
              ),
              _buildFeatureButton(
                context: context,
                icon: Icons.screen_rotation_outlined,
                isSelected: currentTab.isDirection,
                onTap: () => cubit.changeTab(ShareFeatureTab.direction),
                primaryColor: primaryColor,
              ),
              _buildFeatureButton(
                context: context,
                icon: Icons.shape_line_outlined,
                isSelected: currentTab.isShapes,
                onTap: () => cubit.changeTab(ShareFeatureTab.shapes),
                primaryColor: primaryColor,
              ),
              _buildFeatureButton(
                context: context,
                icon: Icons.color_lens_outlined,
                isSelected: currentTab.isColors,
                onTap: () => cubit.changeTab(ShareFeatureTab.colors),
                primaryColor: primaryColor,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFeatureButton({
    required BuildContext context,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
    required Color primaryColor,
  }) {
    return Tooltip(
      message: S.of(context).fullScreen,
      child: Material(
        color: isSelected ? primaryColor : Colors.black54,
        shape: const CircleBorder(),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 38,
            width: 38,
            child: Icon(icon, size: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
