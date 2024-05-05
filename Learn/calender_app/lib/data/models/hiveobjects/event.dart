import 'package:calender_app/hive_helper/fields/event_fields.dart';
import 'package:calender_app/hive_helper/hive_adapters.dart';
import 'package:calender_app/hive_helper/hive_types.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

import 'category.dart';

part 'event.g.dart';

@HiveType(typeId: HiveTypes.event, adapterName: HiveAdapters.event)
class Event extends HiveObject {
  @HiveField(EventFields.category)
  HiveList<Category> category;

  @HiveField(EventFields.date)
  DateTime date;

  @HiveField(EventFields.eventName)
  String eventName;

  @HiveField(EventFields.eventDescription)
  String eventDescription;

  @HiveField(EventFields.file)
  Uint8List? file;

  @HiveField(EventFields.completed)
  bool completed;

  Event(this.category, this.date, this.eventName, this.eventDescription,
      this.file, this.completed);
}
