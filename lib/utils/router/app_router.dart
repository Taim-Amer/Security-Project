import 'package:get/get.dart';
import 'package:security_project/bindings/signin_binding.dart';
import 'package:security_project/bindings/signup_binding.dart';
class AppRoutes {
  static const signin = '/signin';
  static const signup = "/signup";

  static List<GetPage> routes = [
    // GetPage(
    //   name: signin,
    //   page: () => const SigninScreen(),
    //   binding: SigninBinding(),
    // ),
    //
    // GetPage(
    //   name: signup,
    //   page: () => const SignupScreen(),
    //   binding: SignupBinding(),
    // ),
  ];
}