import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/share/share_cubit.dart';
import 'package:sylva/presentation/features/share/share_state.dart';

class ShareFontBottomSheet extends StatelessWidget {
  const ShareFontBottomSheet({super.key});

  static const List<String> availableFonts = [
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
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = S.of(context);

    final String title = l10n.fontSelection;

    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: 20.radius),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: theme.textTheme.titleMedium),
          16.height,
          Flexible(
            child: BlocBuilder<ShareCubit, ShareState>(
              buildWhen: (previous, current) =>
                  previous.textFontFamily != current.textFontFamily ||
                  previous.downloadedFonts != current.downloadedFonts ||
                  previous.downloadingFonts != current.downloadingFonts,
              builder: (context, state) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: availableFonts.length,
                  itemBuilder: (context, index) {
                    final fontName = availableFonts[index];
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
