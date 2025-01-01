import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:security_project/features/authentication/controllers/signup_controller.dart';
import 'package:security_project/utils/constants/sizes.dart';
import 'package:security_project/utils/validators/validation.dart';

class TRegisterForm extends StatelessWidget {
  const TRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: SignupController.instance.signupFormState,
      child: Column(
        children: [
          Row(
            children: [
              //First Name
              Expanded(
                child: TextFormField(
                  controller: SignupController.instance.carNumberController,
                  validator: (value) => TValidator.validateEmptyText("Car Number", value),
                  expands: false,
                  decoration: const InputDecoration(labelText: "Car Number", prefixIcon: Icon(Iconsax.car)),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputField,),
              //Last Name
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

          const SizedBox(height: TSizes.spaceBtwInputField,),
          //Username
          TextFormField(
            controller: SignupController.instance.nameController,
            validator: (value) => TValidator.validateEmptyText("Username", value),
            expands: false,
            decoration: const InputDecoration(labelText: "Username", prefixIcon: Icon(Iconsax.user_edit)),
          ),

          const SizedBox(height: TSizes.spaceBtwInputField,),
          //Phone Number
          TextFormField(
            controller: SignupController.instance.phoneNumberController,
            validator: (value) => TValidator.validatePhoneNumber(value),
            expands: false,
            decoration: const InputDecoration(labelText: "Phone Number", prefixIcon: Icon(Iconsax.call)),
          ),

          const SizedBox(height: TSizes.spaceBtwInputField,),
          //Password
          TextFormField(
            controller: SignupController.instance.passwordController,
            validator: (value) => TValidator.validatePassword(value),
            obscureText: true,
            decoration: const InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Iconsax.password_check),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwSections,),

          const SizedBox(height: TSizes.spaceBtwSections,),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => SignupController.instance.signup(),
              child: const Text("CreateAccount"),
            ),
          ),
        ],
      ),
    );
  }
}