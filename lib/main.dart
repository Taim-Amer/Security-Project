import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:security_project/app.dart';
import 'package:security_project/utils/storage/cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await TCacheHelper.init();

  Get.testMode = true;
  runApp(const App());
}
