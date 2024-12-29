import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:security_project/features/authentication/models/signup_model.dart';
import 'package:security_project/features/authentication/repositories/signup/repo.dart';
import 'package:security_project/utils/api/dio_helper.dart';
import 'package:security_project/utils/constants/api_constants.dart';
import 'package:security_project/utils/logging/logger.dart';

class SignupRepositoryImpl implements SignupRepository  {
  static SignupRepositoryImpl get instance => Get.find();

  @override
  Future<SignupModel> signup({required String name, required String phoneNumber, required String password, required String carNumber, required String type}) {
    final dioHelper = TDioHelper();
  }
}

