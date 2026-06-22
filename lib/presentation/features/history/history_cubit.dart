import 'package:flutter/foundation.dart';
import 'package:isar_community/isar.dart';
import 'package:sylva/core/enums/load_status.dart';
import 'package:sylva/core/enums/time_group.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/data/entities/history_record.dart';
import 'package:sylva/presentation/features/history/history_navigator.dart';
import 'package:sylva/presentation/features/history/history_state.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';

class HistoryCubit extends BaseCubit<HistoryState> {
  final HistoryNavigator navigator;
  final Isar isarService;
  HistoryCubit({required this.navigator, required this.isarService})
    : super(const HistoryState());

  Future<void> loadHistory() async {
    if (state.status.isLoading) return;
    emit(state.copyWith(status: LoadStatus.loading));
    try {
      final records = await isarService.historyRecords
          .where()
          .sortByCreatedAtDesc()
          .findAll();
      final sortedRecords = List<HistoryRecord>.from(records);
      if (state.isSortAscending) {
        sortedRecords.sort((a, b) => a.createdAt.compareTo(b.createdAt));
      } else {
        sortedRecords.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      }

      final groupedItems = _computeGroupedItems(
        records: sortedRecords,
        isAscending: state.isSortAscending,
      );

      emit(
        state.copyWith(
          status: LoadStatus.success,
          records: sortedRecords,
          groupedItems: groupedItems,
        ),
      );
    } catch (e) {
      debugPrint('Error loading history: $e');
      emit(state.copyWith(status: LoadStatus.failure));
    }
  }

  void deleteRecord({required int id}) async {
    try {
      await isarService.writeTxn(() async {
        await isarService.historyRecords.delete(id);
      });

      final updatedRecords = List<HistoryRecord>.from(state.records)
        ..removeWhere((record) => record.id == id);

      final groupedItems = _computeGroupedItems(
        records: updatedRecords,
        isAscending: state.isSortAscending,
      );

      emit(state.copyWith(records: updatedRecords, groupedItems: groupedItems));
    } catch (e) {
      debugPrint('Error deleting record: $e');
    }
  }

  void goToPhotoPreview({required HistoryRecord record}) async {
    await navigator.goToPhotoPreview(record);
    loadHistory();
  }

  void toggleView() {
    emit(state.copyWith(isGridView: !state.isGridView));
  }

  void toggleSort() {
    final newAscending = !state.isSortAscending;
    final sortedRecords = List<HistoryRecord>.from(state.records);
    if (newAscending) {
      sortedRecords.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    } else {
      sortedRecords.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    }
    final groupedItems = _computeGroupedItems(
      records: sortedRecords,
      isAscending: newAscending,
    );
    emit(
      state.copyWith(
        isSortAscending: newAscending,
        records: sortedRecords,
        groupedItems: groupedItems,
      ),
    );
  }

  List<Object> _computeGroupedItems({
    required List<HistoryRecord> records,
    bool isAscending = false,
  }) {
    final flattened = <Object>[];
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(1.days);
    final last7Days = today.subtract(7.days);
    final last30Days = today.subtract(30.days);

    final grouped = <TimeGroup, List<HistoryRecord>>{};
    for (final record in records) {
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
}
