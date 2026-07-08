import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/constants/app_colors.dart';
import 'package:sylva/core/enums/language_type.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/app/interaction_cubit.dart';
import 'package:sylva/presentation/app/interaction_state.dart';
import 'package:sylva/presentation/app/locale_cubit.dart';
import 'package:sylva/presentation/app/theme_cubit.dart';
import 'package:sylva/presentation/app/theme_state.dart';
import 'package:sylva/presentation/features/settings/settings_cubit.dart';
import 'package:sylva/presentation/features/settings/settings_navigator.dart';
import 'package:sylva/presentation/widgets/buttons/app_radio_tile.dart';
import 'package:sylva/presentation/widgets/buttons/app_switch_tile.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';
import 'package:sylva/presentation/widgets/text/app_title_text.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsCubit(navigator: SettingsNavigator(context)),
      child: const _SettingsChildPage(),
    );
  }
}

class _SettingsChildPage extends StatefulWidget {
  const _SettingsChildPage();

  @override
  State<_SettingsChildPage> createState() => __SettingsChildPageState();
}

class __SettingsChildPageState extends State<_SettingsChildPage> {
  late final ThemeCubit _themeCubit;
  late final LocaleCubit _localeCubit;
  late final SettingsCubit _settingsCubit;
  late final InteractionCubit _interactionCubit;
  late S _l10n;
  late ThemeData _theme;

  @override
  void initState() {
    super.initState();
    _themeCubit = context.read<ThemeCubit>();
    _localeCubit = context.read<LocaleCubit>();
    _settingsCubit = context.read<SettingsCubit>();
    _interactionCubit = context.read<InteractionCubit>();
  }

  @override
  Widget build(BuildContext context) {
    _l10n = S.of(context);
    _theme = Theme.of(context);

    return AppScaffold(
      title: _l10n.settings,
      body: ListView(
        padding: EdgeInsets.fromLTRB(
          12,
          MediaQuery.of(context).padding.top + 72,
          12,
          MediaQuery.of(context).padding.bottom + 12,
        ),

        children: [
          _buildInteractionSection(),
          12.height,
          _buildThemeSection(),
          12.height,
          _buildSeedColorSection(),
          12.height,
          _buildLanguageSection(),
          12.height,
          _buildOtherSection(),
        ],
      ),
    );
  }

