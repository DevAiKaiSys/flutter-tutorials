import 'package:data_layer/auth/models/user_model.dart';
import 'package:data_layer/core/error/exceptions.dart';
import 'package:data_layer/data_layer.dart';
import 'package:fpdart/fpdart.dart';
import 'package:repository_layer/auth/auth_repository.dart';
import 'package:repository_layer/auth/entities/user_entity.dart';
import 'package:repository_layer/core/constants/constants.dart';
import 'package:repository_layer/core/error/failures.dart';
import 'package:repository_layer/core/network/connection_checker.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi authApi;
  final ConnectionChecker connectionChecker;
  AuthRepositoryImpl(
    this.authApi,
    this.connectionChecker,
  );

  @override
  Future<Either<Failure, UserEntity>> currentUser() async {
    try {
      if (!await (connectionChecker.isConnected)) {
        final session = authApi.currentUserSession;

        if (session == null) {
          return left(Failure('User not logged in!'));
        }

        return right(
          UserEntity(
            id: session.user.id,
            email: session.user.email ?? '',
            name: '',
          ),
        );
      }
      final user = await authApi.getCurrentUserData();
      if (user == null) {
        return left(Failure('User not logged in!'));
      }

      return right(UserEntity(id: user.id, email: user.email, name: user.name));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    return _getUser(() async =>
        await authApi.loginWithEmailPassword(email: email, password: password));
  }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    /* try {
      final user = await authApi.signUpWithEmailPassword(
          name: name, email: email, password: password);

      return right(UserEntity(id: user.id, email: user.email, name: user.name));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } */
    return _getUser(() async => await authApi.signUpWithEmailPassword(
        name: name, email: email, password: password));
  }

  Future<Either<Failure, UserEntity>> _getUser(
      Future<UserModel> Function() fn) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure(Constants.noConnectionErrorMessage));
      }
      final user = await fn();

      return right(UserEntity(id: user.id, email: user.email, name: user.name));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
