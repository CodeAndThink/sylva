import 'dart:io';
import 'package:disk_space_2/disk_space_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as p;
import 'package:sylva/core/configs/app_configs.dart';
import 'package:sylva/core/constants/app_colors.dart';
import 'package:sylva/core/enums/language_type.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/core/utils/color_utils.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/app/interaction_cubit.dart';
import 'package:sylva/presentation/app/interaction_state.dart';
import 'package:sylva/presentation/app/locale_cubit.dart';
import 'package:sylva/presentation/app/theme_cubit.dart';
import 'package:sylva/presentation/app/theme_state.dart';
import 'package:sylva/presentation/features/settings/settings_cubit.dart';
import 'package:sylva/presentation/features/settings/settings_navigator.dart';
import 'package:sylva/presentation/features/settings/widgets/theme_color_button.dart';
import 'package:sylva/presentation/widgets/buttons/app_radio_tile.dart';
import 'package:sylva/presentation/widgets/buttons/app_switch_tile.dart';
import 'package:sylva/presentation/widgets/containers/app_transparent_container.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';
import 'package:sylva/presentation/widgets/text/app_title_text.dart';
import 'package:sylva/core/utils/file_utils.dart';

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

  int _totalSize = 0;
  int _deviceSize = 0;

  @override
  void initState() {
    super.initState();
    _themeCubit = context.read<ThemeCubit>();
    _localeCubit = context.read<LocaleCubit>();
    _settingsCubit = context.read<SettingsCubit>();
    _interactionCubit = context.read<InteractionCubit>();
    _fetchStorage();
  }

  Future<void> _fetchStorage() async {
    final targetDir = Directory(
      p.join(FileUtils.appDocDirPath, 'sylva_images'),
    );
    int dirSize = 0;
    if (await targetDir.exists()) {
      final files = targetDir.listSync(recursive: true);
      for (var entity in files) {
        if (entity is File) {
          dirSize += await entity.length();
        }
      }
    }
    final double? freeDiskSpaceMB = await DiskSpace.getFreeDiskSpace;
    final int freeDiskSpaceBytes = freeDiskSpaceMB != null
        ? (freeDiskSpaceMB * 1024 * 1024).toInt()
        : 0;

    if (mounted) {
      setState(() {
        _totalSize = dirSize;
        _deviceSize = freeDiskSpaceBytes;
      });
    }
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
          _buildStorageSection(),
          12.height,
          _buildOtherSection(),
          8.height,
          _buildAppVersion(),
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
                    titleStyle: _theme.textTheme.titleSmall,
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
                    titleStyle: _theme.textTheme.titleSmall,
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
                    titleStyle: _theme.textTheme.titleSmall,
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
      buildWhen: (previous, current) =>
          previous.seedColor != current.seedColor ||
          previous.customSeedColor != current.customSeedColor ||
          previous.isCustomSeedColor != current.isCustomSeedColor,
      builder: (context, state) {
        final isCustomColorSelected = state.isCustomSeedColor;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitleText(title: _l10n.seedColor),
            Padding(
              padding: 12.paddingHorizontal,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 12,
                runSpacing: 12,
                children: [
                  ...AppColors.presetColors.map((color) {
                    final isSelected =
                        !isCustomColorSelected &&
                        state.seedColor.toARGB32() == color.toARGB32();
                    return SizedBox(
                      height: 38,
                      width: 38,
                      child: Center(
                        child: ThemeColorButton(
                          color: color,
                          isSelected: isSelected,
                          onTap: () {
                            _themeCubit.updateSeedColor(color: color);
                          },
                        ),
                      ),
                    );
                  }),
                  state.customSeedColor != null
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ThemeColorButton(
                              color: state.customSeedColor!,
                              isSelected: isCustomColorSelected,
                              onTap: () {
                                if (!isCustomColorSelected) {
                                  _themeCubit.updateSeedColor(
                                    color: state.customSeedColor!,
                                    isCustom: true,
                                  );
                                }
                              },
                            ),
                            4.width,
                            AnimatedOpacity(
                              opacity:
                                  isCustomColorSelected &&
                                      state.customSeedColor != null
                                  ? 1
                                  : 0,
                              duration: 300.milliseconds,
                              child: IgnorePointer(
                                ignoring:
                                    !isCustomColorSelected ||
                                    state.customSeedColor == null,
                                child: InkWell(
                                  customBorder: const CircleBorder(),
                                  onTap: () {
                                    ColorUtils.showColorPicker(
                                      context,
                                      initialColor: state.customSeedColor!,
                                      onColorPicked: (color) {
                                        _themeCubit.updateSeedColor(
                                          color: color,
                                          isCustom: true,
                                        );
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.sync_rounded,
                                    color: _theme.colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : SizedBox(
                          width: 38,
                          height: 38,
                          child: Center(
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              onTap: () {
                                ColorUtils.showColorPicker(
                                  context,
                                  initialColor: state.seedColor,
                                  onColorPicked: (color) {
                                    _themeCubit.updateSeedColor(
                                      color: color,
                                      isCustom: true,
                                    );
                                  },
                                );
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _theme.colorScheme.surface,
                                  border: Border.all(
                                    color: _theme.colorScheme.onSurface,
                                    width: 1,
                                  ),
                                ),
                                child: Icon(Icons.colorize_rounded, size: 16),
                              ),
                            ),
                          ),
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
            Padding(
              padding: 12.paddingHorizontal,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppRadioTile<String>(
                    title: LanguageType.en.name,
                    titleStyle: _theme.textTheme.titleSmall,
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
                    titleStyle: _theme.textTheme.titleSmall,
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
                    titleStyle: _theme.textTheme.titleSmall,
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
                    titleStyle: _theme.textTheme.titleSmall,
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
                    titleStyle: _theme.textTheme.titleSmall,
                    value: state.hapticEnabled,
                    onChanged: (value) {
                      _interactionCubit.toggleHaptic();
                    },
                  ),
                  AppSwitchTile(
                    title: _l10n.soundEffects,
                    titleStyle: _theme.textTheme.titleSmall,
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

  Widget _buildStorageSection() {
    final percent = _deviceSize > 0
        ? (_totalSize / _deviceSize).clamp(0.0, 1.0)
        : 0.0;
    final percentStr = (percent * 100).toStringAsFixed(1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTitleText(title: _l10n.storageManagement),
        AppTransparentContainer(
          borderRadius: 24,
          padding: 16.paddingAll,
          backgroundColor: _theme.colorScheme.primaryContainer.withValues(
            alpha: 0.15,
          ),
          borderColor: _theme.colorScheme.primaryContainer,
          onTap: () async {
            await _settingsCubit.navigator.goToStorageManagement();
            _fetchStorage();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.storage_rounded,
                    color: _theme.colorScheme.onSurface,
                  ),
                  16.width,
                  Expanded(
                    child: Text(
                      _l10n.storageManagement,
                      style: _theme.textTheme.titleSmall?.copyWith(),
                    ),
                  ),
                  Text(
                    '$percentStr%',
                    style: _theme.textTheme.titleMedium?.copyWith(
                      color: _theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
              16.height,
              ClipRRect(
                borderRadius: 8.borderRadius,
                child: LinearProgressIndicator(
                  value: percent,
                  minHeight: 8,
                  backgroundColor: _theme.colorScheme.onSurface.withValues(
                    alpha: 0.1,
                  ),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    _theme.colorScheme.primary,
                  ),
                ),
              ),
              8.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    FileUtils.formatBytes(_totalSize),
                    style: _theme.textTheme.bodySmall?.copyWith(
                      color: _theme.colorScheme.onSurface.withValues(
                        alpha: 0.6,
                      ),
                    ),
                  ),
                  Text(
                    FileUtils.formatBytes(_deviceSize),
                    style: _theme.textTheme.bodySmall?.copyWith(
                      color: _theme.colorScheme.onSurface.withValues(
                        alpha: 0.6,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOtherSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTitleText(title: _l10n.informationAndSupport),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.pinkAccent,
                Colors.deepPurpleAccent.withValues(alpha: 0.7),
              ],
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
                _settingsCubit.navigator.goToAbout();
              },
              child: Padding(
                padding: 12.paddingAll,
                child: Row(
                  children: [
                    const Icon(Icons.favorite, color: Colors.white),
                    12.width,
                    Expanded(
                      child: Text(
                        _l10n.about,
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
        12.height,

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

  Widget _buildAppVersion() {
    return Padding(
      padding: 8.paddingAll,
      child: Text(
        "-- ${_l10n.version(AppConfigs.version)} --",
        style: _theme.textTheme.bodySmall?.copyWith(
          color: _theme.colorScheme.primary,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildSettingFilledButton({
    required String title,
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return Container(
      margin: 12.paddingBottom,
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
