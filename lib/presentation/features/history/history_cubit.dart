import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:isar_community/isar.dart';
import 'package:sylva/core/enums/load_status.dart';
import 'package:sylva/core/enums/time_group.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/data/entities/history_record.dart';
import 'package:sylva/presentation/features/history/history_navigator.dart';
import 'package:sylva/presentation/features/history/history_state.dart';
import 'package:sylva/presentation/features/photo_preview/photo_preview_page.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';
import 'package:sylva/core/utils/file_utils.dart';
import 'package:path/path.dart' as p;
import 'dart:io' as dart_io;

class HistoryCubit extends BaseCubit<HistoryState> {
  final HistoryNavigator navigator;
  final Isar isarService;
  static const int _pageSize = 30;

  HistoryCubit({required this.navigator, required this.isarService})
    : super(const HistoryState());

  Future<List<HistoryRecord>> _fetchPage(int offset) async {
    if (state.isFavoriteOnly) {
      if (state.isSortAscending) {
        return await isarService.historyRecords
            .filter()
            .isFavoriteEqualTo(true)
            .sortByCreatedAt()
            .offset(offset)
            .limit(_pageSize)
            .findAll();
      } else {
        return await isarService.historyRecords
            .filter()
            .isFavoriteEqualTo(true)
            .sortByCreatedAtDesc()
            .offset(offset)
            .limit(_pageSize)
            .findAll();
      }
    } else {
      if (state.isSortAscending) {
        return await isarService.historyRecords
            .where()
            .sortByCreatedAt()
            .offset(offset)
            .limit(_pageSize)
            .findAll();
      } else {
        return await isarService.historyRecords
            .where()
            .sortByCreatedAtDesc()
            .offset(offset)
            .limit(_pageSize)
            .findAll();
      }
    }
  }

  Future<void> loadHistory({bool isRefresh = false}) async {
    if (state.status.isLoading && !isRefresh) return;
    emit(state.copyWith(status: LoadStatus.loading, hasReachedMax: false));
    try {
      final newRecords = await _fetchPage(0);

      final groupedItems = _computeGroupedItems(
        records: newRecords,
        isAscending: state.isSortAscending,
        isFavoriteOnly: state.isFavoriteOnly,
      );

      emit(
        state.copyWith(
          status: LoadStatus.success,
          records: newRecords,
          groupedItems: groupedItems,
          hasReachedMax: newRecords.length < _pageSize,
        ),
      );
    } catch (e) {
      debugPrint('Error loading history: $e');
      emit(state.copyWith(status: LoadStatus.failure));
    }
  }

