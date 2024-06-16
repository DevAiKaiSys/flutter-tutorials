import 'package:data_layer/core/error/exceptions.dart';
import 'package:data_layer/data_layer.dart';
import 'package:fpdart/fpdart.dart';
import 'package:repository_layer/auth/auth_repository.dart';
import 'package:repository_layer/core/error/failures.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi authApi;
  AuthRepositoryImpl(this.authApi);

  @override
  Future<Either<Failure, String>> loginWithEmailPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userId = await authApi.signUpWithEmailPassword(
          name: name, email: email, password: password);

      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
