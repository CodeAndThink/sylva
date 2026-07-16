import 'package:equatable/equatable.dart';
import 'package:sylva/core/enums/load_status.dart';
import 'package:sylva/presentation/features/storage_management/record_storage_info.dart';

class StorageManagementState extends Equatable {
  final LoadStatus status;
  final int totalSizeInBytes;
  final List<RecordStorageInfo> records;

  const StorageManagementState({
    this.status = LoadStatus.initial,
    this.totalSizeInBytes = 0,
    this.records = const [],
  });

  StorageManagementState copyWith({
    LoadStatus? status,
    int? totalSizeInBytes,
    List<RecordStorageInfo>? records,
  }) {
    return StorageManagementState(
      status: status ?? this.status,
      totalSizeInBytes: totalSizeInBytes ?? this.totalSizeInBytes,
      records: records ?? this.records,
    );
  }

  @override
  List<Object?> get props => [status, totalSizeInBytes, records];
}
