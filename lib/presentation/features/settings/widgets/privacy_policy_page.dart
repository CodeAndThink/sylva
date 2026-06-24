import 'package:flutter/material.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppScaffold(
      title: S.of(context).privacyPolicy,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          16.0,
          MediaQuery.of(context).padding.top + 75 + 16,
          16.0,
          MediaQuery.of(context).padding.bottom + 16.0,
        ),
        child: Text(
          S.of(context).privacyPolicyContent,
          style: theme.textTheme.bodyLarge?.copyWith(
            height: 1.6,
          ),
        ),
      ),
    );
  }
}
