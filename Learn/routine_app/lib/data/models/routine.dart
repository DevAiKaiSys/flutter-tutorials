import 'package:isar/isar.dart';
import 'package:routine_app/domain/entities/routine.entity.dart';

@Collection()
class Routine {
  late String title;
  late DateTime startTime;
  late String day;
  late String category;

  RoutineEntity toEntity() {
    return RoutineEntity(
        title: title, startTime: startTime, day: day, category: category);
  }
}
