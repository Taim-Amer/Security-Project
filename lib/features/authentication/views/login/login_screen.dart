import 'package:flutter/material.dart';
import 'package:security_project/common/styles/spacing_styles.dart';
import 'package:security_project/common/widgets/appbar/appbar.dart';
import 'package:security_project/features/authentication/views/login/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(),
      body: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: const TLoginForm(),
      ),
    );
  }
}
