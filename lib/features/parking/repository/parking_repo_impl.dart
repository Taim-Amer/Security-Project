import 'dart:convert';
import 'package:encrypt/encrypt.dart';
import 'package:get/get.dart';
import 'package:security_project/features/parking/models/calculate_cost_model.dart';
import 'package:security_project/features/parking/models/certificate_model.dart';
import 'package:security_project/features/parking/models/process_payment_model.dart';
import 'package:security_project/features/parking/models/public_key_model.dart';
import 'package:security_project/features/parking/models/reverse_parking_model.dart';
import 'package:security_project/features/parking/models/test_certificate_model.dart';
import 'package:security_project/features/parking/repository/parking_repo.dart';
import 'package:security_project/utils/api/dio_helper.dart';
import 'package:security_project/utils/constants/api_constants.dart';
import 'package:security_project/utils/logging/logger.dart';
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

    print("Session Key: $sessionKey");
    print("IV: ${base64Encode(iv.bytes)}");
    print("Encrypted Data: ${encryptedData.base64}");

    return dioHelper.postWithSessionKey(TApiConstants.reverseParking, token: token,{
      'encryptedData': encryptedData.base64,
      'iv': base64Encode(iv.bytes),
      //'parking_slot': 'A12',
      //       'time': '2024-12-27 10:00',
    }).then((response) => ReverseParkingModel.fromJson(response));
  }

  @override
  Future<PublicKeyModel> getPublicKey() async{
    final dioHelper = TDioHelper();
    return await dioHelper.get(TApiConstants.publicKey, token: token).then((response) => PublicKeyModel.fromJson(response));
  }

  @override
  Future<CalculateCostModel> calculateCost({required int garageID}) async {
    final dioHelper = TDioHelper();
    return await dioHelper.get(TApiConstants.calculate, token: token, queryParameters: {'garage_id': garageID}).then((response) => CalculateCostModel.fromJson(response));
  }

  @override
  Future<ProcessPaymentModel> processPayment({
    required String encryptedSessionKey,
    required String encryptedPaymentData,
    required String iv,
  }) async {
    final dioHelper = TDioHelper();
    return await dioHelper.post(TApiConstants.processPayment, token: token,
        {
          'encryptedSessionKey': encryptedSessionKey,
          'encryptedPaymentData': encryptedPaymentData,
          'iv': iv
        },
    ).then((response) => ProcessPaymentModel.fromJson(response));
  }

  @override
  Future<CertificateModel> generateCertificate(String publicKey) async{
    final dioHelper = TDioHelper();
    return await dioHelper.post(TApiConstants.generateCertificate, {'public_key': publicKey}, token: token).then((response) => CertificateModel.fromJson(response));
  }

  @override
  Future<TestCertificateModel> testCertificate() async{
    final dioHelper = TDioHelper();
    return await dioHelper.get(TApiConstants.testCertificate, token: token).then((response) => TestCertificateModel.fromJson(response));
  }
}
