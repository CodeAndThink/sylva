import 'package:equatable/equatable.dart';
import 'package:sylva/core/enums/load_status.dart';
import 'package:sylva/data/entities/history_record.dart';

class HistoryState extends Equatable {
  final List<HistoryRecord> records;
  final LoadStatus status;

  const HistoryState({
    this.records = const [],
    this.status = LoadStatus.initial,
  });

  HistoryState copyWith({
    List<HistoryRecord>? records,
    LoadStatus? status,
  }) {
    return HistoryState(
      records: records ?? this.records,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [records, status];
}
