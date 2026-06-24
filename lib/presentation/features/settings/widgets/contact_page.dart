import 'package:flutter/material.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: S.of(context).contact,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            S.of(context).contact,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
