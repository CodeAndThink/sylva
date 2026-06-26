import 'package:equatable/equatable.dart';
import 'package:sylva/core/enums/load_status.dart';
import 'package:sylva/data/entities/history_record.dart';

class HistoryState extends Equatable {
  final List<HistoryRecord> records;
  final List<Object> groupedItems;
  final LoadStatus status;
  final bool isSortAscending;
  final bool isGridView;
  final bool isFavoriteOnly;

  const HistoryState({
    this.records = const [],
    this.groupedItems = const [],
    this.status = LoadStatus.initial,
    this.isSortAscending = false,
    this.isGridView = false,
    this.isFavoriteOnly = false,
  });

  HistoryState copyWith({
    List<HistoryRecord>? records,
    List<Object>? groupedItems,
    LoadStatus? status,
    bool? isSortAscending,
    bool? isGridView,
    bool? isFavoriteOnly,
  }) {
    return HistoryState(
      records: records ?? this.records,
      groupedItems: groupedItems ?? this.groupedItems,
      status: status ?? this.status,
      isSortAscending: isSortAscending ?? this.isSortAscending,
      isGridView: isGridView ?? this.isGridView,
      isFavoriteOnly: isFavoriteOnly ?? this.isFavoriteOnly,
    );
  }

  @override
  List<Object?> get props => [
    records,
    groupedItems,
    status,
    isSortAscending,
    isGridView,
    isFavoriteOnly,
  ];
}
