import 'package:security_project/features/parking/models/calculate_cost_model.dart';
import 'package:security_project/features/parking/models/process_payment_model.dart';
import 'package:security_project/features/parking/models/public_key_model.dart';
import 'package:security_project/features/parking/models/reverse_parking_model.dart';

abstract class ParkingRepo{
  Future<ReverseParkingModel> reverseParking(Map<String, String> parkingData);
  Future<PublicKeyModel> getPublicKey();
  Future<CalculateCostModel> calculateCost({required int garageID});
  Future<ProcessPaymentModel> processPayment({
    required String encryptedSessionKey,
    required String encryptedPaymentData,
    required String iv,
  });
}