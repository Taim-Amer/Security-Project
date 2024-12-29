import 'package:get/get.dart';
import 'package:security_project/common/widgets/alerts/snackbar.dart';
import 'package:security_project/features/authentication/models/session_key_model.dart';
import 'package:security_project/features/authentication/repositories/auth_repo_impl.dart';
import 'package:security_project/localization/keys.dart';
import 'package:security_project/utils/constants/enums.dart';
import 'package:security_project/utils/storage/cache_helper.dart';

class SessionKeyController extends GetxController{
  static SessionKeyController get instance => Get.find();

  Rx<SessionKeyModel> sessionKeyModel = SessionKeyModel().obs;

  Future<void> getSessionKey() async{
    try {
      sessionKeyModel.value = await AuthRepositoryImpl.instance.getSessionKey();
      if(sessionKeyModel.value.status == true){
        TCacheHelper.saveData(key: 'sessionKey', value: sessionKeyModel.value.sessionKey);
      }
    } catch(error){
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    }
  }
}