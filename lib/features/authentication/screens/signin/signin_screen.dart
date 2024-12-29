import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:security_project/common/widgets/buttons/custom_button.dart';
import 'package:security_project/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:security_project/common/widgets/text_fields/custom_text_field.dart';
import 'package:security_project/features/authentication/controllers/signin_controller.dart';
import 'package:security_project/utils/constants/colors.dart';
import 'package:security_project/utils/constants/enums.dart';
import 'package:security_project/utils/constants/sizes.dart';
import 'package:security_project/utils/helpers/helper_functions.dart';
import 'package:security_project/utils/router/app_router.dart';
import 'package:security_project/utils/validators/validation.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SigninController signinController = SigninController.instance;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign in to Networks App", style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: THelperFunctions.screenHeight(context) * 0.02),
            TRoundedContainer(
              showBorder: true,
              padding: const EdgeInsets.all(20),
              width: THelperFunctions.screenWidth(context) * 0.2,
              radius: 10,
              child: Form(
                key: signinController.signInFormState,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomTextField(
                      text: 'Enter your Email',
                      keyboardType: TextInputType.emailAddress,
                      validator: TValidator.validateEmail,
                      controller: signinController.emailController,
                    ),
                    TSizes.defaultSpace.verticalSpace,
                    CustomTextField(
                      text: 'Enter your password',
                      obscureText: true,
                      validator: TValidator.validatePassword,
                      controller: signinController.passwordController,
                    ),
                    TSizes.defaultSpace.verticalSpace,
                    Obx(
                      () => signinController.signinApiStatus.value ==
                              RequestState.loading
                          ? const CircularProgressIndicator(
                              color: TColors.primary)
                          : CustomButton(
                              backgroundColor: TColors.secondary,
                              onPressed: signinController.signin,
                              textPrimary: "Sign In",
                              primaryTextStyle:
                                  Theme.of(context).textTheme.bodyMedium,
                            ),
                    ),
                    TSizes.spaceBtwInputField.verticalSpace,
                  ],
                ),
              ),
            ),
            SizedBox(height: THelperFunctions.screenHeight(context) * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New to our app?',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.grey),
                ),
                TextButton(
                  onPressed: () => Get.toNamed(AppRoutes.signup),
                  child: const Text(
                    'Create an account',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