  Widget _buildThemeSection() {
    return BlocBuilder<ThemeCubit, ThemeState>(
      buildWhen: (previous, current) => previous.themeMode != current.themeMode,
      builder: (context, state) {
        final themeMode = state.themeMode;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitleText(title: _l10n.theme),
            Padding(
              padding: 12.paddingHorizontal,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppRadioTile<ThemeMode>(
                    title: _l10n.themeSystem,
                    value: ThemeMode.system,
                    groupValue: themeMode,
                    onChanged: (mode) {
                      if (mode != null) {
                        _themeCubit.updateTheme(mode: mode);
                      }
                    },
                  ),
                  AppRadioTile<ThemeMode>(
                    title: _l10n.themeLight,
                    value: ThemeMode.light,
                    groupValue: themeMode,
                    onChanged: (mode) {
                      if (mode != null) {
                        _themeCubit.updateTheme(mode: mode);
                      }
                    },
                  ),
                  AppRadioTile<ThemeMode>(
                    title: _l10n.themeDark,
                    value: ThemeMode.dark,
                    groupValue: themeMode,
                    onChanged: (mode) {
                      if (mode != null) {
                        _themeCubit.updateTheme(mode: mode);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSeedColorSection() {
    return BlocBuilder<ThemeCubit, ThemeState>(
      buildWhen: (previous, current) => previous.seedColor != current.seedColor,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitleText(title: _l10n.seedColor),
            Padding(
              padding: 12.paddingHorizontal,
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: AppColors.presetColors.map((color) {
                  final isSelected =
                      state.seedColor.toARGB32() == color.toARGB32();
                  return Material(
                    color: color,
                    shape: CircleBorder(
                      side: BorderSide(
                        color: isSelected
                            ? _theme.colorScheme.onSurface
                            : Colors.transparent,
                        width: 2.5,
                      ),
                    ),
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {
                        _themeCubit.updateSeedColor(color: color);
                      },
                      child: AnimatedContainer(
                        duration: 250.milliseconds,
                        curve: Curves.easeInOut,
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: color.withValues(alpha: 0.45),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ]
                              : null,
                        ),
                        child: isSelected
                            ? const Icon(
                                Icons.check_rounded,
                                color: Colors.white,
                                size: 22,
                              )
                            : null,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLanguageSection() {
    return BlocBuilder<LocaleCubit, LocaleState>(
      buildWhen: (previous, current) =>
          previous.locale.languageCode != current.locale.languageCode,
      builder: (context, state) {
        final locale = state.locale.languageCode;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitleText(title: _l10n.language),
            Padding(
              padding: 12.paddingHorizontal,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppRadioTile<String>(
                    title: LanguageType.en.name,
                    value: LanguageType.en.value,
                    groupValue: locale,
                    onChanged: (code) {
                      if (code != null) {
                        _localeCubit.changeLanguage(languageCode: code);
                      }
                    },
                  ),
                  AppRadioTile<String>(
                    title: LanguageType.vi.name,
                    value: LanguageType.vi.value,
                    groupValue: locale,
                    onChanged: (code) {
                      if (code != null) {
                        _localeCubit.changeLanguage(languageCode: code);
                      }
                    },
                  ),
                  AppRadioTile<String>(
                    title: LanguageType.ja.name,
                    value: LanguageType.ja.value,
                    groupValue: locale,
                    onChanged: (code) {
                      if (code != null) {
                        _localeCubit.changeLanguage(languageCode: code);
                      }
                    },
                  ),
                  AppRadioTile<String>(
                    title: LanguageType.zh.name,
                    value: LanguageType.zh.value,
                    groupValue: locale,
                    onChanged: (code) {
                      if (code != null) {
                        _localeCubit.changeLanguage(languageCode: code);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInteractionSection() {
    return BlocBuilder<InteractionCubit, InteractionState>(
      buildWhen: (previous, current) =>
          previous.hapticEnabled != current.hapticEnabled ||
          previous.soundEnabled != current.soundEnabled,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitleText(title: _l10n.interactionEffects),
            Padding(
              padding: 12.paddingHorizontal,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppSwitchTile(
                    title: _l10n.hapticFeedback,
                    value: state.hapticEnabled,
                    onChanged: (value) {
                      _interactionCubit.toggleHaptic();
                    },
                  ),
                  AppSwitchTile(
                    title: _l10n.soundEffects,
                    value: state.soundEnabled,
                    onChanged: (value) {
                      _interactionCubit.toggleSound();
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildOtherSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        AppTitleText(title: _l10n.informationAndSupport),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pinkAccent, Colors.deepPurpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: 16.borderRadius,
            boxShadow: [
              BoxShadow(
                color: Colors.pink.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: 16.borderRadius,
              onTap: () {
                _settingsCubit.navigator.goToSponsors();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 12.0,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.favorite, color: Colors.white, size: 28),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        _l10n.donation,
                        style: _theme.textTheme.titleSmall?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        _buildSettingFilledButton(
          title: _l10n.about,
          onTap: () {
            _settingsCubit.navigator.goToAbout();
          },
          icon: Icons.info_outline_rounded,
        ),
        _buildSettingFilledButton(
          title: _l10n.termsOfService,
          onTap: () {
            _settingsCubit.navigator.goToTermsOfService();
          },
          icon: Icons.description_outlined,
        ),
        _buildSettingFilledButton(
          title: _l10n.privacyPolicy,
          onTap: () {
            _settingsCubit.navigator.goToPrivacyPolicy();
          },
          icon: Icons.privacy_tip_outlined,
        ),
        _buildSettingFilledButton(
          title: _l10n.contact,
          onTap: () {
            _settingsCubit.navigator.goToContact();
          },
          icon: Icons.contact_support_outlined,
        ),
        _buildSettingFilledButton(
          title: _l10n.acknowledgements,
          onTap: () {
            _settingsCubit.navigator.goToThanksAndReference();
          },
          icon: Icons.format_quote,
        ),
      ],
    );
  }

  Widget _buildSettingFilledButton({
    required String title,
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: _theme.colorScheme.secondaryContainer.withValues(alpha: 0.5),
        borderRadius: 16.borderRadius,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: 16.borderRadius,
          onTap: onTap,
          child: Padding(
            padding: 12.paddingAll,
            child: Row(
              children: [
                Icon(icon, color: _theme.colorScheme.primary),
                12.width,
                Expanded(
                  child: Text(
                    title,
                    style: _theme.textTheme.titleSmall?.copyWith(
                      color: _theme.colorScheme.primary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
