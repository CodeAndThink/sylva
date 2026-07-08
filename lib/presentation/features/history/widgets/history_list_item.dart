import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sylva/core/extensions/date_time_extension.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/core/utils/app_feedback.dart';
import 'package:sylva/data/entities/history_record.dart';
import 'package:sylva/core/utils/throttle_utils.dart';
import 'package:sylva/presentation/widgets/containers/app_transparent_container.dart';
import 'package:sylva/presentation/widgets/images/app_file_image.dart';
import 'package:sylva/generated/l10n.dart';

class HistoryListItem extends StatefulWidget {
  final HistoryRecord record;
  final VoidCallback? onDelete;
  final VoidCallback? onTap;
  final bool isFavorite;
  final VoidCallback? onFavoritePressed;
  const HistoryListItem({
    super.key,
    required this.record,
    this.onDelete,
    this.onTap,
    this.isFavorite = false,
    this.onFavoritePressed,
  });

  @override
  State<HistoryListItem> createState() => _HistoryListItemState();
}

class _HistoryListItemState extends State<HistoryListItem> {
  double _width = 88;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: 12.paddingBottom,
      child: Slidable(
        key: ValueKey(widget.record.id),
        endActionPane: widget.onDelete != null
            ? ActionPane(
                motion: const ScrollMotion(),
                dismissible: DismissiblePane(onDismissed: widget.onDelete!),
                children: [
                  CustomSlidableAction(
                    autoClose: false,
                    onPressed: (context) {
                      AppFeedback.playHeavy(context);
                      final slidable = Slidable.of(context);
                      if (slidable != null && widget.onDelete != null) {
                        slidable.dismiss(
                          ResizeRequest(300.milliseconds, widget.onDelete!),
                          duration: 300.milliseconds,
                        );
                      } else {
                        widget.onDelete?.call();
                      }
                    },
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                    child: Container(
                      margin: 12.paddingLeft,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.error.withValues(alpha: 0.9),
                        borderRadius: 20.borderRadius,
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.clear_outlined,
                            color: Colors.white,
                            size: 28,
                          ),
                          4.height,
                          Text(
                            S.of(context).delete,
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : null,
        child: AppTransparentContainer(
          onTap: () {
            ThrottleUtils.safeOnTap(() async {
              setState(() => _width = 0);
              await Future.delayed(250.milliseconds);
              widget.onTap?.call();
              if (mounted) setState(() => _width = 88);
            }, delayMs: 1000);
          },
          backgroundColor: theme.colorScheme.primaryContainer,
          padding: 1.paddingAll,
          height: 110,
          width: double.maxFinite,
          borderRadius: 20,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 109,
                  width: 109,
                  child: ClipRRect(
                    borderRadius: 18.borderRadiusLeft,
                    child: AppFileImage(
                      path: widget.record.imagePath,
                      fit: BoxFit.cover,
                      cacheHeight: 250,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  AnimatedContainer(
                    duration: 250.milliseconds,
                    curve: Curves.easeInOutCubic,
                    width: _width,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: 16.borderRadiusLeft.copyWith(
                          topRight: 18.radius,
                          bottomRight: 18.radius,
                        ),
                        color: theme.colorScheme.primaryContainer,
                        image: DecorationImage(
                          image: ResizeImage(
                            FileImage(File(widget.record.imagePath)),
                            height: 250,
                          ),
                          fit: BoxFit.cover,
                          opacity: 0.2,
                        ),
                      ),
                      padding: 4.paddingVertical.copyWith(left: 8, right: 8),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  AppFeedback.playInteract(context);
                                  widget.onFavoritePressed?.call();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: 24.borderRadius,
                                    color: widget.isFavorite
                                        ? Colors.yellow.shade100
                                        : theme.colorScheme.surface,
                                    border: Border.all(
                                      color: widget.isFavorite
                                          ? Colors.orange
                                          : theme.colorScheme.onSurfaceVariant,
                                      width: 1,
                                    ),
                                  ),
                                  padding: 4.paddingAll,
                                  child: Icon(
                                    widget.isFavorite
                                        ? Icons.bookmark
                                        : Icons.bookmark_outline_rounded,
                                    color: widget.isFavorite
                                        ? Colors.amber
                                        : theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            spacing: 4,
                            children: [
                              if (widget.record.userColors.isNotEmpty)
                                ...widget.record.userColors
                                    .take(5)
                                    .map(
                                      (c) => Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: Color(c),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                              const Spacer(),
                              Text(
                                widget.record.createdAt.isToday
                                    ? widget.record.createdAt.toFormattedTime()
                                    : widget.record.createdAt.toFormattedDate(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.titleSmall?.copyWith(
                                  color: theme.colorScheme.onPrimaryContainer,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
