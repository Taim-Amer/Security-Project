import 'package:get/get.dart';
import 'package:security_project/features/authentication/models/session_key_model.dart';
import 'package:security_project/features/authentication/models/signin_model.dart';
import 'package:security_project/features/authentication/models/signup_model.dart';
import 'package:security_project/features/authentication/repositories/auth_repo.dart';
import 'package:security_project/utils/api/dio_helper.dart';
import 'package:security_project/utils/constants/api_constants.dart';
import 'package:security_project/utils/storage/cache_helper.dart';

class AuthRepositoryImpl implements AuthRepository {
  static AuthRepositoryImpl get instance => Get.find();

  final String? token = TCacheHelper.getData(key: 'token');

  @override
  Future<SigninModel> signin({required String name, required String password}) async {
    final dioHelper = TDioHelper();
    return await dioHelper.post(TApiConstants.signin, {"name": name, "password": password}).then((response) => SigninModel.fromJson(response));
  }

  @override
  Future<SignupModel> signup({required String name, required String phoneNumber, required String password, required String carNumber, required String type}) {
    final dioHelper = TDioHelper();
    return dioHelper.post(TApiConstants.signup, {
      'name' : name,
      'password' : password,
      'phone_number' : phoneNumber,
      'car_number' : carNumber,
      'type' : type
    }).then((response) => SignupModel.fromJson(response));
  }

  @override
  Future<SessionKeyModel> getSessionKey() async{
    final dioHelper = TDioHelper();
    return await dioHelper.get(TApiConstants.getSessionKey, token: token).then((response) => SessionKeyModel.fromJson(response));
  }
}
