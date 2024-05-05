import 'package:hive/hive.dart';
import 'package:calender_app/data/models/hiveobjects/category.dart';
import 'package:calender_app/data/models/hiveobjects/event.dart';

void registerAdapters() {
	Hive.registerAdapter(CategoryAdapter());
	Hive.registerAdapter(EventAdapter());
}
