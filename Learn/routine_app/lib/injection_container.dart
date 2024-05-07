import 'package:get_it/get_it.dart';
import 'package:routine_app/data/datasources/local/isar_database_impl.dart';
import 'package:routine_app/data/datasources/local_database.dart';

final getIt = GetIt.instance;

void setup() {
  // Bloc

  // Use cases

  // Repositories

  // Data sources

  // Http service

  // Database service
  getIt.registerLazySingleton<LocalDatabase>(() => IsarDatabaseImpl());
}
