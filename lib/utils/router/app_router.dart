import 'package:get/get.dart';
import 'package:security_project/dependencies/parking_binding.dart';
import 'package:security_project/dependencies/signin_binding.dart';
import 'package:security_project/dependencies/signup_binding.dart';
import 'package:security_project/features/authentication/views/signin/login_screen.dart';
import 'package:security_project/features/authentication/views/signup/register_screen.dart';
import 'package:security_project/features/parking/views/parking_screen.dart';

class AppRoutes {
  static const signin = '/signin';
  static const signup = "/signup";
  static const parking = "/parking";

  static List<GetPage> routes = [
    GetPage(
      name: signin,
      page: () => const SigninScreen(),
      binding: SigninBinding(),
    ),

    GetPage(
      name: signup,
      page: () => const SignupScreen(),
      binding: SignupBinding(),
    ),

    GetPage(
      name: parking,
      page: () => const ParkingScreen(),
      binding: ParkingBinding(),
    ),
  ];
}