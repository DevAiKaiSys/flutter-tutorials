import 'package:flutter/services.dart';

import 'category.dart';

class Event {
  final List<Category> category;
  final DateTime date;

  final String eventName;

  final String eventDescription;

  final Uint8List? file;

  final bool completed;

  Event({
    required this.category,
    required this.date,
    required this.eventName,
    required this.eventDescription,
    required this.file,
    required this.completed,
  });
}
