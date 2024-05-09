import 'package:routine_app/domain/entities/routine.entity.dart';
import 'package:routine_app/domain/repositories/routine_repository.dart';

import '../datasources/routine_data_source.dart';
import '../models/category.dart';
import '../models/routine.dart';

class RoutineRepositoryImpl implements RoutineRepository {
  final RoutineDataSource routineDataSource;

  RoutineRepositoryImpl({required this.routineDataSource});

  @override
  Future<List<RoutineEntity>> getRoutines() async {
    final List<Routine> routines = await routineDataSource.getRoutines();
    final List<RoutineEntity> routineEntitys =
        routines.map((model) => model.toEntity()).toList();
    return routineEntitys;
  }

  @override
  Future<void> saveRoutine(RoutineEntity entity) async {
    final category = Category();
    if (entity.category != null) {
      category.name = entity.category!.name;
    }
    final newRoutine = Routine()
      ..title = entity.title
      ..startTime = entity.startTime
      ..day = entity.day
      ..category.value = category;
    await routineDataSource.saveRoutine(newRoutine);
  }
}
