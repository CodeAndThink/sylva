import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/core/utils/color_utils.dart';
import 'package:sylva/presentation/features/photo_preview/widgets/palette_color_list_item.dart';
import 'package:sylva/presentation/features/share/share_cubit.dart';
import 'package:sylva/presentation/features/share/share_navigator.dart';
import 'package:sylva/presentation/widgets/containers/app_transparent_container.dart';
import 'package:sylva/presentation/widgets/images/app_file_image.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';

class ShareArguments {
  final String imagePath;
  final List<Color> colors;

  ShareArguments({required this.imagePath, required this.colors});
}

class SharePage extends StatelessWidget {
  final ShareArguments args;
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
  final ShareArguments args;
  const _ShareChildPage({required this.args});

  @override
  State<_ShareChildPage> createState() => __ShareChildPageState();
}

class __ShareChildPageState extends State<_ShareChildPage> {
  late final ShareCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<ShareCubit>();
  }

  @override
  Widget build(BuildContext context) {
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
                child: AppFileImage(path: widget.args.imagePath),
              ),
            ),
            12.height,
            _buildTemplateList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTemplateList() {
    return SizedBox(
      height: 80,
      width: double.maxFinite,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.args.colors.length,
        separatorBuilder: (context, index) => 10.width,
        itemBuilder: (context, index) {
          final hex = ColorUtils.colorToHex(color: widget.args.colors[index]);
          return PaletteColorListItem(
            color: widget.args.colors[index],
            hex: hex,
            onTap: () {
              // _cubit.selectTemplate(index);
            },
          );
        },
      ),
    );
  }
}