  Future<void> loadMoreHistory() async {
    if (state.isLoadingMore ||
        state.hasReachedMax ||
        state.status != LoadStatus.success) {
      return;
    }

    emit(state.copyWith(isLoadingMore: true));
    try {
      final offset = state.records.length;
      final newRecords = await _fetchPage(offset);

      if (newRecords.isEmpty) {
        emit(state.copyWith(hasReachedMax: true, isLoadingMore: false));
        return;
      }

      final updatedRecords = List<HistoryRecord>.from(state.records)
        ..addAll(newRecords);

      final groupedItems = _computeGroupedItems(
        records: updatedRecords,
        isAscending: state.isSortAscending,
        isFavoriteOnly: state.isFavoriteOnly,
      );

      emit(
        state.copyWith(
          records: updatedRecords,
          groupedItems: groupedItems,
          hasReachedMax: newRecords.length < _pageSize,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      debugPrint('Error loading more history: $e');
      emit(state.copyWith(isLoadingMore: false));
    }
  }

  void deleteRecord({required int id}) async {
    try {
      final recordToDelete = await isarService.historyRecords.get(id);
      if (recordToDelete == null) return;
      final imagePath = recordToDelete.imagePath;

      await isarService.writeTxn(() async {
        await isarService.historyRecords.delete(id);
      });

      // Check if any other records are still using this image file
      final usageCount = await isarService.historyRecords
          .filter()
          .imagePathEqualTo(imagePath)
          .count();

      if (usageCount == 0) {
        final fullPath = FileUtils.getFullImagePath(imagePath);
        final file = dart_io.File(fullPath);
        if (file.existsSync()) {
          file.deleteSync();
        }
      }

      final updatedRecords = List<HistoryRecord>.from(state.records)
        ..removeWhere((record) => record.id == id);

      final groupedItems = _computeGroupedItems(
        records: updatedRecords,
        isAscending: state.isSortAscending,
        isFavoriteOnly: state.isFavoriteOnly,
      );

      emit(state.copyWith(records: updatedRecords, groupedItems: groupedItems));
    } catch (e) {
      debugPrint('Error deleting record: $e');
    }
  }

  void clearHistory() async {
    try {
      await isarService.writeTxn(() async {
        await isarService.historyRecords.clear();
      });

      // Delete the entire sylva_images directory to clean up all files
      final dir = dart_io.Directory(
        p.join(FileUtils.appDocDirPath, 'sylva_images'),
      );
      if (dir.existsSync()) {
        dir.deleteSync(recursive: true);
      }

      emit(state.copyWith(records: [], groupedItems: []));
    } catch (e) {
      debugPrint('Error clearing history: $e');
    }
  }

  void goToPhotoPreview({required HistoryRecord record}) async {
    final timeBeforeNavigation = DateTime.now();
    await navigator.goToPhotoPreview(
      args: PhotoPreviewArguments(
        imagePath: FileUtils.getFullImagePath(record.imagePath),
        initialColors: record.userColors.map((c) => Color(c)).toList(),
        initialSelectedColor: record.selectedColor != null
            ? Color(record.selectedColor!)
            : null,
        historyRecordId: record.id,
      ),
    );

    // 1. Fetch only the current record to update it locally
    final updatedRecord = await isarService.historyRecords.get(record.id);

    // 2. Find any newly created records (e.g. from 'Save As New') while the user was on the Preview screen
    final newRecords = await isarService.historyRecords
        .filter()
        .createdAtGreaterThan(timeBeforeNavigation)
        .findAll();

    final currentRecords = List<HistoryRecord>.from(state.records);
    bool hasChanges = false;

    if (updatedRecord != null) {
      final index = currentRecords.indexWhere((e) => e.id == record.id);
      if (index != -1) {
        if (state.isFavoriteOnly && !updatedRecord.isFavorite) {
          // If in favorite mode and the record is no longer a favorite, remove it
          currentRecords.removeAt(index);
          hasChanges = true;
        } else {
          currentRecords[index] = updatedRecord;
          hasChanges = true;
        }
      }
    }

    final actuallyNewRecords = newRecords
        .where((r) => r.id != record.id)
        .toList();

    if (actuallyNewRecords.isNotEmpty) {
      currentRecords.addAll(actuallyNewRecords);
      // Re-sort the list since new items were added
      if (state.isSortAscending) {
        currentRecords.sort((a, b) => a.createdAt.compareTo(b.createdAt));
      } else {
        currentRecords.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      }
      hasChanges = true;
    } else if (hasChanges) {
      // Re-sort anyway if the updatedRecord changed its createdAt
      if (state.isSortAscending) {
        currentRecords.sort((a, b) => a.createdAt.compareTo(b.createdAt));
      } else {
        currentRecords.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      }
    }

    if (hasChanges) {
      final groupedItems = _computeGroupedItems(
        records: currentRecords,
        isAscending: state.isSortAscending,
        isFavoriteOnly: state.isFavoriteOnly,
      );

      emit(state.copyWith(records: currentRecords, groupedItems: groupedItems));
    }
  }

  void toggleView() {
    emit(state.copyWith(isGridView: !state.isGridView));
  }

  void toggleSort() {
    emit(state.copyWith(isSortAscending: !state.isSortAscending));
    loadHistory(isRefresh: true);
  }

  List<Object> _computeGroupedItems({
    required List<HistoryRecord> records,
    bool isAscending = false,
    bool isFavoriteOnly = false,
  }) {
    final flattened = <Object>[];
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(1.days);
    final last7Days = today.subtract(7.days);
    final last30Days = today.subtract(30.days);

    final grouped = <TimeGroup, List<HistoryRecord>>{};
    for (final record in records) {
      if (isFavoriteOnly && !record.isFavorite) continue;
      final date = DateTime(
        record.createdAt.year,
        record.createdAt.month,
        record.createdAt.day,
      );
      TimeGroup group;
      if (date == today) {
        group = TimeGroup.today;
      } else if (date == yesterday) {
        group = TimeGroup.yesterday;
      } else if (date.isAfter(last7Days)) {
        group = TimeGroup.last7Days;
      } else if (date.isAfter(last30Days)) {
        group = TimeGroup.last30Days;
      } else {
        group = TimeGroup.older;
      }
      grouped.putIfAbsent(group, () => []).add(record);
    }

    final groups = isAscending ? TimeGroup.values.reversed : TimeGroup.values;
    for (final group in groups) {
      if (grouped.containsKey(group)) {
        flattened.add(group);
        flattened.addAll(grouped[group]!);
      }
    }
    return flattened;
  }

  void toggleFavoriteOnly() {
    emit(state.copyWith(isFavoriteOnly: !state.isFavoriteOnly));
    loadHistory(isRefresh: true);
  }

  void toggleFavorite(int id) async {
    try {
      final record = await isarService.historyRecords.get(id);
      if (record != null) {
        record.isFavorite = !record.isFavorite;
        await isarService.writeTxn(() async {
          await isarService.historyRecords.put(record);
        });
        loadHistory();
      }
    } catch (e) {
      debugPrint('Error toggling favorite: $e');
    }
  }
}
