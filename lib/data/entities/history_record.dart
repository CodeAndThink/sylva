import 'package:isar_community/isar.dart';

part 'history_record.g.dart';

@collection
class HistoryRecord {
  Id id = Isar.autoIncrement;
  String imagePath;
  List<int> userColors;
  int? selectedColor;
  DateTime createdAt;

  HistoryRecord({
    required this.imagePath,
    required this.userColors,
    this.selectedColor,
    required this.createdAt,
  });
}
