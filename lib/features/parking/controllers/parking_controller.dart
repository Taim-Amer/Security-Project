// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pointycastle/asymmetric/api.dart' as pointycastle;
import 'package:security_project/common/widgets/alerts/snackbar.dart';
import 'package:security_project/features/authentication/controllers/session_key_controller.dart';
import 'package:security_project/features/parking/models/calculate_cost_model.dart';
import 'package:security_project/features/parking/models/certificate_model.dart';
import 'package:security_project/features/parking/models/process_payment_model.dart';
import 'package:security_project/features/parking/models/public_key_model.dart';
import 'package:security_project/features/parking/models/reverse_parking_model.dart';
import 'package:security_project/features/parking/models/test_certificate_model.dart';
import 'package:security_project/features/parking/repository/parking_repo_impl.dart';
import 'package:security_project/localization/keys.dart';
import 'package:security_project/utils/constants/enums.dart';
import 'package:security_project/utils/keys/key_generator.dart';
import 'package:security_project/utils/logging/logger.dart';
import 'package:security_project/utils/storage/cache_helper.dart';

class ParkingController extends GetxController {
  static ParkingController get instance => Get.find();

  Rx<ReverseParkingModel> reverseParkingModel = ReverseParkingModel().obs;
  Rx<PublicKeyModel> publicKeyModel = PublicKeyModel().obs;
  Rx<CalculateCostModel> calculateCostModel = CalculateCostModel().obs;
  Rx<CertificateModel> certificateModel = CertificateModel().obs;
  Rx<TestCertificateModel> testCertificateModel = TestCertificateModel().obs;
  Rx<ProcessPaymentModel> paymentResult = ProcessPaymentModel().obs;

  final timeController = TextEditingController();
  final slotController = TextEditingController();

  Future<void> reverseParking() async {
    await SessionKeyController.instance.getSessionKey();
    try {
      final parkingData = {'parking_slot': slotController.text.toString(), 'time': timeController.text.toString()};
      reverseParkingModel.value = await ParkingRepoImpl.instance.reverseParking(parkingData);
    } catch (e) {
      TLoggerHelper.warning(e.toString());
      showSnackBar("Error booking parking spot", AlertState.error);
    }
  }

  Future<void> calculateCost(int garageID) async {
    try {
      calculateCostModel.value = await ParkingRepoImpl.instance.calculateCost(garageID: garageID);
    } catch (error) {
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    }
  }

  Future<void> processPayment(Map<String, dynamic> paymentData) async {
    final keyPair = KeyPairGenerator.generateKeyPair();
    TCacheHelper.saveData(key: "clientPublicKey", value: keyPair.publicKey.toString());
    TCacheHelper.saveData(key: "clientPrivateKey", value: keyPair.privateKey.toString());
    final serverPublicKey = TCacheHelper.getData(key: 'serverPublicKey');
    try {
      final sessionKey = KeyPairGenerator.generateSessionKey();
      final encryptedSessionKey = encryptSessionKey(sessionKey, serverPublicKey);
      final encryptedPaymentData = encryptPaymentData(jsonEncode(paymentData), sessionKey);

      final response = await ParkingRepoImpl.instance.processPayment(
        encryptedSessionKey: encryptedSessionKey,
        encryptedPaymentData: encryptedPaymentData['encryptedData']!,
        iv: encryptedPaymentData['iv']!,
      );
      paymentResult.value = response;
    } catch (e) {
      showSnackBar("Payment failed", AlertState.error);
    }
  }

  Future<void> performHandshaking() async {
    try {
      await ParkingRepoImpl.instance.getPublicKey().then((response) => TCacheHelper.saveData(key: 'serverPublicKey', value: response.publicKey));
      // await _repo.sendClientPublicKey(TCacheHelper.getData(key: "clientPublicKey"));
    } catch (e) {
      showSnackBar("Handshaking failed", AlertState.error);
    }
  }

  String encryptSessionKey(String sessionKey, String serverPublicKey) {
    final parser = encrypt.RSAKeyParser();
    final publicKey = parser.parse(serverPublicKey) as pointycastle.RSAPublicKey;
    final encrypter = encrypt.Encrypter(encrypt.RSA(publicKey: publicKey));

    return encrypter.encrypt(sessionKey).base64;
  }

  Map<String, String> encryptPaymentData(String paymentData, String sessionKey) {
    final iv = encrypt.IV.fromSecureRandom(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(encrypt.Key.fromUtf8(sessionKey), mode: encrypt.AESMode.cbc));
    final encryptedData = encrypter.encrypt(paymentData, iv: iv);

    return {
      'encryptedData': encryptedData.base64,
      'iv': iv.base64,
    };
  }

  Future<void> generateCertificate() async {
    final clientPublicKey = TCacheHelper.getData(key: "clientPublicKey");
    if (clientPublicKey != null) {
      await ParkingRepoImpl.instance.generateCertificate(clientPublicKey);
      showSnackBar("Certificate generated successfully!", AlertState.warning);
    } else {
      showSnackBar("Public key not found.", AlertState.error);
    }
  }

  Future<void> validateCertificate() async {
    try {
      await ParkingRepoImpl.instance.testCertificate();
      showSnackBar("Certificate is valid.", AlertState.success);
    } catch (error) {
      showSnackBar("Certificate validation failed", AlertState.error);
    }
  }

  Future<void> performCertificate() async {
    await generateCertificate();
    await validateCertificate();
  }
}
