import 'dart:convert';
import 'package:encrypt/encrypt.dart';
import 'package:get/get.dart';
import 'package:security_project/features/parking/models/reverse_parking_model.dart';
import 'package:security_project/features/parking/repository/parking_repo.dart';
import 'package:security_project/utils/api/dio_helper.dart';
import 'package:security_project/utils/constants/api_constants.dart';
import 'package:security_project/utils/storage/cache_helper.dart';

class ParkingRepoImpl implements ParkingRepo{
  static ParkingRepoImpl get instance => Get.find();

  final String? sessionKey = TCacheHelper.getData(key: 'sessionKey');
  final String? token = TCacheHelper.getData(key: 'token');

  @override
  Future<ReverseParkingModel> reverseParking(Map<String, String> parkingData) async{
    final dioHelper = TDioHelper();
    final iv = IV.fromSecureRandom(16);

    final key = Key.fromBase64(sessionKey!);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encryptedData = encrypter.encrypt(jsonEncode(parkingData), iv: iv);
    
    return dioHelper.post(TApiConstants.reverseParking,token: token ,{
      'encryptedData': encryptedData.base64,
      'iv': base64Encode(iv.bytes),
    }).then((response) => ReverseParkingModel.fromJson(response));
  }
}