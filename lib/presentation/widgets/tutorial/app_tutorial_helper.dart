import 'package:flutter/material.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

/// A helper class providing common tutorial coach mark functionality.
///
/// Used across multiple pages (Home, History, PhotoPreview) to show
/// onboarding tutorials with consistent styling.
class AppTutorialHelper {
  AppTutorialHelper._();

  /// Shows a [TutorialCoachMark] with the given [targets].
  ///
  /// Returns the created [TutorialCoachMark] instance for later reference
  /// (e.g., to dismiss it programmatically).
  static TutorialCoachMark showTutorial({
    required BuildContext context,
    required List<TargetFocus> targets,
  }) {
    final tutorialCoachMark = TutorialCoachMark(
      targets: targets,
      colorShadow: Colors.black,
      hideSkip: true,
      paddingFocus: 10,
      opacityShadow: 0.8,
    )..show(context: context);
    return tutorialCoachMark;
  }

  /// Builds a [TargetFocus] with consistent styling across pages.
  ///
  /// The [key] is used to identify and focus the target widget.
  /// [title] and [desc] are displayed in the tutorial overlay.
  static TargetFocus buildTarget({
    required BuildContext context,
    required GlobalKey key,
    required String title,
    required String desc,
    Alignment alignSkip = Alignment.topRight,
    ContentAlign contentAlign = ContentAlign.top,
    CustomTargetContentPosition? customPosition,
    ShapeLightFocus? shape,
    double? radius,
  }) {
    final theme = Theme.of(context);
    final l10n = S.of(context);
    return TargetFocus(
      identify: key,
      keyTarget: key,
      alignSkip: alignSkip,
      shape: shape,
      radius: radius,
      focusAnimationDuration: 400.milliseconds,
      unFocusAnimationDuration: 400.milliseconds,
      contents: [
        TargetContent(
          align: customPosition != null ? ContentAlign.custom : contentAlign,
          customPosition: customPosition,
          builder: (context, controller) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                  child: Text(
                    desc,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: controller.skip,
                      child: Text(
                        l10n.tutorialSkip,
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    8.width,
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                      ),
                      onPressed: controller.next,
                      child: Text(
                        l10n.tutorialNext,
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: theme.colorScheme.surface,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
