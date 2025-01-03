import 'package:get/get.dart';
import 'package:security_project/features/authentication/controllers/signin_controller.dart';
import 'package:security_project/features/authentication/repositories/auth_repo_impl.dart';

class SigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SigninController>(SigninController());
    Get.put<AuthRepositoryImpl>(AuthRepositoryImpl());
  }
}