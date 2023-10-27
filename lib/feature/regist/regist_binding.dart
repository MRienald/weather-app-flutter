import 'package:get/get.dart';
import 'package:weather_app_flutter/feature/regist/regist_controller.dart';

class RegistBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<RegistController>(RegistController());
  }
}
