import 'package:flutter/material.dart';
import 'package:security_project/features/authentication/views/signup/widgets/register_form.dart';
import 'package:security_project/utils/constants/sizes.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: RegisterForm(),
      ),
    );
  }
}