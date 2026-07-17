import 'package:flutter/material.dart';
import 'package:sylva/core/constants/app_colors.dart';
import 'package:sylva/core/extensions/date_time_extension.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/core/utils/app_feedback.dart';
import 'package:sylva/data/entities/history_record.dart';
import 'package:sylva/presentation/widgets/containers/app_transparent_container.dart';
import 'package:sylva/presentation/widgets/images/app_file_image.dart';
import 'package:sylva/core/utils/file_utils.dart';

class HistoryGridItem extends StatefulWidget {
  final HistoryRecord record;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final bool isFavorite;
  final VoidCallback? onFavoritePressed;

  const HistoryGridItem({
    super.key,
    required this.record,
    this.onTap,
    this.onDelete,
    this.isFavorite = false,
    this.onFavoritePressed,
  });

  @override
  State<HistoryGridItem> createState() => _HistoryGridItemState();
}

class _HistoryGridItemState extends State<HistoryGridItem> {
  bool _isDeleting = false;

  void _handleDelete() {
    AppFeedback.playHeavy(context);
    if (_isDeleting) return;
    setState(() {
      _isDeleting = true;
    });
    Future.delayed(300.milliseconds, () {
      if (mounted) {
        widget.onDelete?.call();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: widget.onTap,
      borderRadius: 12.borderRadius,
      child: AnimatedOpacity(
        duration: 300.milliseconds,
        opacity: _isDeleting ? 0.0 : 1.0,
        curve: Curves.easeOut,
        child: AppTransparentContainer(
          padding: 1.paddingAll,
          border: 13.borderRadius,
          child: ClipRRect(
            borderRadius: 12.borderRadius,
            child: Stack(
              fit: StackFit.expand,
              children: [
                AppFileImage(
                  path: FileUtils.getFullImagePath(widget.record.imagePath),
                  fit: BoxFit.cover,
                  cacheHeight: 400,
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          theme.colorScheme.primaryContainer,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: 8.paddingAll,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (widget.record.userColors.isNotEmpty) ...[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      spacing: 4,
                                      children: [
                                        ...widget.record.userColors
                                            .take(5)
                                            .map(
                                              (c) => Container(
                                                width: 16,
                                                height: 16,
                                                decoration: BoxDecoration(
                                                  color: Color(c),
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                            ),
                                      ],
                                    ),
                                  ] else ...[
                                    16.height,
                                  ],
                                  8.height,
                                  Text(
                                    widget.record.createdAt.isToday
                                        ? widget.record.createdAt
                                              .toFormattedTime()
                                        : widget.record.createdAt
                                              .toFormattedDate(),
                                    style: theme.textTheme.titleSmall?.copyWith(
                                      color:
                                          theme.colorScheme.onPrimaryContainer,
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                                      ? AppColors.iconSelectionColor
                                      : theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 6,
                  right: 6,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _handleDelete,
                      customBorder: const CircleBorder(),
                      child: Container(
                        padding: 4.paddingAll,
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.5),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
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
