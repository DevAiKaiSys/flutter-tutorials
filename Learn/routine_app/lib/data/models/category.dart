import 'package:isar/isar.dart';
import 'package:routine_app/domain/entities/category.entity.dart';

@Collection()
class Category {
  late String name;

  CategoryEntity toEntity() {
    return CategoryEntity(name);
  }
}
