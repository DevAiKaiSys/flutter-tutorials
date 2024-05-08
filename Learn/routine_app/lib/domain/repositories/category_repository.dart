import '../entities/category.entity.dart';

abstract class CategoryRepository {
  Future<List<CategoryEntity>> getCategories();
  Future<void> saveCategory(CategoryEntity newCategory);
}
