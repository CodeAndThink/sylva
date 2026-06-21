import 'package:flutter/foundation.dart';
import 'package:isar_community/isar.dart';
import 'package:sylva/core/di/injection.dart';
import 'package:sylva/core/enums/load_status.dart';
import 'package:sylva/data/entities/history_record.dart';
import 'package:sylva/presentation/features/history/history_navigator.dart';
import 'package:sylva/presentation/features/history/history_state.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';

class HistoryCubit extends BaseCubit<HistoryState> {
  final HistoryNavigator navigator;
  HistoryCubit({required this.navigator}) : super(const HistoryState());

  Future<void> loadHistory() async {
    emit(state.copyWith(status: LoadStatus.loading));
    try {
      final isar = locator<Isar>();
      final records = await isar.historyRecords
          .where()
          .sortByCreatedAtDesc()
          .findAll();
      emit(state.copyWith(status: LoadStatus.success, records: records));
    } catch (e) {
      debugPrint('Error loading history: $e');
      emit(state.copyWith(status: LoadStatus.failure));
    }
  }

  void deleteRecord(int id) async {
    try {
      final isar = locator<Isar>();
      await isar.writeTxn(() async {
        await isar.historyRecords.delete(id);
      });
      loadHistory();
    } catch (e) {
      debugPrint('Error deleting record: $e');
    }
  }
}
