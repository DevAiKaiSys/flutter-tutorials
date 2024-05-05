import 'package:calender_app/data/repositories/category_repository_impl.dart';
import 'package:calender_app/data/repositories/event_repository_impl.dart';
import 'package:calender_app/domain/repositories/category_repository.dart';
import 'package:calender_app/domain/repositories/event_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  // Bloc

  // Use cases

  // Repositories
  getIt.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl());
  getIt.registerLazySingleton<EventRepository>(() => EventRepositoryImpl());

  // Data sources

  // Http service
}
