import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sylva/core/configs/app_configs.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/share/share_cubit.dart';
import 'package:sylva/presentation/features/share/share_state.dart';
import 'package:sylva/presentation/widgets/text_fields/app_text_field.dart';

class ShareFontBottomSheet extends StatefulWidget {
  const ShareFontBottomSheet({super.key});

  @override
  State<ShareFontBottomSheet> createState() => _ShareFontBottomSheetState();
}

class _ShareFontBottomSheetState extends State<ShareFontBottomSheet> {
  late final List<String> _allGoogleFonts;
  List<String> _displayFonts = [];
  final TextEditingController _searchController = TextEditingController();
  late final ShareCubit _cubit;
  late ThemeData _theme;
  late S _l10n;

  @override
  void initState() {
    super.initState();
    _allGoogleFonts = GoogleFonts.asMap().keys.toList();
    _displayFonts = AppConfigs.defaultFonts;
    _cubit = context.read<ShareCubit>();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (query.trim().isEmpty) {
      setState(() {
        _displayFonts = AppConfigs.defaultFonts;
      });
    } else {
      final lowercaseQuery = query.toLowerCase();
      final results = _allGoogleFonts
          .where((font) {
            return font.toLowerCase().contains(lowercaseQuery);
          })
          .take(50)
          .toList(); // limit to 50 results to prevent lag

      setState(() {
        _displayFonts = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    _l10n = S.of(context);

    final double bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 24 + bottomInset),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: 20.radius),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(_l10n.fontSelection, style: _theme.textTheme.titleMedium),
          12.height,
          Padding(
            padding: 16.paddingHorizontal,
            child: AppTextField(
              hintText: _l10n.searchFont,
              controller: _searchController,
              onChanged: _onSearchChanged,
              prefixIcon: Icons.search,
            ),
          ),
          12.height,
          Flexible(
            child: BlocBuilder<ShareCubit, ShareState>(
              buildWhen: (previous, current) =>
                  previous.textFontFamily != current.textFontFamily ||
                  previous.downloadedFonts != current.downloadedFonts ||
                  previous.downloadingFonts != current.downloadingFonts,
              builder: (context, state) {
                if (_displayFonts.isEmpty) {
                  return Padding(
                    padding: 16.paddingAll,
                    child: Center(child: Text(_l10n.noFontsFound)),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: _displayFonts.length,
                  itemBuilder: (context, index) {
                    final fontName = _displayFonts[index];
                    final isSelected = state.textFontFamily == fontName;
                    final isDownloaded = state.downloadedFonts.contains(
                      fontName,
                    );
                    final isDownloading = state.downloadingFonts.contains(
                      fontName,
                    );

                    return ListTile(
                      onTap: () {
                        if (isDownloaded) {
                          _cubit.changeTextFontFamily(font: fontName);
                          _cubit.navigator.safePop();
                        } else if (!isDownloading) {
                          _cubit.downloadAndApplyFont(font: fontName);
                        }
                      },
                      leading: Icon(
                        isSelected
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        color: isSelected
                            ? _theme.colorScheme.primary
                            : _theme.colorScheme.onSurfaceVariant,
                      ),
                      title: Text(
                        fontName,
                        style: GoogleFonts.getFont(
                          fontName,
                          textStyle: _theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                      trailing: _buildTrailingIcon(
                        isDownloaded: isDownloaded,
                        isDownloading: isDownloading,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget? _buildTrailingIcon({
    required bool isDownloaded,
    required bool isDownloading,
  }) {
    if (isDownloading) {
      return SizedBox(
        width: 24,
        height: 24,
        child: SpinKitRipple(
          color: _theme.colorScheme.primary,
          size: MediaQuery.sizeOf(context).width * 0.5,
        ),
      );
    }
    if (!isDownloaded) {
      return Icon(Icons.download, color: _theme.colorScheme.primary);
    }
    return null;
  }
}
