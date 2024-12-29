import 'package:security_project/features/authentication/models/signup_model.dart';

abstract class SignupRepository {
  Future<SignupModel> signup({
    required String name,
    required String phoneNumber,
    required String password,
    required String carNumber,
    required String type, //employee,client
  });
}