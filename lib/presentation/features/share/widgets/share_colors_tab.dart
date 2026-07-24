import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/photo_preview/widgets/palette_color_list_item.dart';
import 'package:sylva/presentation/features/share/share_cubit.dart';
import 'package:sylva/presentation/features/share/share_state.dart';
import 'package:sylva/presentation/widgets/text/app_title_text.dart';

class ShareColorsTab extends StatefulWidget {
  final List<Color> genColors;
  final List<Color> userColors;

  const ShareColorsTab({
    super.key,
    required this.genColors,
    required this.userColors,
  });

  @override
  State<ShareColorsTab> createState() => _ShareColorsTabState();
}

class _ShareColorsTabState extends State<ShareColorsTab> {
  late final ScrollController _scrollController;
  late final ShareCubit _cubit;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _cubit = context.read<ShareCubit>();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return BlocBuilder<ShareCubit, ShareState>(
      buildWhen: (previous, current) {
        return previous.selectedColors != current.selectedColors;
      },
      builder: (context, state) {
        return Column(
          children: [
            if (widget.genColors.isEmpty && widget.userColors.isEmpty)
              55.height
            else ...[
              if (widget.genColors.isNotEmpty)
                Column(
                  children: [
                    AppTitleText(title: l10n.autoDetectColors),
                    SizedBox(
                      height: 55,
                      child: ListView.separated(
                        itemCount: widget.genColors.length,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => 10.width,
                        itemBuilder: (context, index) {
                          final color = widget.genColors[index];
                          return PaletteColorListItem(
                            color: color,
                            isSelected: state.selectedColors.contains(color),
                            onTap: () {
                              _cubit.toggleSelectedColor(color: color);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              8.height,
              if (widget.userColors.isNotEmpty)
                Column(
                  children: [
                    AppTitleText(title: l10n.myColors),
                    SizedBox(
                      height: 55,
                      child: ListView.separated(
                        itemCount: widget.userColors.length,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => 10.width,
                        itemBuilder: (context, index) {
                          final color = widget.userColors[index];

                          return Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              PaletteColorListItem(
                                color: color,
                                isSelected: state.selectedColors.contains(
                                  color,
                                ),
                                onTap: () {
                                  _cubit.toggleSelectedColor(color: color);
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
            ],
          ],
        );
      },
    );
  }
}
