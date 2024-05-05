import 'package:calender_app/data/models/hiveobjects/category.dart';
import 'package:calender_app/data/models/hiveobjects/event.dart';
import 'package:calender_app/domain/repositories/event_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class EventRepositoryImpl implements EventRepository {
  Future<Box<Event>> get _box async => await Hive.openBox<Event>('events');

  @override
  Future<List<Event>> getByCategory(String category) async {
    final box = await _box;
    return box.values
        .where((event) => event.category[0].name.contains(category))
        .toList();
  }

  @override
  Future<List<Event>> getEventsByDate(DateTime dateTime) async {
    final box = await _box;
    return box.values.where((event) => event.date == dateTime).toList();
  }

  @override
  Future<List<Event>> searchEvent(String searchWord) async {
    final box = await _box;
    return box.values
        .where((event) =>
            event.eventName.contains(searchWord) ||
            event.eventDescription.contains(searchWord) ||
            event.category[0].name.contains(searchWord))
        .toList();
  }

  @override
  Future<void> addEvent(Event event, Category category) async {
    final box = await _box;
    event.category.add(category);
    await box.add(event);
    event.save();
  }

  @override
  Future<void> updateEvent(Event event, Category cat) async {
    final box = await _box;
    event.category.clear();
    event.category.add(cat);
    await box.put(event.key, event);
    event.save();
  }

  @override
  Future<void> deleteEvent(Event event) async {
    final box = await _box;
    await box.delete(event.key);
  }
}
