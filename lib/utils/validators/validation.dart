import 'package:security_project/localization/keys.dart';

class TValidator {
  static String? validateEmptyText(String? fieldName, String? value){
    if(value == null || value.isEmpty){
      return '${TranslationKey.kEmptyValidation}$fieldName';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return TranslationKey.kEmptyValidation;
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return TranslationKey.kEmailInvalid;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }

    if (value.length < 6) {
      return "Password must be at least 6 characters long.";
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return "Password must contain at least one number.";
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return TranslationKey.kPhoneValidation;
    }

    // final phoneRegExp = RegExp(r'^\d{10}$');
    //
    // if(!phoneRegExp.hasMatch(value)) {
    //   return "خطأ في تنسيق رقم الهاتف يرجى ادخال 13 رقم";
    // }
    return null;
  }
}
