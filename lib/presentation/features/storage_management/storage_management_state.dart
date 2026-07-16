import 'package:equatable/equatable.dart';
import 'package:sylva/core/enums/load_status.dart';

class StorageManagementState extends Equatable {
  final LoadStatus status;
  final int totalSizeInBytes;

  const StorageManagementState({
    this.status = LoadStatus.initial,
    this.totalSizeInBytes = 0,
  });

  StorageManagementState copyWith({LoadStatus? status, int? totalSizeInBytes}) {
    return StorageManagementState(
      status: status ?? this.status,
      totalSizeInBytes: totalSizeInBytes ?? this.totalSizeInBytes,
    );
  }

  @override
  List<Object?> get props => [status, totalSizeInBytes];
}
