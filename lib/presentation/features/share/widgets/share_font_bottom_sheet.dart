import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/share/share_cubit.dart';
import 'package:sylva/presentation/features/share/share_state.dart';

class ShareFontBottomSheet extends StatefulWidget {
  const ShareFontBottomSheet({super.key});

  @override
  State<ShareFontBottomSheet> createState() => _ShareFontBottomSheetState();
}

class _ShareFontBottomSheetState extends State<ShareFontBottomSheet> {
  static const List<String> defaultFonts = [
    'Nunito',
    'Roboto',
    'Open Sans',
    'Lato',
    'Montserrat',
    'Poppins',
    'Inter',
    'Raleway',
    'Playfair Display',
    'Oswald',
    'Merriweather',
    'Noto Sans',
    'Ubuntu',
    'Mukta',
    'PT Sans',
    'Rubik',
    'Work Sans',
    'Fira Sans',
    'Quicksand',
    'Barlow',
  ];

  late final List<String> _allGoogleFonts;
  List<String> _displayFonts = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _allGoogleFonts = GoogleFonts.asMap().keys.toList();
    _displayFonts = defaultFonts;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (query.trim().isEmpty) {
      setState(() {
        _displayFonts = defaultFonts;
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
    final theme = Theme.of(context);
    final l10n = S.of(context);

    final double bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 24 + bottomInset),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: 20.radius),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(l10n.fontSelection, style: theme.textTheme.titleMedium),
          16.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: l10n.searchFont,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 16,
                ),
              ),
            ),
          ),
          16.height,
          Flexible(
            child: BlocBuilder<ShareCubit, ShareState>(
              buildWhen: (previous, current) =>
                  previous.textFontFamily != current.textFontFamily ||
                  previous.downloadedFonts != current.downloadedFonts ||
                  previous.downloadingFonts != current.downloadingFonts,
              builder: (context, state) {
                if (_displayFonts.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(child: Text(l10n.noFontsFound)),
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
                          final cubit = context.read<ShareCubit>();
                          cubit.changeTextFontFamily(fontName);
                          cubit.navigator.safePop();
                        } else if (!isDownloading) {
                          context.read<ShareCubit>().downloadAndApplyFont(
                            fontName,
                          );
                        }
                      },
                      leading: Icon(
                        isSelected
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        color: isSelected
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onSurfaceVariant,
                      ),
                      title: Text(
                        fontName,
                        style: GoogleFonts.getFont(
                          fontName,
                          textStyle: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                      trailing: _buildTrailingIcon(
                        isDownloaded,
                        isDownloading,
                        theme,
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

  Widget? _buildTrailingIcon(
    bool isDownloaded,
    bool isDownloading,
    ThemeData theme,
  ) {
    if (isDownloading) {
      return const SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }
    if (!isDownloaded) {
      return Icon(Icons.download, color: theme.colorScheme.primary);
    }
    return null;
  }
}
