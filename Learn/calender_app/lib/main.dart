import 'package:calender_app/hive_helper/register_adapters.dart';
import 'package:calender_app/presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'injection_container.dart';

Future<void> main() async {
  await Hive.initFlutter();
  registerAdapters();
  setup();
  runApp(const MyApp());
}
