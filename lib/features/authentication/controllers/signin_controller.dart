import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:security_project/common/widgets/alerts/snackbar.dart';
import 'package:security_project/features/authentication/models/signin_model.dart';
import 'package:security_project/features/authentication/repositories/auth_repo_impl.dart';
import 'package:security_project/utils/constants/enums.dart';
import 'package:security_project/utils/helpers/helper_functions.dart';
import 'package:security_project/utils/router/app_router.dart';
import 'package:security_project/utils/storage/cache_helper.dart';

class SigninController extends GetxController {
  static SigninController get instance => Get.find();

  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> signInFormState = GlobalKey<FormState>();

  final signinModel = SigninModel().obs;

  var signinApiStatus = RequestState.begin.obs;

  void updateStatus({required RequestState value}) {
    signinApiStatus.value = value;
  }

  Future<void> signin() async {
    if (signInFormState.currentState!.validate()) {
      updateStatus(value: RequestState.loading);
      try {
        signinModel.value = await AuthRepositoryImpl.instance.signin(
            name: nameController.text.trim(),
            password: passwordController.text);
        if (signinModel.value.status == true) {
          updateStatus(value: RequestState.success);
          TCacheHelper.saveData(key: "token", value: signinModel.value.token);
          // await SessionKeyController.instance.getSessionKey();
          // TCacheHelper.saveData(key: "sessionKey", value: SessionKeyController.instance.getSessionKey());
          showSnackBar( signinModel.value.message!, AlertState.success);
          Get.offAllNamed(AppRoutes.parking);
        }
      } catch (error) {
        updateStatus(value: RequestState.error);
        THelperFunctions.showSnackBar(error.toString());
      }
    }
  }
}
