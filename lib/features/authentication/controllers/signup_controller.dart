import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:security_project/common/widgets/alerts/snackbar.dart';
import 'package:security_project/features/authentication/models/signup_model.dart';
import 'package:security_project/features/authentication/repositories/signup/repo_impl.dart';
import 'package:security_project/localization/keys.dart';
import 'package:security_project/utils/constants/enums.dart';
import 'package:security_project/utils/router/app_router.dart';

class SignupController extends GetxController{
  static SignupController get instance => Get.find();

  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final carNumberController = TextEditingController();
  final typeController = TextEditingController();

  final GlobalKey<FormState> signupFormState = GlobalKey<FormState>();

  final signupModel = SignupModel().obs;

  var signupApiStatus = RequestState.begin.obs;

  void updateStatus({required RequestState value}) {
    signupApiStatus.value = value;
  }

  Future<void> signup() async {
    if (signupFormState.currentState!.validate()) {
      updateStatus(value: RequestState.loading);
      try {
        signupModel.value = await SignupRepositoryImpl.instance.signup(
          name: nameController.text,
          password: passwordController.text,
          phoneNumber: phoneNumberController.text,
          carNumber: carNumberController.text,
          type: typeController.text,
        );

        if (signupModel.value.status == true) {
          updateStatus(value: RequestState.success);
          showSnackBar(signupModel.value.response ?? "", AlertState.success);
          Get.toNamed(AppRoutes.signin);
        } else {
          showSnackBar(signupModel.value.response ?? "", AlertState.error);
        }
      } catch (error) {
        updateStatus(value: RequestState.error);
        showSnackBar(TranslationKey.kErrorMessage, AlertState.success);
      }
    }
  }
}