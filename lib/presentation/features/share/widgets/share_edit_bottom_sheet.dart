import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/presentation/features/share/share_cubit.dart';
import 'package:sylva/presentation/features/share/share_state.dart';
import 'package:sylva/presentation/features/share/widgets/share_colors_tab.dart';
import 'package:sylva/presentation/features/share/widgets/share_direction_tab.dart';
import 'package:sylva/presentation/features/share/widgets/share_focus_tab.dart';
import 'package:sylva/presentation/features/share/widgets/share_shapes_tab.dart';
import 'package:sylva/presentation/features/share/widgets/share_text_tab.dart';
import 'package:sylva/presentation/widgets/buttons/app_sliding_segmented_control.dart';
import 'package:sylva/presentation/widgets/containers/app_transparent_container.dart';

class ShareEditBottomSheet extends StatelessWidget {
  final List<Color> colors;

  const ShareEditBottomSheet({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return AppTransparentContainer(
      border: 28.borderRadiusTop,
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildFeatureActions(context),
            8.height,
            AppTransparentContainer(
              padding: 8.paddingAll,
              borderRadius: 12,
              child: AnimatedSize(
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
                          height: 67,
                          child: ShareFocusTab(),
                        );
                        break;
                      case ShareFeatureTab.shapes:
                        child = const ShareShapesTab();
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
                          height: 67,
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureActions(BuildContext context) {
    return BlocBuilder<ShareCubit, ShareState>(
      buildWhen: (previous, current) =>
          previous.currentTab != current.currentTab,
      builder: (context, state) {
        final currentTab = state.currentTab;
        final cubit = context.read<ShareCubit>();

        final tabs = [
          (ShareFeatureTab.focus, Icons.center_focus_strong),
          (ShareFeatureTab.direction, Icons.screen_rotation_outlined),
          (ShareFeatureTab.shapes, Icons.shape_line_outlined),
          (ShareFeatureTab.text, Icons.text_fields_outlined),
          (ShareFeatureTab.colors, Icons.color_lens_outlined),
        ];

        return AppSlidingSegmentedControl<ShareFeatureTab>(
          selectedValue: currentTab,
          onValueChanged: cubit.changeTab,
          segments: tabs.map((t) => (t.$1, Icon(t.$2) as Widget)).toList(),
        );
      },
    );
  }
}
