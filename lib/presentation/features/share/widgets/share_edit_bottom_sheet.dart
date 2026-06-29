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
import 'package:sylva/presentation/features/share/widgets/share_text_tab.dart';

class ShareEditBottomSheet extends StatelessWidget {
  final List<Color> colors;

  const ShareEditBottomSheet({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: 12.paddingAll,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSize(
              duration: 300.milliseconds,
              curve: Curves.easeInOutCubic,
              alignment: Alignment.topCenter,
              child: _buildSliders(context),
            ),
            _buildFeatureActions(context),
            16.height,
            AnimatedSize(
              duration: 300.milliseconds,
              curve: Curves.easeInOutCubic,
              alignment: Alignment.topCenter,
              child: BlocBuilder<ShareCubit, ShareState>(
                buildWhen: (previous, current) {
                  return previous.currentTab != current.currentTab ||
                      previous.selectedColors != current.selectedColors;
                },
                builder: (context, state) {
                  Widget child;
                  switch (state.currentTab) {
                    case ShareFeatureTab.focus:
                      child = const SizedBox(
                        height: 55,
                        child: ShareFocusTab(),
                      );
                      break;
                    case ShareFeatureTab.shapes:
                      child = const SizedBox(
                        height: 55,
                        child: ShareShapesTab(),
                      );
                      break;
                    case ShareFeatureTab.text:
                      child = ShareTextTab(colors: colors);
                      break;
                    case ShareFeatureTab.direction:
                      child = const SizedBox(
                        height: 55,
                        child: ShareDirectionTab(),
                      );
                      break;
                    case ShareFeatureTab.colors:
                      child = SizedBox(
                        height: 55,
                        child: ShareColorsTab(colors: colors),
                      );
                      break;
                  }

                  // Key is required for AnimatedSwitcher if we want crossfade, but for AnimatedSize, changing child size is enough.
                  // However, giving it a key ensures the tree knows it's a new child if needed.
                  return KeyedSubtree(
                    key: ValueKey(state.currentTab),
                    child: child,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSliders(BuildContext context) {
    return BlocBuilder<ShareCubit, ShareState>(
      buildWhen: (previous, current) =>
          previous.currentTab != current.currentTab ||
          previous.shapeSize != current.shapeSize ||
          previous.shapeSpacing != current.shapeSpacing,
      builder: (context, state) {
        if (!state.currentTab.isShapes) return const SizedBox.shrink();

        final cubit = context.read<ShareCubit>();
        return Column(
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
                  ),
                ),
              ],
            ),
            16.height,
          ],
        );
      },
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
                icon: Icons.text_fields_outlined,
                isSelected: currentTab.isText,
                onTap: () => cubit.changeTab(ShareFeatureTab.text),
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
