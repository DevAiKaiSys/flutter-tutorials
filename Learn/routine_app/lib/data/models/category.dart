import 'package:isar/isar.dart';
import 'package:routine_app/domain/entities/category.entity.dart';

part 'category.g.dart';

@Collection()
class Category {
  Id? id;
  @Index(unique: true)
  late String name;

  CategoryEntity toEntity() {
    return CategoryEntity(name);
  }
}
