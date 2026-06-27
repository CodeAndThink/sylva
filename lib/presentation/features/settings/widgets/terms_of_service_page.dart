import 'package:flutter/material.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';
import 'package:sylva/presentation/widgets/text/app_title_text.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = S.of(context);
    return AppScaffold(
      title: l10n.termsOfService,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          16.0,
          MediaQuery.of(context).padding.top + 60 + 16,
          16.0,
          MediaQuery.of(context).padding.bottom + 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.termsOfServiceContent, style: theme.textTheme.bodyLarge),
            24.height,
            AppTitleText(title: l10n.tosTitle1),

            Text(l10n.tosContent1, style: theme.textTheme.bodyLarge),
            24.height,
            AppTitleText(title: l10n.tosTitle2),

            Text(l10n.tosContent2, style: theme.textTheme.bodyLarge),
            24.height,
            AppTitleText(title: l10n.tosTitle3),

            Text(l10n.tosContent3, style: theme.textTheme.bodyLarge),
            24.height,
            AppTitleText(title: l10n.tosTitle4),

            Text(l10n.tosContent4, style: theme.textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
