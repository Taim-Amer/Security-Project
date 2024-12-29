// ignore_for_file: invalid_return_type_for_catch_error
import 'package:get/get.dart';
import 'package:security_project/features/authentication/models/signin_model.dart';
import 'package:security_project/features/authentication/repositories/signin/repo.dart';
import 'package:security_project/utils/api/dio_helper.dart';
import 'package:security_project/utils/constants/api_constants.dart';

class SigninRepositoryImpl implements SigninRepository {
  static SigninRepositoryImpl get instance => Get.find();

  static Rx<bool> isLogin = false.obs;

  @override
  Future<SigninModel> signin({required String name, required String password}) async {
    final dioHelper = TDioHelper();
    return await dioHelper.post(TApiConstants.signin, data: {"name": name, "password": password}).then((response) => SigninModel.fromJson(response));
  }
}
