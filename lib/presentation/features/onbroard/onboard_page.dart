import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/constants/app_assets.dart';
import 'package:sylva/core/constants/app_colors.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/onbroard/onboard_cubit.dart';
import 'package:sylva/presentation/features/onbroard/onboard_navigator.dart';
import 'package:sylva/presentation/widgets/containers/app_transparent_container.dart';
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

class __OnboardingChildPageState extends State<_OnboardingChildPage>
    with SingleTickerProviderStateMixin {
  late final OnBoardCubit _cubit;
  late S _l10n;
  late ThemeData _theme;

  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<OnBoardCubit>();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _l10n = S.of(context);
    _theme = Theme.of(context);
    return AppScaffold(
      body: Stack(
        children: [
          // --- Background Blobs ---
          Positioned(
            top: -150,
            left: -150,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.presetColors.first.withValues(alpha: 0.5),
                      AppColors.presetColors.first.withValues(alpha: 0.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            right: -150,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Container(
                width: 500,
                height: 500,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.presetColors.last.withValues(alpha: 0.5),
                      AppColors.presetColors.last.withValues(alpha: 0.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            right: -150,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      (AppColors.presetColors.length > 1
                              ? AppColors.presetColors[1]
                              : Colors.orange)
                          .withValues(alpha: 0.5),
                      (AppColors.presetColors.length > 1
                              ? AppColors.presetColors[1]
                              : Colors.orange)
                          .withValues(alpha: 0.0),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // --- End Background Blobs ---
          Positioned.fill(
            child: Padding(
              padding: 12.paddingAll,
              child: AppTransparentContainer(
                backgroundColor: Colors.transparent,
                padding: 24.paddingAll,
                borderRadius: 40,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: 75.borderRadius,
                          child: AppAssetImage(
                            path: AppAssets.icAppIcon,
                            width: 150,
                            height: 150,
                          ),
                        ),
                      ),
                      30.height,
                      ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: AppColors.presetColors,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds),
                        child: Text(
                          _l10n.onboardTitle,
                          style: _theme.textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.w800,
                            height: 1.1,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      16.height,
                      Text(
                        _l10n.onboardDesc,
                        style: _theme.textTheme.bodyMedium?.copyWith(
                          fontSize: 15,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: (MediaQuery.of(context).size.height * 0.1).paddingBottom,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Material(
                  color: _theme.colorScheme.primary,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      _cubit.navigateToHome();
                    },
                    borderRadius: 50.borderRadius,
                    child: Padding(
                      padding: 2.paddingAll,
                      child: AppTransparentContainer(
                        padding: 16.paddingAll,
                        borderRadius: 50,
                        backgroundColor: _theme.colorScheme.surface.withValues(
                          alpha: 0.3,
                        ),
                        child: Icon(
                          Icons.navigate_next_outlined,
                          color: _theme.colorScheme.onPrimary,
                          size: 36,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
