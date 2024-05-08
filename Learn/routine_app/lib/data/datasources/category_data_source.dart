import '../models/category.dart';

abstract class CategoryDataSource {
  Future<List<Category>> getCategories();
  Future<void> saveCategory(Category newCategory);
}
