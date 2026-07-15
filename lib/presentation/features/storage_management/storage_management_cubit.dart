import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:isar_community/isar.dart';
import 'package:path/path.dart' as p;
import 'package:sylva/core/di/injection.dart';
import 'package:sylva/core/enums/load_status.dart';
import 'package:sylva/core/utils/file_utils.dart';
import 'package:sylva/data/entities/history_record.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';
import 'storage_management_navigator.dart';
import 'storage_management_state.dart';

class StorageManagementCubit extends BaseCubit<StorageManagementState> {
  final StorageManagementNavigator navigator;

  StorageManagementCubit({required this.navigator})
    : super(const StorageManagementState());

  Future<void> calculateStorage() async {
    safeEmit(state.copyWith(status: LoadStatus.loading));
    try {
      final targetDir = Directory(
        p.join(FileUtils.appDocDirPath, 'sylva_images'),
      );
      int dirSize = 0;
      if (await targetDir.exists()) {
        final files = targetDir.listSync(recursive: true);
        for (var entity in files) {
          if (entity is File) {
            dirSize += await entity.length();
          }
        }
      }
      safeEmit(
        state.copyWith(status: LoadStatus.success, totalSizeInBytes: dirSize),
      );
    } catch (e) {
      debugPrint('Error calculating storage: $e');
      safeEmit(state.copyWith(status: LoadStatus.failure));
    }
  }

  Future<void> clearUnfavorited() async {
    safeEmit(state.copyWith(status: LoadStatus.loading));
    try {
      final isar = locator<Isar>();
      final unfavoritedRecords = await isar.historyRecords
          .filter()
          .isFavoriteEqualTo(false)
          .findAll();

      for (var record in unfavoritedRecords) {
        if (!p.isAbsolute(record.imagePath)) {
          final path = FileUtils.getFullImagePath(record.imagePath);
          final file = File(path);
          if (await file.exists()) {
            await file.delete();
          }
        }
      }

      await isar.writeTxn(() async {
        await isar.historyRecords.deleteAll(
          unfavoritedRecords.map((e) => e.id).toList(),
        );
      });

      await calculateStorage();
    } catch (e) {
      debugPrint('Error clearing unfavorited: $e');
      safeEmit(state.copyWith(status: LoadStatus.failure));
    }
  }

  Future<void> clearAll() async {
    safeEmit(state.copyWith(status: LoadStatus.loading));
    try {
      final isar = locator<Isar>();

      final targetDir = Directory(
        p.join(FileUtils.appDocDirPath, 'sylva_images'),
      );
      if (await targetDir.exists()) {
        final files = targetDir.listSync();
        for (var entity in files) {
          if (entity is File) {
            await entity.delete();
          }
        }
      }

      await isar.writeTxn(() async {
        await isar.historyRecords.clear();
      });

      await calculateStorage();
    } catch (e) {
      debugPrint('Error clearing all: $e');
      safeEmit(state.copyWith(status: LoadStatus.failure));
    }
  }
}
