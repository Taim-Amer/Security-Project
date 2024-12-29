import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:security_project/app.dart';
import 'package:security_project/utils/constants/sizes.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final GlobalKey<FormState>? formKey;
  final Widget? prefixIcon;
  final bool autoValidate;
  String? text;

  CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.formKey,
    this.prefixIcon,
    this.autoValidate = false,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text ?? '', style: Theme.of(context).textTheme.bodySmall,),
        text != null ? TSizes.sm.verticalSpace : const SizedBox(),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            counterText: "",
            hintText: hintText?.tr,
            prefixIcon: prefixIcon,
          ),
          validator: validator,
        ),
      ],
    );
  }
}
