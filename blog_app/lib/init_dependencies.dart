import 'package:blog_app/business_logic_layer/auth/bloc/auth_bloc.dart';
import 'package:blog_app/core/secrets/app_secrets.dart';
import 'package:data_layer/data_layer.dart';
import 'package:get_it/get_it.dart';
import 'package:repository_layer/auth/auth_repository.dart';
import 'package:repository_layer/auth/auth_repository_impl.dart';
import 'package:repository_layer/auth/usecases/current_user.dart';
import 'package:repository_layer/auth/usecases/user_login.dart';
import 'package:repository_layer/auth/usecases/user_sign_up.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);
}

void _initAuth() {
  // data_layer
  serviceLocator
    ..registerFactory<AuthApi>(() => SupabaseAuthApi(serviceLocator()))

    // repository_layer
    ..registerFactory<AuthRepository>(
        () => AuthRepositoryImpl(serviceLocator()))
    // usecases
    ..registerFactory(() => UserSignUp(serviceLocator()))
    ..registerFactory(() => UserLogin(serviceLocator()))
    ..registerFactory(() => CurrentUser(serviceLocator()))

    // business_logic_layer
    ..registerLazySingleton(() => AuthBloc(
          userSignUp: serviceLocator(),
          userLogin: serviceLocator(),
          currentUser: serviceLocator(),
        ));
}
