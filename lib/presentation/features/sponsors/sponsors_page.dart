import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/presentation/features/sponsors/sponsors_cubit.dart';
import 'package:sylva/presentation/features/sponsors/sponsors_navigator.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';
import 'package:sylva/presentation/widgets/containers/app_transparent_container.dart';
import 'package:sylva/presentation/widgets/buttons/app_filled_button.dart';
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
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        child: AppTransparentContainer(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFFF5E5B).withValues(alpha: 0.1),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFF5E5B).withValues(alpha: 0.25),
                      blurRadius: 40,
                      spreadRadius: 8,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.favorite_rounded,
                  size: 72,
                  color: Color(0xFFFF5E5B),
                ),
              ),
              32.height,
              Text(
                S.of(context).sponsorsTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              16.height,
              Text(
                S.of(context).sponsorsDescription,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 1.5,
                  color: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.color?.withValues(alpha: 0.8),
                ),
              ),
              40.height,
              AppFilledButton(
                text: S.of(context).supportOnKofi,
                icon: Icons.coffee_rounded,
                backgroundColor: const Color(0xFFFF5E5B),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                onPressed: () {
                  AppFeedback.playInteract(context);
                  context.read<SponsorsCubit>().openKofiPage();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
