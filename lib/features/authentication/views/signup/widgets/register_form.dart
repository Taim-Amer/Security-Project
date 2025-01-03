import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:security_project/features/authentication/controllers/signup_controller.dart';
import 'package:security_project/utils/constants/sizes.dart';
import 'package:security_project/utils/validators/validation.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: SignupController.instance.signupFormState,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: SignupController.instance.nameController,
                validator: (value) => TValidator.validateEmptyText("Username", value),
                expands: false,
                decoration: const InputDecoration(labelText: "Username", prefixIcon: Icon(Iconsax.user_edit)),
              ),
              const SizedBox(height: TSizes.spaceBtwInputField,),
              TextFormField(
                controller: SignupController.instance.phoneNumberController,
                validator: (value) => TValidator.validatePhoneNumber(value),
                expands: false,
                decoration: const InputDecoration(labelText: "Phone Number", prefixIcon: Icon(Iconsax.call)),
              ),
          
              const SizedBox(height: TSizes.spaceBtwInputField,),
              TextFormField(
                controller: SignupController.instance.passwordController,
                validator: (value) => TValidator.validatePassword(value),
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Iconsax.password_check),
                ),
              ),
          
              const SizedBox(height: TSizes.spaceBtwInputField,),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: SignupController.instance.carNumberController,
                      validator: (value) => TValidator.validateEmptyText("Number", value),
                      expands: false,
                      decoration: const InputDecoration(labelText: "Car Number", prefixIcon: Icon(Iconsax.car)),
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwInputField,),
                  Expanded(
                    child: TextFormField(
                      controller: SignupController.instance.typeController,
                      validator: (value) => TValidator.validateEmptyText("Type", value),
                      expands: false,
                      decoration: const InputDecoration(labelText: "Type", prefixIcon: Icon(Iconsax.category)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () => SignupController.instance.signup(),
                  child: const Text("CreateAccount"),
                ),
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}