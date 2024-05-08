import 'package:routine_app/domain/entities/category.entity.dart';
import 'package:routine_app/domain/repositories/category_repository.dart';

import '../datasources/category_data_source.dart';
import '../models/category.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryDataSource categoryDataSource;

  CategoryRepositoryImpl({required this.categoryDataSource});
  @override
  Future<List<CategoryEntity>> getCategories() async {
    final List<Category> categories = await categoryDataSource.getCategories();
    final List<CategoryEntity> categoryEntitys =
        categories.map((model) => model.toEntity()).toList();
    return categoryEntitys;
  }

  @override
  Future<void> saveCategory(CategoryEntity entity) async {
    final newCategory = Category()..name = entity.name;
    await categoryDataSource.saveCategory(newCategory);
  }
}
