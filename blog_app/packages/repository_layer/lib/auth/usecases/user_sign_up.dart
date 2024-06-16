import 'package:fpdart/fpdart.dart';
import 'package:repository_layer/auth/auth_repository.dart';
import 'package:repository_layer/auth/entities/user_entity.dart';
import 'package:repository_layer/core/error/failures.dart';
import 'package:repository_layer/core/usecase/usecase.dart';

class UserSignUp implements UseCase<UserEntity, UserSignUpParams> {
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, UserEntity>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String name;
  UserSignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });
}
