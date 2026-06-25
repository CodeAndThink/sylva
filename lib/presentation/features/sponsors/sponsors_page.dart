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
  late ThemeData _theme;
  late S _l10n;

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    _l10n = S.of(context);

    return AppScaffold(title: _l10n.sponsorsTitle, body: _buildBody());
  }

  Widget _buildBody() {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        child: AppTransparentContainer(
          padding: 32.paddingAll,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: 24.paddingAll,
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
                _l10n.sponsorsTitle,
                textAlign: TextAlign.center,
                style: _theme.textTheme.headlineMedium?.copyWith(
                  color: _theme.colorScheme.primary,
                ),
              ),
              16.height,
              Text(
                _l10n.sponsorsDescription,
                textAlign: TextAlign.center,
                style: _theme.textTheme.bodyLarge?.copyWith(
                  height: 1.5,
                  color: _theme.textTheme.bodyLarge?.color?.withValues(
                    alpha: 0.8,
                  ),
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
                textStyle: _theme.textTheme.titleLarge?.copyWith(
                  color: Colors.white,
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
