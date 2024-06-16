import 'package:fpdart/fpdart.dart';
import 'package:repository_layer/auth/entities/user_entity.dart';
import 'package:repository_layer/core/error/failures.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, UserEntity>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, UserEntity>> loginWithEmailPassword({
    required String email,
    required String password,
  });
}
