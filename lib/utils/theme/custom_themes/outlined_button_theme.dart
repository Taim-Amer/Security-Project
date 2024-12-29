import 'package:flutter/material.dart';
import 'package:security_project/utils/constants/colors.dart';

class TOutLinedButtonTheme {
  TOutLinedButtonTheme._();

  static final lightOutLinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.black,
          side: const BorderSide(color: TColors.redColor),
          textStyle: const TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600),
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),
          ),
      ),
  );

  static final darkOutLinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(color: TColors.redColor),
          textStyle: const TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600),
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),
          ),
      ),
  );
}