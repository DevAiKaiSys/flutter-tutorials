import 'package:get_it/get_it.dart';
import 'package:routine_app/data/datasources/category_data_source.dart';
import 'package:routine_app/data/datasources/local/category_data_source_impl.dart';
import 'package:routine_app/data/datasources/local/isar_database_impl.dart';
import 'package:routine_app/data/datasources/local/routine_data_source_impl.dart';
import 'package:routine_app/data/datasources/local_database.dart';
import 'package:routine_app/data/datasources/routine_data_source.dart';
import 'package:routine_app/data/repositories/category_repository_impl.dart';
import 'package:routine_app/data/repositories/routine_repository_impl.dart';
import 'package:routine_app/domain/repositories/category_repository.dart';
import 'package:routine_app/domain/repositories/routine_repository.dart';

final getIt = GetIt.instance;

void setup() {
  // Bloc

  // Use cases

  // Repositories
  getIt.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(categoryDataSource: getIt()));
  getIt.registerLazySingleton<RoutineRepository>(
      () => RoutineRepositoryImpl(routineDataSource: getIt()));

  // Data sources
  getIt.registerLazySingleton<CategoryDataSource>(
      () => CategoryLocalDataSourceImp(database: getIt()));
  getIt.registerLazySingleton<RoutineDataSource>(
      () => RoutineLocalDataSourceImp(database: getIt()));

  // Http service

  // Database service
  getIt.registerLazySingleton<LocalDatabase>(() => IsarDatabaseImpl());
}
