import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:blog_app/business_logic_layer/app_user/cubit/app_user_cubit.dart';
import 'package:meta/meta.dart';
import 'package:repository_layer/auth/entities/user_entity.dart';
import 'package:repository_layer/auth/usecases/user_sign_up.dart';
import 'package:repository_layer/auth/usecases/user_login.dart';
import 'package:repository_layer/auth/usecases/current_user.dart';
import 'package:repository_layer/core/usecase/usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;
  final CurrentUser _currentUser;
  final AppUserCubit _appUserCubit;

  AuthBloc({
    required UserSignUp userSignUp,
    required UserLogin userLogin,
    required CurrentUser currentUser,
    required AppUserCubit appUserCubit,
  })  : _userSignUp = userSignUp,
        _userLogin = userLogin,
        _currentUser = currentUser,
        _appUserCubit = appUserCubit,
        super(AuthInitial()) {
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogin>(_onAuthLogin);
    on<AuthIsUserLoggedIn>(_isUserLoggedIn);
  }

  FutureOr<void> _onAuthSignUp(
    AuthSignUp event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final res = await _userSignUp(UserSignUpParams(
      email: event.email,
      password: event.password,
      name: event.name,
    ));

    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      /* (user) => emit(AuthSuccess(user)), */
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  Future<FutureOr<void>> _onAuthLogin(
      AuthLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final res = await _userLogin(UserLoginParams(
      email: event.email,
      password: event.password,
    ));

    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      /* (user) => emit(AuthSuccess(user)), */
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  Future<FutureOr<void>> _isUserLoggedIn(
      AuthIsUserLoggedIn event, Emitter<AuthState> emit) async {
    final res = await _currentUser(NoParams());

    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      /* (user) {
        print(user);
        print(user.email);
        emit(AuthSuccess(user));
      }, */
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  void _emitAuthSuccess(UserEntity user, Emitter<AuthState> emit) {
    _appUserCubit.updateUser(user);
    emit(AuthSuccess(user));
  }
}
