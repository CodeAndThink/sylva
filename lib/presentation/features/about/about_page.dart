import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/constants/app_colors.dart';
import 'package:sylva/presentation/features/about/about_cubit.dart';
import 'package:sylva/presentation/features/about/about_navigator.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';
import 'package:sylva/presentation/widgets/containers/app_transparent_container.dart';
import 'package:sylva/presentation/widgets/buttons/app_filled_button.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/core/utils/app_feedback.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AboutCubit(navigator: AboutNavigator(context)),
      child: const _AboutChildPage(),
    );
  }
}

class _AboutChildPage extends StatefulWidget {
  const _AboutChildPage();

  @override
  State<_AboutChildPage> createState() => __AboutChildPageState();
}

class __AboutChildPageState extends State<_AboutChildPage> {
  late ThemeData _theme;
  late S _l10n;
  late final AboutCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<AboutCubit>();
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    _l10n = S.of(context);

    return AppScaffold(
      appBarColor: AppColors.aboutPrimary,
      title: _l10n.about,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Positioned(
          top: -150,
          left: -150,
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Color(0xFFFF5E5B).withValues(alpha: 0.5),
                  Color(0xFFFF5E5B).withValues(alpha: 0.0),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -100,
          right: -150,
          child: Container(
            width: 500,
            height: 500,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Color(0xFFFF5E5B).withValues(alpha: 0.5),
                  Color(0xFFFF5E5B).withValues(alpha: 0.0),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.25,
          right: -150,
          child: Container(
            width: 350,
            height: 350,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Color(0xFFFF5E5B).withValues(alpha: 0.5),
                  Color(0xFFFF5E5B).withValues(alpha: 0.0),
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 40.0,
            ),
            child: Center(
              child: AppTransparentContainer(
                backgroundColor: _theme.colorScheme.surface.withValues(
                  alpha: 0.5,
                ),
                padding: 30.paddingAll,
                borderColor: AppColors.aboutPrimary.withValues(alpha: 0.3),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: 24.paddingAll,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.aboutPrimary.withValues(alpha: 0.1),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.aboutPrimary.withValues(
                              alpha: 0.25,
                            ),
                            blurRadius: 40,
                            spreadRadius: 8,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.blur_on_rounded,
                        size: 72,
                        color: AppColors.aboutPrimary,
                      ),
                    ),
                    32.height,
                    Text(
                      _l10n.aboutUs,
                      textAlign: TextAlign.center,
                      style: _theme.textTheme.headlineSmall?.copyWith(
                        color: AppColors.aboutPrimary,
                      ),
                    ),
                    16.height,
                    Text(
                      _l10n.aboutDescription,
                      textAlign: TextAlign.center,
                      style: _theme.textTheme.bodyMedium?.copyWith(
                        height: 1.5,
                        color: _theme.colorScheme.onSurface.withValues(
                          alpha: 0.8,
                        ),
                      ),
                    ),
                    30.height,
                    AppFilledButton(
                      text: _l10n.visitOurWebsite,
                      icon: Icons.language_rounded,
                      backgroundColor: AppColors.aboutPrimary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 16,
                      ),
                      textStyle: _theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                      ),
                      onPressed: () {
                        AppFeedback.playInteract(context);
                        _cubit.openAppWebsite();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
