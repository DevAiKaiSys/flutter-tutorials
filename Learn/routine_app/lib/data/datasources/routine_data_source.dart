import '../models/routine.dart';

abstract class RoutineDataSource {
  Future<List<Routine>> getRoutines();
  Future<void> saveRoutine(Routine newRoutine);
}
