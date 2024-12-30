import 'package:get/get.dart';
import 'package:security_project/common/widgets/alerts/snackbar.dart';
import 'package:security_project/features/parking/models/calculate_cost_model.dart';
import 'package:security_project/features/parking/models/certificate_model.dart';
import 'package:security_project/features/parking/models/process_payment_model.dart';
import 'package:security_project/features/parking/models/public_key_model.dart';
import 'package:security_project/features/parking/models/reverse_parking_model.dart';
import 'package:security_project/features/parking/models/test_certificate_model.dart';
import 'package:security_project/features/parking/repository/parking_repo_impl.dart';
import 'package:security_project/localization/keys.dart';
import 'package:security_project/utils/constants/enums.dart';

class ParkingController extends GetxController {
  static ParkingController get instance => Get.find();

  final ParkingRepoImpl _repo = ParkingRepoImpl.instance;

  Rx<ReverseParkingModel> reverseParkingModel = ReverseParkingModel().obs;
  Rx<PublicKeyModel> publicKeyModel = PublicKeyModel().obs;
  Rx<CalculateCostModel> calculateCostModel = CalculateCostModel().obs;
  Rx<ProcessPaymentModel> processPaymentModel = ProcessPaymentModel().obs;
  Rx<CertificateModel> certificateModel = CertificateModel().obs;
  Rx<TestCertificateModel> testCertificateModel = TestCertificateModel().obs;

  Future<void> bookParkingSpot(String slot, String time) async {
    try {
      final parkingData = {'parking_slot': slot, 'time': time};
      final response = await ParkingRepoImpl.instance.reverseParking(parkingData);
      reverseParkingModel.value = response;
    } catch (e) {
      showSnackBar("Error booking parking spot", AlertState.error);
    }
  }

  Future<void> getPublicKey() async {
    try {
      publicKeyModel.value = await _repo.getPublicKey();
    } catch (error) {
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    }
  }

  Future<void> calculateCost(int garageID) async {
    try {
      calculateCostModel.value = await _repo.calculateCost(garageID: garageID);
    } catch (error) {
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    }
  }

  Future<void> processPayment({
    required String encryptedSessionKey,
    required String encryptedPaymentData,
    required String iv,
  }) async {
    try {
      processPaymentModel.value = await _repo.processPayment(
        encryptedSessionKey: encryptedSessionKey,
        encryptedPaymentData: encryptedPaymentData,
        iv: iv,
      );
    } catch (error) {
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    }
  }

  Future<void> generateCertificate(String publicKey) async {
    try {
      certificateModel.value = await _repo.generateCertificate(publicKey);
    } catch (error) {
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    }
  }

  Future<void> testCertificate() async {
    try {
      testCertificateModel.value = await _repo.testCertificate();
    } catch (error) {
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    }
  }
}
