import 'package:get/get.dart';
import 'package:security_project/features/authentication/controllers/signup_controller.dart';
import 'package:security_project/features/authentication/repositories/auth_repo_impl.dart';

class SignupBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<SignupController>(SignupController());
    Get.put<AuthRepositoryImpl>(AuthRepositoryImpl());
  }
}