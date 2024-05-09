import 'package:routine_app/domain/entities/routine.entity.dart';

abstract class RoutineRepository {
  Future<List<RoutineEntity>> getRoutines();
  Future<void> saveRoutine(RoutineEntity newRoutine);
}
