import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        children: [_buildThemeSection(), _buildLanguageSection()],
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
                    title: Text(_l10n.english),
                    value: 'en',
                  ),
                  RadioListTile<String>(
                    title: Text(_l10n.vietnamese),
                    value: 'vi',
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
