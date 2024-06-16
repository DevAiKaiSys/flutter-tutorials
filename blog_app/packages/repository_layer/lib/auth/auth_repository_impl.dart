import 'package:data_layer/core/error/exceptions.dart';
import 'package:data_layer/data_layer.dart';
import 'package:fpdart/fpdart.dart';
import 'package:repository_layer/auth/auth_repository.dart';
import 'package:repository_layer/auth/entities/user_entity.dart';
import 'package:repository_layer/core/error/failures.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi authApi;
  AuthRepositoryImpl(this.authApi);

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await authApi.signUpWithEmailPassword(
          name: name, email: email, password: password);

      return right(UserEntity(id: user.id, email: user.email, name: user.name));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
