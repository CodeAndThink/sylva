import 'package:flutter/material.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';

class AcknowledgementsPage extends StatelessWidget {
  const AcknowledgementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = S.of(context);
    return AppScaffold(
      title: l10n.acknowledgements,
      body: ListView(
        padding: EdgeInsets.fromLTRB(
          12.0,
          MediaQuery.of(context).padding.top + 60 + 12,
          12.0,
          MediaQuery.of(context).padding.bottom + 12.0,
        ),
        children: [
          Text(l10n.acknowledgementsIntro, style: theme.textTheme.bodyMedium),
          20.height,
          _buildCreditItem(
            context: context,
            title: l10n.colorsIcon,
            attribution: l10n.designedByAuthorFromFlaticon('Freepik'),
          ),
          12.height,
          _buildCreditItem(
            context: context,
            title: l10n.cameraIcon,
            attribution: l10n.designedByAuthorFromFlaticon('Freepik'),
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
            style: theme.textTheme.titleSmall?.copyWith(
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
