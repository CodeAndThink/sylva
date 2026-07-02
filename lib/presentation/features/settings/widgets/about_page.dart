import 'package:flutter/material.dart';
import 'package:sylva/core/configs/app_configs.dart';
import 'package:sylva/core/constants/app_assets.dart';
import 'package:sylva/core/constants/app_colors.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/widgets/images/app_asset_image.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = S.of(context);
    return AppScaffold(
      title: l10n.about,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          24.0,
          MediaQuery.of(context).padding.top + 60 + 24,
          24.0,
          MediaQuery.of(context).padding.bottom + 24.0,
        ),
        child: Column(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: 24.borderRadius,
                child: AppAssetImage(
                  path: AppAssets.icAppIcon,
                  width: 120,
                  height: 120,
                ),
              ),
            ),
            24.height,
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: AppColors.presetColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Text(
                AppConfigs.appName,
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  height: 1.1,
                  color: Colors.white,
                ),
              ),
            ),
            8.height,
            Text(
              l10n.version(AppConfigs.version),
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            32.height,
            Text(
              l10n.aboutSylvaDescription,
              style: theme.textTheme.bodyLarge?.copyWith(height: 1.5),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
