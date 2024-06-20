import 'package:blog_app/business_logic_layer/app_user/cubit/app_user_cubit.dart';
import 'package:blog_app/business_logic_layer/auth/bloc/auth_bloc.dart';
import 'package:blog_app/business_logic_layer/blog/bloc/blog_bloc.dart';
import 'package:blog_app/core/secrets/app_secrets.dart';
import 'package:data_layer/data_layer.dart';
import 'package:get_it/get_it.dart';
import 'package:repository_layer/auth/auth_repository_impl.dart';
import 'package:repository_layer/auth/usecases/current_user.dart';
import 'package:repository_layer/auth/usecases/user_login.dart';
import 'package:repository_layer/auth/usecases/user_sign_up.dart';
import 'package:repository_layer/blog/blog_repository.dart';
import 'package:repository_layer/blog/blog_repository_impl.dart';
import 'package:repository_layer/blog/usecases/get_all_blogs.dart';
import 'package:repository_layer/blog/usecases/upload_blog.dart';
import 'package:repository_layer/core/network/connection_checker.dart';
import 'package:repository_layer/repository_layer.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  _initBlog();

  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);

  serviceLocator.registerFactory(() => InternetConnection());

  // core
  serviceLocator.registerLazySingleton(() => AppUserCubit());
  serviceLocator.registerFactory<ConnectionChecker>(
      () => ConnectionCheckerImpl(serviceLocator()));
}

void _initAuth() {
  // data_layer
  serviceLocator
    ..registerFactory<AuthApi>(() => SupabaseAuthApi(serviceLocator()))

    // repository_layer
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        serviceLocator(),
        serviceLocator(),
      ),
    )
    // usecases
    ..registerFactory(() => UserSignUp(serviceLocator()))
    ..registerFactory(() => UserLogin(serviceLocator()))
    ..registerFactory(() => CurrentUser(serviceLocator()))

    // business_logic_layer
    ..registerLazySingleton(() => AuthBloc(
          userSignUp: serviceLocator(),
          userLogin: serviceLocator(),
          currentUser: serviceLocator(),
          appUserCubit: serviceLocator(),
        ));
}

void _initBlog() {
  // data_layer
  serviceLocator
    ..registerFactory<BlogApi>(() => SupabaseBlogApi(serviceLocator()))

    // repository_layer
    ..registerFactory<BlogRepository>(
        () => BlogRepositoryImpl(serviceLocator()))
    // usecases
    ..registerFactory(() => UploadBlog(serviceLocator()))
    ..registerFactory(() => GetAllBlogs(serviceLocator()))

    // business_logic_layer
    ..registerLazySingleton(() => BlogBloc(
          uploadBlog: serviceLocator(),
          getAllBlogs: serviceLocator(),
        ));
}
