import 'package:isar/isar.dart';
import 'package:routine_app/data/models/category.dart';

import '../category_data_source.dart';
import '../local_database.dart';
import 'isar_database_impl.dart';

class CategoryLocalDataSourceImp implements CategoryDataSource {
  final LocalDatabase database;
  Isar get client => (database as IsarDatabaseImpl).isar;
  CategoryLocalDataSourceImp({required this.database});
  @override
  Future<List<Category>> getCategories() async {
    var allCategories = await client.categorys.where().findAll();
    return allCategories;
  }

  @override
  Future<void> saveCategory(Category newCategory) async {
    client.writeTxnSync<int>(() => client.categorys.putSync(newCategory));
  }
}
