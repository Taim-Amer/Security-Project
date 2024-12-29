import 'package:security_project/features/parking/models/reverse_parking_model.dart';

abstract class ParkingRepo{
  Future<ReverseParkingModel> reverseParking(Map<String, String> parkingData);
}