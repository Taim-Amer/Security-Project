import 'package:get/get.dart';
import 'package:security_project/bindings/signin_binding.dart';
import 'package:security_project/utils/router/app_router.dart';
import 'package:security_project/utils/storage/cache_helper.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    String? token = TCacheHelper.getData(key: "token");

    if (token != null) {
      // Get.offAllNamed(AppRoutes.home);
    } else {
      Get.offAllNamed(AppRoutes.signin);
      Get.put<SigninBinding>(SigninBinding());
    }
  }
}