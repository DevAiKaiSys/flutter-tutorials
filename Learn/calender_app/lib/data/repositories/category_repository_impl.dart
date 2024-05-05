import 'package:calender_app/data/models/hiveobjects/category.dart';
import 'package:calender_app/domain/repositories/category_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  Future<Box<Category>> get _box async =>
      await Hive.openBox<Category>('categories');
  @override
  Future<void> addCategory(category) async {
    final box = await _box;
    await box.add(category);
  }
}
