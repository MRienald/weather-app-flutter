import 'package:get/get.dart';
import 'package:weather_app_flutter/feature/login/login_binding.dart';
import 'package:weather_app_flutter/feature/login/login_page.dart';
import 'package:weather_app_flutter/feature/navbar/navbar_binding.dart';
import 'package:weather_app_flutter/feature/navbar/navbar_page.dart';
import 'package:weather_app_flutter/feature/regist/regist_binding.dart';
import 'package:weather_app_flutter/feature/regist/regist_page.dart';
import 'package:weather_app_flutter/feature/splashscreen/splashscreen_page.dart';
import 'package:weather_app_flutter/routes/page_names.dart';
import 'package:weather_app_flutter/utils/widgets/loading_page.dart';

class PageRoutes {
  static final pages = [
    GetPage(
      name: PageName.LOADER,
      page: () => const LoadingPage(),
    ),
    GetPage(
      name: PageName.SPLASHSCREEN,
      page: () => const SplashScreenPage(),
    ),
    GetPage(
      name: PageName.NAVBAR,
      page: () => const NavbarPage(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: PageName.REGIST,
      page: () => const RegistPage(),
      binding: RegistBindings(),
    ),
    GetPage(
      name: PageName.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    )
  ];
}
