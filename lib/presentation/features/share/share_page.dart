import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/core/utils/app_feedback.dart';
import 'package:sylva/core/utils/color_utils.dart';
import 'package:sylva/data/models/process_image_model.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/photo_preview/widgets/palette_color_list_item.dart';
import 'package:sylva/presentation/features/share/share_cubit.dart';
import 'package:sylva/presentation/features/share/share_navigator.dart';
import 'package:sylva/presentation/features/share/share_state.dart';
import 'package:sylva/presentation/widgets/containers/app_transparent_container.dart';
import 'package:sylva/presentation/widgets/images/app_file_image.dart';
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
  late ThemeData _theme;
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
    _theme = Theme.of(context);
    return AppScaffold(body: _buildBody());
  }

  Widget _buildBody() {
    return SafeArea(
      child: Padding(
        padding: 12.paddingAll,
        child: Column(
          children: [
            Expanded(
              child: AppTransparentContainer(
                child: Center(
                  child: AppFileImage(
                    path: widget.args.imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            12.height,
            _buildTemplateList(),
            _buildBottomActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildTemplateList() {
    return SizedBox(
      height: 80,
      width: double.maxFinite,
      child: BlocBuilder<ShareCubit, ShareState>(
        buildWhen: (previous, current) {
          return previous.selectedColors != current.selectedColors;
        },
        builder: (context, state) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: widget.args.colors.length,
            separatorBuilder: (context, index) => 10.width,
            itemBuilder: (context, index) {
              final Color color = widget.args.colors[index];
              final hex = ColorUtils.colorToHex(color: color);
              return PaletteColorListItem(
                color: color,
                hex: hex,
                isSelected: state.selectedColors.contains(color),
                onTap: () {
                  _cubit.toggleSelectedColor(color: color);
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildBottomActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            onPressed: () {
              AppFeedback.playInteract(context);
            },
            icon: Icon(Icons.download_rounded, size: 30),
          ),
        ),
        Tooltip(
          message: _l10n.tutorialShareTitle,
          child: IconButton(
            key: _keyShare,
            onPressed: () {
              AppFeedback.playInteract(context);
            },
            icon: Icon(Icons.share_rounded, size: 25),
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
    );
  }
}
