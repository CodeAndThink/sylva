import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/core/utils/app_feedback.dart';
import 'package:sylva/data/models/process_image_model.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/share/widgets/share_colors_tab.dart';
import 'package:share_plus/share_plus.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:sylva/core/utils/image_exporter_utils.dart';
import 'package:sylva/presentation/features/share/widgets/share_shapes_tab.dart';
import 'package:sylva/presentation/features/share/widgets/share_focus_tab.dart';
import 'package:sylva/presentation/features/share/widgets/share_direction_tab.dart';
import 'package:sylva/presentation/features/share/widgets/share_image_preview.dart';
import 'package:sylva/presentation/features/share/share_cubit.dart';
import 'package:sylva/presentation/features/share/share_navigator.dart';
import 'package:sylva/presentation/features/share/share_state.dart';
import 'package:sylva/presentation/widgets/containers/app_transparent_container.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';

class SharePage extends StatelessWidget {
  final ProcessImageModel args;
  const SharePage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShareCubit(navigator: ShareNavigator(context)),
      child: _ShareChildPage(args: args),
    );
  }
}

class _ShareChildPage extends StatefulWidget {
  final ProcessImageModel args;
  const _ShareChildPage({required this.args});

  @override
  State<_ShareChildPage> createState() => __ShareChildPageState();
}

class __ShareChildPageState extends State<_ShareChildPage> {
  late final ShareCubit _cubit;
  late S _l10n;
  final GlobalKey _keyBack = GlobalKey();
  final GlobalKey _keyLibrary = GlobalKey();
  final GlobalKey _keyShare = GlobalKey();

  @override
  void initState() {
    super.initState();
    _cubit = context.read<ShareCubit>();
  }

  @override
  Widget build(BuildContext context) {
    _l10n = S.of(context);
    return AppScaffold(body: _buildBody());
  }

  Widget _buildBody() {
    return SafeArea(
      child: Padding(
        padding: 12.paddingAll,
        child: Column(
          children: [
            Expanded(
              child: ShareImagePreview(imagePath: widget.args.imagePath),
            ),
            12.height,
            _buildTemplateList(),
            8.height,
            _buildBottomActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildTemplateList() {
    return SizedBox(
      height: 100,
      width: double.maxFinite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildFeatureActions(),
          5.height,
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
                    return ShareColorsTab(colors: widget.args.colors);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureActions() {
    return BlocBuilder<ShareCubit, ShareState>(
      buildWhen: (previous, current) =>
          previous.currentTab != current.currentTab,
      builder: (context, state) {
        final currentTab = state.currentTab;
        final primaryColor = Theme.of(context).colorScheme.primary;

        return SizedBox(
          width: double.maxFinite,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: 8,
            children: [
              _buildFeatureButton(
                icon: Icons.center_focus_strong,
                isSelected: currentTab.isFocus,
                onTap: () => _cubit.changeTab(ShareFeatureTab.focus),
                primaryColor: primaryColor,
              ),
              _buildFeatureButton(
                icon: Icons.screen_rotation_outlined,
                isSelected: currentTab.isDirection,
                onTap: () => _cubit.changeTab(ShareFeatureTab.direction),
                primaryColor: primaryColor,
              ),
              _buildFeatureButton(
                icon: Icons.shape_line_outlined,
                isSelected: currentTab.isShapes,
                onTap: () => _cubit.changeTab(ShareFeatureTab.shapes),
                primaryColor: primaryColor,
              ),
              _buildFeatureButton(
                icon: Icons.color_lens_outlined,
                isSelected: currentTab.isColors,
                onTap: () => _cubit.changeTab(ShareFeatureTab.colors),
                primaryColor: primaryColor,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFeatureButton({
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
    required Color primaryColor,
  }) {
    return Tooltip(
      message: _l10n.fullScreen,
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

  Widget _buildBottomActions() {
    return AppTransparentContainer(
      padding: 4.paddingAll,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          Tooltip(
            message: _l10n.back,
            child: IconButton(
              key: _keyBack,
              onPressed: () {
                AppFeedback.playInteract(context);
                _cubit.navigator.safePop();
              },
              icon: const Icon(Icons.navigate_before_rounded, size: 36),
            ),
          ),
          Tooltip(
            message: _l10n.saveToLibrary,
            child: IconButton(
              key: _keyLibrary,
              onPressed: () async {
                AppFeedback.playInteract(context);
                await _exportAndSave();
              },
              icon: const Icon(Icons.download_rounded, size: 30),
            ),
          ),
          Tooltip(
            message: _l10n.tutorialShareTitle,
            child: IconButton(
              key: _keyShare,
              onPressed: () async {
                AppFeedback.playInteract(context);
                await _exportAndShare();
              },
              icon: const Icon(Icons.share_rounded, size: 25),
            ),
          ),
          Tooltip(
            message: _l10n.help,
            child: IconButton(
              onPressed: () {
                AppFeedback.playInteract(context);
              },
              icon: Icon(Icons.help_outline_outlined, size: 30),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _exportAndSave() async {
    final state = _cubit.state;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (c) => const Center(child: CircularProgressIndicator()),
    );

    final file = await ImageExporterUtils.exportImageWithOverlay(
      imagePath: widget.args.imagePath,
      shape: state.selectedShape,
      position: state.selectedPosition,
      direction: state.selectedDirection,
      colors: state.selectedColors.toList(),
    );

    if (mounted) Navigator.pop(context);

    if (file != null) {
      await PhotoManager.editor.saveImageWithPath(
        file.path,
        title: 'sylva_export.png',
      );
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(_l10n.success)));
      }
    }
  }

  Future<void> _exportAndShare() async {
    final state = _cubit.state;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (c) => const Center(child: CircularProgressIndicator()),
    );

    final file = await ImageExporterUtils.exportImageWithOverlay(
      imagePath: widget.args.imagePath,
      shape: state.selectedShape,
      position: state.selectedPosition,
      direction: state.selectedDirection,
      colors: state.selectedColors.toList(),
    );

    if (mounted) Navigator.pop(context);

    if (file != null) {
      await Share.shareXFiles([XFile(file.path)]);
    }
  }
}
