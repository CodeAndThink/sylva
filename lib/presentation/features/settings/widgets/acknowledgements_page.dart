import 'package:flutter/material.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';

class AcknowledgementsPage extends StatelessWidget {
  const AcknowledgementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppScaffold(
      title: S.of(context).acknowledgements,
      body: ListView(
        padding: EdgeInsets.fromLTRB(
          12.0,
          MediaQuery.of(context).padding.top + 75 + 12,
          12.0,
          MediaQuery.of(context).padding.bottom + 12.0,
        ),
        children: [
          Text(
            S.of(context).acknowledgementsIntro,
            style: theme.textTheme.titleMedium,
          ),
          24.height,
          _buildCreditItem(
            context: context,
            title: S.of(context).roadBlockIcon,
            attribution: S
                .of(context)
                .designedByAuthorFromFlaticon('Aranagraphics'),
          ),
          12.height,
          _buildCreditItem(
            context: context,
            title: S.of(context).colorsIcon,
            attribution: S.of(context).designedByAuthorFromFlaticon('Freepik'),
          ),
          12.height,
          _buildCreditItem(
            context: context,
            title: S.of(context).cameraIcon,
            attribution: S.of(context).designedByAuthorFromFlaticon('Freepik'),
          ),
          12.height,
          _buildCreditItem(
            context: context,
            title: S.of(context).rainbowHalftoneDotsBackground,
            attribution: S.of(context).designedByAuthorMagnific('kjpargeter'),
          ),
        ],
      ),
    );
  }

  Widget _buildCreditItem({
    required BuildContext context,
    required String title,
    required String attribution,
  }) {
    final theme = Theme.of(context);
    return Container(
      padding: 12.paddingAll,
      decoration: BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
        borderRadius: 16.borderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSecondaryContainer,
            ),
          ),
          8.height,
          Text(
            attribution,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSecondaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
