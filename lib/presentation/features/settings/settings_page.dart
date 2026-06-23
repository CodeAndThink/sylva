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
  late S _l10n;

  @override
  void initState() {
    super.initState();
    _themeCubit = context.read<ThemeCubit>();
    _localeCubit = context.read<LocaleCubit>();
  }

  @override
  Widget build(BuildContext context) {
    _l10n = S.of(context);

    return AppScaffold(
      title: _l10n.settings,
      body: ListView(
        padding: EdgeInsets.fromLTRB(
          12,
          MediaQuery.of(context).padding.top + 75,
          12,
          12,
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
            gradient: const LinearGradient(
              colors: [Color(0xFFFF9A9E), Color(0xFFFECFEF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: 16.borderRadius,
            boxShadow: [
              BoxShadow(
                color: Colors.pink.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ListTile(
            leading: const Icon(Icons.favorite, color: Colors.white, size: 28),
            title: Text(
              _l10n.donation,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            trailing: const Icon(
              Icons.chevron_right_rounded,
              color: Colors.white,
            ),
            onTap: () {
              // TODO: Navigate to Donation
            },
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.secondaryContainer.withOpacity(0.5),
            borderRadius: 16.borderRadius,
          ),
          child: ListTile(
            leading: Icon(
              Icons.info_outline_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              _l10n.about,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {
              // TODO: Navigate to About
            },
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.secondaryContainer.withOpacity(0.5),
            borderRadius: 16.borderRadius,
          ),
          child: ListTile(
            leading: Icon(
              Icons.description_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              _l10n.termsOfService,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {
              // TODO: Navigate to Terms of Service
            },
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.secondaryContainer.withOpacity(0.5),
            borderRadius: 16.borderRadius,
          ),
          child: ListTile(
            leading: Icon(
              Icons.contact_support_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              _l10n.contact,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {
              // TODO: Navigate to Contact
            },
          ),
        ),
      ],
    );
  }
}
