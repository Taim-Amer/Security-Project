import 'package:flutter/material.dart';
import 'package:security_project/common/styles/spacing_styles.dart';
import 'package:security_project/common/widgets/appbar/appbar.dart';
import 'package:security_project/features/authentication/views/signin/widgets/login_form.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: const LoginForm(),
        ),
      ),
    );
  }
}
