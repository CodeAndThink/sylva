import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/enums/language_type.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/app/locale_cubit.dart';
import 'package:sylva/presentation/app/theme_cubit.dart';
import 'package:sylva/presentation/app/theme_state.dart';
import 'package:sylva/presentation/features/settings/settings_cubit.dart';
import 'package:sylva/presentation/features/settings/settings_navigator.dart';
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
  late S _l10n;
  late ThemeData _theme;

  @override
  void initState() {
    super.initState();
    _themeCubit = context.read<ThemeCubit>();
    _localeCubit = context.read<LocaleCubit>();
    _settingsCubit = context.read<SettingsCubit>();
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
          MediaQuery.of(context).padding.top + 75,
          12,
          MediaQuery.of(context).padding.bottom + 12,
        ),
        children: [
          _buildThemeSection(),
          _buildLanguageSection(),
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
            RadioGroup<ThemeMode>(
              groupValue: themeMode,
              onChanged: (mode) {
                if (mode != null) {
                  _themeCubit.updateTheme(mode: mode);
                }
              },
              child: Column(
                children: [
                  RadioListTile<ThemeMode>(
                    title: Text(_l10n.themeSystem),
                    value: ThemeMode.system,
                  ),
                  RadioListTile<ThemeMode>(
                    title: Text(_l10n.themeLight),
                    value: ThemeMode.light,
                  ),
                  RadioListTile<ThemeMode>(
                    title: Text(_l10n.themeDark),
                    value: ThemeMode.dark,
                  ),
                ],
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
            RadioGroup<String>(
              groupValue: locale,
              onChanged: (code) {
                if (code != null) {
                  _localeCubit.changeLanguage(languageCode: code);
                }
              },
              child: Column(
                children: [
                  RadioListTile<String>(
                    title: Text(LanguageType.en.name),
                    value: LanguageType.en.value,
                  ),
                  RadioListTile<String>(
                    title: Text(LanguageType.vi.name),
                    value: LanguageType.vi.value,
                  ),
                  RadioListTile<String>(
                    title: Text(LanguageType.ja.name),
                    value: LanguageType.ja.value,
                  ),
                  RadioListTile<String>(
                    title: Text(LanguageType.zh.name),
                    value: LanguageType.zh.value,
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
      spacing: 12,
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
                // TODO: Navigate to Donation
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16.0,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.favorite, color: Colors.white, size: 28),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        _l10n.donation,
                        style: _theme.textTheme.titleMedium?.copyWith(
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
          color: Theme.of(context).colorScheme.primary,
          title: _l10n.about,
          onTap: () {
            _settingsCubit.navigator.goToAbout();
          },
          icon: Icons.info_outline_rounded,
        ),
        _buildSettingFilledButton(
          color: Theme.of(context).colorScheme.primary,
          title: _l10n.termsOfService,
          onTap: () {
            _settingsCubit.navigator.goToTermsOfService();
          },
          icon: Icons.description_outlined,
        ),
        _buildSettingFilledButton(
          color: Theme.of(context).colorScheme.primary,
          title: _l10n.privacyPolicy,
          onTap: () {
            _settingsCubit.navigator.goToPrivacyPolicy();
          },
          icon: Icons.privacy_tip_outlined,
        ),
        _buildSettingFilledButton(
          color: Theme.of(context).colorScheme.primary,
          title: _l10n.contact,
          onTap: () {
            _settingsCubit.navigator.goToContact();
          },
          icon: Icons.contact_support_outlined,
        ),
        _buildSettingFilledButton(
          color: Theme.of(context).colorScheme.primary,
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
    required Color color,
    required String title,
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: 16.borderRadius,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: 16.borderRadius,
          onTap: onTap,
          child: Padding(
            padding: 16.paddingAll,
            child: Row(
              children: [
                Icon(icon, color: color),
                16.width,
                Expanded(
                  child: Text(
                    title,
                    style: _theme.textTheme.titleMedium?.copyWith(
                      color: _theme.colorScheme.onPrimaryContainer,
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
