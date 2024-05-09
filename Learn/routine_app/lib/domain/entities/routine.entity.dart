import 'category.entity.dart';

class RoutineEntity {
  final String title;
  final String startTime;
  final String day;
  final CategoryEntity? category;

  RoutineEntity(
      {required this.title,
      required this.startTime,
      required this.day,
      required this.category});
}
