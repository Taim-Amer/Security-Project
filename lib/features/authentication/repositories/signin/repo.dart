import 'package:security_project/features/authentication/models/signin_model.dart';

abstract class SigninRepository {
  Future<SigninModel> signin({required String name, required String password});
}
