import 'package:flutter/material.dart';
import 'package:routine_app/data/datasources/local_database.dart';
import 'package:routine_app/injection_container.dart';
import 'package:routine_app/presentation/app.dart';

Future<void> main() async {
  setup();

  final localDB = getIt.get<LocalDatabase>();
  await localDB.initDB();
  runApp(const MyApp());
}
