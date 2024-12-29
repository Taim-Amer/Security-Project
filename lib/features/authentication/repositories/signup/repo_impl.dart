import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:security_project/features/authentication/models/signup_model.dart';
import 'package:security_project/features/authentication/repositories/signup/repo.dart';
import 'package:security_project/utils/api/dio_helper.dart';
import 'package:security_project/utils/constants/api_constants.dart';

class SignupRepositoryImpl implements SignupRepository  {
  static SignupRepositoryImpl get instance => Get.find();

  @override
  Future<SignupModel> signup({required String name, required String phoneNumber, required String password, required String carNumber, required String type}) {
    final dioHelper = TDioHelper();
    return dioHelper.post(TApiConstants.signup, data: {
      'name' : name,
      'password' : password,
      'phone_number' : phoneNumber,
      'car_number' : carNumber,
      'type' : type
    }).then((response) => SignupModel.fromJson(response));
  }
}

