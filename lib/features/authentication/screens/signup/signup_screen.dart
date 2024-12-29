import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:security_project/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:security_project/common/widgets/pickers/image_picker.dart';
import 'package:security_project/common/widgets/text_fields/custom_text_field.dart';
import 'package:security_project/features/authentication/controllers/signup_controller.dart';
import 'package:security_project/utils/constants/sizes.dart';
import 'package:security_project/utils/helpers/helper_functions.dart';
import 'package:security_project/utils/validators/validation.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignupController signupController = SignupController.instance;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Signup to Networks App".tr, style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: THelperFunctions.screenHeight(context) * 0.02),
            TRoundedContainer(
              showBorder: true,
              padding: const EdgeInsets.all(20),
              width: THelperFunctions.screenWidth(context) * 0.2,
              radius: 10,
              child: Form(
                key: signupController.signupFormState,
                child: Column(
                  children: [
                    // const TImagePicker(),
                    CustomTextField(
                      text: 'Enter your Name',
                      keyboardType: TextInputType.text,
                      validator: (value) => TValidator.validateEmptyText("Name", value),
                      controller: signupController.nameController,
                    ),
                    TSizes.defaultSpace.verticalSpace,
                    CustomTextField(
                      text: 'Enter your Email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => TValidator.validateEmail(value),
                      controller: signupController.emailController,
                    ),
                    TSizes.defaultSpace.verticalSpace,
                    CustomTextField(
                      text: 'Enter your password',
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      validator: (value) => TValidator.validatePassword(value),
                      controller: signupController.passwordController,
                    ),
                    TSizes.defaultSpace.verticalSpace,
                    CustomTextField(
                      text: 'Enter your password confirmation',
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      validator: (value) => TValidator.validatePassword(value),
                      controller: signupController.passwordConfirmation,
                    ),
                    TSizes.defaultSpace.verticalSpace,
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton(onPressed: () => signupController.signup(), child: const Text("Signup")),
                    ),
                    TSizes.spaceBtwInputField.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
