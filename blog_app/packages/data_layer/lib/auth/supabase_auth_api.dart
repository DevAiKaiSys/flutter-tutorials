import 'package:data_layer/auth/auth_api.dart';
import 'package:data_layer/auth/models/user_model.dart';
import 'package:data_layer/core/error/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthApi implements AuthApi {
  final SupabaseClient supabaseClient;
  SupabaseAuthApi(this.supabaseClient);

  @override
  Future<UserModel> loginWithEmailPassword(
      {required String email, required String password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {"name": name},
      );
      if (response.user == null) {
        throw const ServerException("User is null!");
      }
      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
