import 'package:calender_app/data/models/hiveobjects/category.dart';

abstract class CategoryRepository {
  Future<void> addCategory(Category category);
}
