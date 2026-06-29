import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/core/utils/app_feedback.dart';
import 'package:sylva/data/models/process_image_model.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/template_list/template_list_cubit.dart';
import 'package:sylva/presentation/features/template_list/template_list_navigator.dart';
import 'package:sylva/presentation/features/template_list/template_list_state.dart';
import 'package:sylva/presentation/widgets/containers/app_transparent_container.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';

class TemplateListPage extends StatelessWidget {
  final ProcessImageModel args;
  const TemplateListPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          TemplateListCubit(navigator: TemplateListNavigator(context)),
      child: _TemplateListChildPage(args: args),
    );
  }
}

class _TemplateListChildPage extends StatefulWidget {
  final ProcessImageModel args;
  const _TemplateListChildPage({required this.args});

  @override
  State<_TemplateListChildPage> createState() => __TemplateListChildPageState();
}

class __TemplateListChildPageState extends State<_TemplateListChildPage> {
  late final TemplateListCubit _cubit;
  late S _l10n;
  late ThemeData _theme;
  final GlobalKey _keyBack = GlobalKey();

  @override
  void initState() {
    super.initState();
    _cubit = context.read<TemplateListCubit>();
  }

  @override
  Widget build(BuildContext context) {
    _l10n = S.of(context);
    _theme = Theme.of(context);
    return AppScaffold(body: _buildBody());
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Positioned.fill(
          child: BlocBuilder<TemplateListCubit, TemplateListState>(
            builder: (context, state) {
              return const SizedBox();
            },
          ),
        ),
        Align(alignment: Alignment.bottomCenter, child: _buildBottomActions()),
      ],
    );
  }

  Widget _buildBottomActions() {
    return SafeArea(
      top: false,
      child: Padding(
        padding: 12.paddingBottom,
        child: AppTransparentContainer(
          padding: 4.paddingAll,
          child: Row(
            mainAxisSize: MainAxisSize.min,
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
        ),
      ),
    );
  }
}
