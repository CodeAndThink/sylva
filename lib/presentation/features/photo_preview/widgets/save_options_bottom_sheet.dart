import 'package:flutter/material.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/generated/l10n.dart';

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
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: 20.radius),
      ),
      builder: (_) => SaveOptionsBottomSheet(
        onSaveAsNew: onSaveAsNew,
        onReplaceExisting: onReplaceExisting,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.add_to_photos_outlined),
            title: Text(S.of(context).saveAsNew),
            onTap: () {
              Navigator.pop(context);
              onSaveAsNew();
            },
          ),
          ListTile(
            leading: const Icon(Icons.update_outlined),
            title: Text(S.of(context).replaceExistingRecord),
            onTap: () {
              Navigator.pop(context);
              onReplaceExisting();
            },
          ),
        ],
      ),
    );
  }
}
