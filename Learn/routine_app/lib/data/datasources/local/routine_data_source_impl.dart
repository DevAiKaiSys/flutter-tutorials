import 'package:isar/isar.dart';
import 'package:routine_app/data/datasources/routine_data_source.dart';
import 'package:routine_app/data/models/category.dart';
import 'package:routine_app/data/models/routine.dart';

import '../local_database.dart';
import 'isar_database_impl.dart';

class RoutineLocalDataSourceImp implements RoutineDataSource {
  final LocalDatabase database;
  Isar get client => (database as IsarDatabaseImpl).isar;
  RoutineLocalDataSourceImp({required this.database});

  @override
  Future<List<Routine>> getRoutines() async {
    var allCategories = await client.routines.where().findAll();
    return allCategories;
  }

  @override
  Future<void> saveRoutine(Routine newRoutine) async {
    if (newRoutine.category.value?.name != null) {
      var mappingCategory =
          client.categorys.getByNameSync(newRoutine.category.value!.name);
      newRoutine.category.value = mappingCategory;
    }
    client.writeTxnSync<int>(() => client.routines.putSync(newRoutine));
  }
}
