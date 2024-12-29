import 'package:security_project/features/authentication/models/session_key_model.dart';
import 'package:security_project/features/authentication/models/signin_model.dart';
import 'package:security_project/features/authentication/models/signup_model.dart';

abstract class AuthRepository {
  Future<SigninModel> signin({required String name, required String password});
  Future<SignupModel> signup({
    required String name,
    required String phoneNumber,
    required String password,
    required String carNumber,
    required String type, //employee,client
  });
  Future<SessionKeyModel> getSessionKey();
}
