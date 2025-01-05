import 'package:get/get.dart';
import 'package:security_project/features/authentication/controllers/session_key_controller.dart';
import 'package:security_project/features/authentication/repositories/auth_repo_impl.dart';
import 'package:security_project/features/parking/controllers/parking_controller.dart';
import 'package:security_project/features/parking/repository/parking_repo_impl.dart';

class ParkingBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<ParkingController>(ParkingController());
    Get.put<ParkingRepoImpl>(ParkingRepoImpl());
    Get.put<SessionKeyController>(SessionKeyController());
    Get.put<AuthRepositoryImpl>(AuthRepositoryImpl());
  }
}