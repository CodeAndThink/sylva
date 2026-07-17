import 'package:flutter/material.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/photo_preview/widgets/save_option_button.dart';
import 'package:sylva/presentation/widgets/containers/app_transparent_container.dart';

class SaveOptionsBottomSheet extends StatelessWidget {
  final VoidCallback onSaveAsNew;
  final VoidCallback onReplaceExisting;

  const SaveOptionsBottomSheet({
    super.key,
    required this.onSaveAsNew,
    required this.onReplaceExisting,
  });

  static Future<void> show({
    required BuildContext context,
    required VoidCallback onSaveAsNew,
    required VoidCallback onReplaceExisting,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (_) => SaveOptionsBottomSheet(
        onSaveAsNew: onSaveAsNew,
        onReplaceExisting: onReplaceExisting,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final theme = Theme.of(context);
    return AppTransparentContainer(
      border: 28.borderRadiusTop,
      padding: 5.paddingAll,
      backgroundColor: theme.colorScheme.surfaceContainerHigh,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SaveOptionButton(
              icon: Icons.published_with_changes_rounded,
              title: l10n.replaceExistingRecord,
              onTap: onReplaceExisting,
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
            ),
            SaveOptionButton(
              icon: Icons.add_to_photos_rounded,
              title: l10n.saveAsNew,
              onTap: onSaveAsNew,
            ),
          ],
        ),
      ),
    );
  }
}
