import 'package:injectable/injectable.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sylva/data/entities/history_record.dart';

@module
abstract class RegisterModule {
  @preResolve
  @lazySingleton
  Future<Isar> get isar async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [HistoryRecordSchema],
      directory: dir.path,
    );
    return isar;
  }

  @preResolve
  @lazySingleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
