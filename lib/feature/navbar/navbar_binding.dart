import 'package:get/get.dart';
import 'package:weather_app_flutter/feature/bmkg/bmkg_controller.dart';
import 'package:weather_app_flutter/feature/navbar/navbar_controller.dart';
import 'package:weather_app_flutter/feature/profile/profile_controller.dart';
import 'package:weather_app_flutter/feature/weather/weather_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NavbarController>(NavbarController());
    Get.put<WeatherController>(WeatherController());
    Get.put<BMKGController>(BMKGController());
    Get.put<ProfileController>(ProfileController());
  }
}
