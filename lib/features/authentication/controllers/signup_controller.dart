import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:security_project/common/controllers/image_picker_controller.dart';
import 'package:security_project/features/authentication/models/signup_model.dart';
import 'package:security_project/features/authentication/repositories/signup/repo_impl.dart';
import 'package:security_project/utils/constants/enums.dart';
import 'package:security_project/utils/helpers/helper_functions.dart';
import 'package:security_project/utils/logging/logger.dart';
import 'package:security_project/utils/router/app_router.dart';

class SignupController extends GetxController{
  static SignupController get instance => Get.find();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmation = TextEditingController();

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
        // final String? imagePath = ImagePickerController.instance.imageBytes.value?.toString();

        // final Uint8List? imageBytes = ImagePickerController.instance.imageBytes.value;
        //
        // if (imageBytes == null) {
        //   throw Exception('No image selected. Please select an image.');
        // }

        signupModel.value = await SignupRepositoryImpl.instance.signup(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          passwordConfirmation: passwordConfirmation.text,
          // image: imageBytes,
        );

        if (signupModel.value.status == true) {
          updateStatus(value: RequestState.success);
          Get.toNamed(AppRoutes.signin);
        } else {
          throw Exception("Signup failed");
        }
      } catch (error) {
        updateStatus(value: RequestState.error);
        THelperFunctions.showSnackBar(error.toString());
        TLoggerHelper.error(error.toString());
      }
    }
  }
}