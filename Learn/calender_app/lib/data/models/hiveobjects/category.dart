import 'package:hive/hive.dart';
import 'package:calender_app/hive_helper/hive_types.dart';
import 'package:calender_app/hive_helper/hive_adapters.dart';
import 'package:calender_app/hive_helper/fields/category_fields.dart';


part 'category.g.dart';


@HiveType(typeId: HiveTypes.category, adapterName: HiveAdapters.category)
class Category extends HiveObject{
	@HiveField(CategoryFields.name)
  String name;

  Category(this.name);
}