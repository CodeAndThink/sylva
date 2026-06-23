import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/constants/app_assets.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/onbroard/onboard_cubit.dart';
import 'package:sylva/presentation/features/onbroard/onboard_navigator.dart';
import 'package:sylva/presentation/widgets/buttons/app_filled_button.dart';
import 'package:sylva/presentation/widgets/images/app_asset_image.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnBoardCubit(navigator: OnBoardNavigator(context)),
      child: const _OnboardingChildPage(),
    );
  }
}

class _OnboardingChildPage extends StatefulWidget {
  const _OnboardingChildPage();

  @override
  State<_OnboardingChildPage> createState() => __OnboardingChildPageState();
}

class __OnboardingChildPageState extends State<_OnboardingChildPage> {
  late final OnBoardCubit _cubit;
  late S _l10n;
  late ThemeData _theme;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<OnBoardCubit>();
  }

  @override
  Widget build(BuildContext context) {
    _l10n = S.of(context);
    _theme = Theme.of(context);
    return AppScaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: AppAssetImage(path: AppAssets.bgOnboard, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    _theme.colorScheme.surface,
                  ],
                  stops: const [0.0, 0.8, 1.0],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Padding(
                padding: 20.paddingAll,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [
                          Colors.red,
                          Colors.orange,
                          Colors.yellow,
                          Colors.green,
                          Colors.blue,
                          Colors.indigo,
                          Colors.purple,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child: Text(
                        _l10n.onboardTitle,
                        style: _theme.textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.w800,
                          height: 1.1,
                          color: _theme.colorScheme.onSurface,
                        ),
                      ),
                    ),
                    16.height,
                    Text(
                      _l10n.onboardDesc,
                      style: _theme.textTheme.titleMedium?.copyWith(
                        color: Colors.black,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 36,
            left: 24,
            right: 24,
            child: AppFilledButton(
              borderRadius: 30,
              onPressed: () {
                _cubit.navigateToHome();
              },
              text: _l10n.letGo,
            ),
          ),
        ],
      ),
    );
  }
}
