import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:security_project/dependencies/general_bindings.dart';
import 'package:security_project/dependencies/parking_binding.dart';
import 'package:security_project/dependencies/signin_binding.dart';
import 'package:security_project/dependencies/signup_binding.dart';
import 'package:security_project/localization/translations.dart';
import 'package:security_project/utils/helpers/helper_functions.dart';
import 'package:security_project/utils/router/app_router.dart';
import 'package:security_project/utils/storage/cache_helper.dart';
import 'package:security_project/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    String? token = TCacheHelper.getData(key: "token");
    print(token);
    String initialRoute = token != null ? AppRoutes.parking : AppRoutes.signin;
    return ScreenUtilInit(
      designSize: Size(THelperFunctions.screenWidth(context), THelperFunctions.screenHeight(context)),
      builder: (_, child) =>  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        initialRoute: initialRoute,
        getPages: AppRoutes.routes,
        translations: TAppTranslations(),
        locale: const Locale('en'),
        // fallbackLocale: const Locale('en'),
        initialBinding: GeneralBindings(),
      ),
    );
  }
}