import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/presentation/features/sponsors/sponsors_cubit.dart';
import 'package:sylva/presentation/features/sponsors/sponsors_navigator.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/core/utils/app_feedback.dart';

class SponsorsPage extends StatelessWidget {
  const SponsorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SponsorsCubit(navigator: SponsorsNavigator(context)),
      child: const _SponsorsChildPage(),
    );
  }
}

class _SponsorsChildPage extends StatefulWidget {
  const _SponsorsChildPage();

  @override
  State<_SponsorsChildPage> createState() => __SponsorsChildPageState();
}

class __SponsorsChildPageState extends State<_SponsorsChildPage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(title: S.of(context).sponsorsTitle, body: _buildBody());
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.coffee_rounded,
              size: 80,
              color: Color(0xFFFF5E5B),
            ),
            24.height,
            Text(
              S.of(context).sponsorsTitle,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            16.height,
            Text(
              S.of(context).sponsorsDescription,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            32.height,
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF5E5B),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(borderRadius: 16.borderRadius),
              ),
              onPressed: () {
                AppFeedback.playInteract(context);
                context.read<SponsorsCubit>().openKofiPage();
              },
              icon: const Icon(Icons.favorite_rounded),
              label: Text(
                S.of(context).supportOnKofi,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
