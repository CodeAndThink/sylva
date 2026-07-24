import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/di/injection.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/core/utils/app_feedback.dart';
import 'package:share_plus/share_plus.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:sylva/core/utils/image_exporter_utils.dart';
import 'package:sylva/data/models/process_image_model.dart';
import 'package:sylva/domain/repositories/app_preferences_repository.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/share/widgets/share_edit_bottom_sheet.dart';
import 'package:sylva/presentation/features/share/widgets/share_image_preview.dart';
import 'package:sylva/presentation/features/share/share_cubit.dart';
import 'package:sylva/presentation/features/share/share_state.dart';
import 'package:sylva/presentation/features/share/share_navigator.dart';
import 'package:sylva/presentation/widgets/containers/app_transparent_container.dart';
import 'package:sylva/presentation/widgets/loadings/app_loading.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';
import 'package:sylva/presentation/widgets/tutorial/app_tutorial_helper.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class SharePage extends StatelessWidget {
  final ProcessImageModel args;
  const SharePage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShareCubit(
        navigator: ShareNavigator(context),
        appPrefs: locator<AppPreferencesRepository>(),
      ),
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
  final GlobalKey _keyTune = GlobalKey();
  final GlobalKey _keyLibrary = GlobalKey();
  final GlobalKey _keyShare = GlobalKey();
  TutorialCoachMark? tutorialCoachMark;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<ShareCubit>();
  }

  Future<void> _exportAndSave() async {
    final state = _cubit.state;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (c) => Center(child: AppLoading()),
    );

    final file = await ImageExporterUtils.exportImageWithOverlay(
      imagePath: widget.args.imagePath,
      shape: state.selectedShape,
      position: state.selectedPosition,
      direction: state.selectedDirection,
      colors: state.selectedColors.toList(),
      shapeSize: state.shapeSize,
      shapeSpacing: state.shapeSpacing,
      shapeMargin: state.shapeMargin,
      textOption: state.textOption,
      textPosition: state.textPosition,
      textSize: state.textSize,
      textFontFamily: state.textFontFamily,
      isTextBold: state.isTextBold,
      isTextItalic: state.isTextItalic,
      isTextUnderline: state.isTextUnderline,
      textColor: state.textColor,
    );

    _cubit.navigator.safePop();

    if (file != null) {
      await PhotoManager.editor.saveImageWithPath(
        file.path,
        title: 'sylva_export.png',
      );
      if (mounted) {
        _cubit.navigator.flushBar.showSuccess(message: _l10n.success);
      }
    }
  }

  Future<void> _exportAndShare() async {
    final state = _cubit.state;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (c) => AppLoading(),
    );

    final file = await ImageExporterUtils.exportImageWithOverlay(
      imagePath: widget.args.imagePath,
      shape: state.selectedShape,
      position: state.selectedPosition,
      direction: state.selectedDirection,
      colors: state.selectedColors.toList(),
      shapeSize: state.shapeSize,
      shapeSpacing: state.shapeSpacing,
      shapeMargin: state.shapeMargin,
      textOption: state.textOption,
      textPosition: state.textPosition,
      textSize: state.textSize,
      textFontFamily: state.textFontFamily,
      isTextBold: state.isTextBold,
      isTextItalic: state.isTextItalic,
      isTextUnderline: state.isTextUnderline,
      textColor: state.textColor,
    );

    _cubit.navigator.safePop();

    if (file != null) {
      await SharePlus.instance.share(ShareParams(files: [XFile(file.path)]));
    }
  }

  void _showTutorial() {
    tutorialCoachMark = AppTutorialHelper.showTutorial(
      context: context,
      targets: _createTargets(),
    );
  }

  List<TargetFocus> _createTargets() {
    return [
      AppTutorialHelper.buildTarget(
        context: context,
        key: _keyBack,
        title: _l10n.tutorialBackTitle,
        desc: _l10n.tutorialBackDesc,
      ),
      AppTutorialHelper.buildTarget(
        context: context,
        key: _keyTune,
        title: _l10n.tutorialExpandPaletteTitle,
        desc: _l10n.tutorialExpandPaletteDesc,
      ),
      AppTutorialHelper.buildTarget(
        context: context,
        key: _keyLibrary,
        title: _l10n.tutorialSaveTitle,
        desc: _l10n.tutorialSaveDesc,
      ),
      AppTutorialHelper.buildTarget(
        context: context,
        key: _keyShare,
        title: _l10n.tutorialShareTitle,
        desc: _l10n.tutorialShareDesc,
      ),
    ];
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
              child: Stack(
                children: [
                  AppTransparentContainer(
                    padding: 8.paddingAll,
                    child: Center(
                      child: ShareImagePreview(
                        imagePath: widget.args.imagePath,
                      ),
                    ),
                  ),
                  Padding(
                    padding: 8.paddingAll,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: _buildStateManagerActions(),
                    ),
                  ),
                ],
              ),
            ),
            8.height,
            _buildBottomActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildStateManagerActions() {
    return BlocBuilder<ShareCubit, ShareState>(
      builder: (context, state) {
        if (_cubit.canRedo || _cubit.canUndo) {
          return AppTransparentContainer(
            padding: 4.paddingAll,
            child: Row(
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedOpacity(
                  duration: 200.milliseconds,
                  opacity: _cubit.canUndo ? 1.0 : 0.4,
                  child: Tooltip(
                    message: _l10n.undo,
                    child: IconButton(
                      onPressed: _cubit.canUndo
                          ? () {
                              AppFeedback.playInteract(context);
                              _cubit.undo();
                            }
                          : null,
                      icon: const Icon(Icons.undo_rounded, size: 26),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  duration: 200.milliseconds,
                  opacity: _cubit.canRedo ? 1.0 : 0.4,
                  child: Tooltip(
                    message: _l10n.redo,
                    child: IconButton(
                      onPressed: _cubit.canRedo
                          ? () {
                              AppFeedback.playInteract(context);
                              _cubit.redo();
                            }
                          : null,
                      icon: const Icon(Icons.redo_rounded, size: 26),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
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
            message: _l10n.tutorialExpandPaletteTitle, // fallback
            child: IconButton(
              key: _keyTune,
              onPressed: () {
                AppFeedback.playInteract(context);
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  isScrollControlled: true,
                  builder: (context) => BlocProvider.value(
                    value: _cubit,
                    child: ShareEditBottomSheet(
                      genColors: widget.args.genColors,
                      userColors: widget.args.userColors,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.tune_rounded, size: 25),
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
              icon: const Icon(Icons.download_rounded, size: 28),
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
              icon: const Icon(Icons.share_rounded, size: 22),
            ),
          ),
          Tooltip(
            message: _l10n.help,
            child: IconButton(
              onPressed: () {
                AppFeedback.playInteract(context);
                _showTutorial();
              },
              icon: Icon(Icons.help_outline_outlined, size: 28),
            ),
          ),
        ],
      ),
    );
  }
}
