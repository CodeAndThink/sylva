import 'package:flutter/material.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/data/entities/history_record.dart';
import 'package:sylva/presentation/widgets/containers/app_transparent_container.dart';
import 'package:sylva/presentation/widgets/images/app_file_image.dart';

class TemplateListItem extends StatelessWidget {
  final HistoryRecord record;
  final VoidCallback? onTap;

  const TemplateListItem({super.key, required this.record, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: 12.borderRadius,
      child: AppTransparentContainer(
        padding: 1.paddingAll,
        border: 13.borderRadius,
        child: ClipRRect(
          borderRadius: 12.borderRadius,
          child: AppFileImage(path: record.imagePath, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
