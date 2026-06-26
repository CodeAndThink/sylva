import 'package:flutter/material.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';
import 'package:sylva/presentation/widgets/text/app_title_text.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = S.of(context);
    return AppScaffold(
      title: l10n.privacyPolicy,
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
            Text(l10n.privacyPolicyContent, style: theme.textTheme.bodyLarge),
            24.height,
            AppTitleText(title: l10n.privacyPolicyTitle1),
            Text(l10n.privacyPolicyContent1, style: theme.textTheme.bodyLarge),
            24.height,
            AppTitleText(title: l10n.privacyPolicyTitle2),
            Text(l10n.privacyPolicyContent2, style: theme.textTheme.bodyLarge),
            24.height,
            AppTitleText(title: l10n.privacyPolicyTitle3),
            Text(l10n.privacyPolicyContent3, style: theme.textTheme.bodyLarge),
            24.height,
            AppTitleText(title: l10n.privacyPolicyTitle4),
            Text(l10n.privacyPolicyContent4, style: theme.textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
