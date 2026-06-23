import 'package:flutter/material.dart';
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
      showDragHandle: true,
      context: context,
      isScrollControlled: true,
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
