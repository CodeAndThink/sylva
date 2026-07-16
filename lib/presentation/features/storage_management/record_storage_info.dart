import 'package:equatable/equatable.dart';
import 'package:sylva/data/entities/history_record.dart';

class RecordStorageInfo extends Equatable {
  final HistoryRecord record;
  final int sizeInBytes;

  const RecordStorageInfo({required this.record, required this.sizeInBytes});

  @override
  List<Object?> get props => [record.id, sizeInBytes];
}
