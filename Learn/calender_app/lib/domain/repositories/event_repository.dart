import 'package:calender_app/data/models/hiveobjects/category.dart';
import 'package:calender_app/data/models/hiveobjects/event.dart';

abstract class EventRepository {
  Future<List<Event>> getByCategory(String category);
  Future<List<Event>> getEventsByDate(DateTime dateTime);
  Future<List<Event>> searchEvent(String searchWord);
  Future<void> addEvent(Event event, Category category);
  Future<void> updateEvent(Event event, Category cat);
  Future<void> deleteEvent(Event event);
}
