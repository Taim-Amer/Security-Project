import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:security_project/app.dart';
import 'package:security_project/features/authentication/controllers/signin_controller.dart';
import 'package:security_project/utils/constants/sizes.dart';
import 'package:security_project/utils/router/app_router.dart';
import 'package:security_project/utils/validators/validation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: SigninController.instance.signInFormState,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              controller: SigninController.instance.nameController,
              validator: (value) => TValidator.validateEmptyText(value, 'Username'),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.user),
                hintText: "Username",
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputField),
            TextFormField(
              controller: SigninController.instance.passwordController,
              validator: (value) => TValidator.validatePassword(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                hintText: "Password",
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputField),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () => SigninController.instance.signin(),
                    child: const Text("Login"),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => Get.toNamed(AppRoutes.signup),
                    child: const Text("Create Account"),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
