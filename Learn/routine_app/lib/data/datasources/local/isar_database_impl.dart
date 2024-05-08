import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:routine_app/data/datasources/local_database.dart';
import 'package:routine_app/data/models/category.dart';
import 'package:routine_app/data/models/routine.dart';

class IsarDatabaseImpl implements LocalDatabase {
  late final Isar isar;
  @override
  Future<void> initDB() async {
    final dir = await getApplicationSupportDirectory();
    isar = await Isar.open(
      [CategorySchema, RoutineSchema],
      directory: dir.path,
    );
  }
}
