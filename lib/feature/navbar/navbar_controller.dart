import 'package:get/get.dart';
import 'package:weather_app_flutter/data/remote/base/base_controller.dart';
import 'package:weather_app_flutter/feature/auth/auth_controller.dart';
import 'package:weather_app_flutter/resources/resources.dart';

class NavbarController extends BaseController {
  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    // TODO: implement refreshPage
  }

  @override
  // TODO: implement statusData
  get statusData => throw UnimplementedError();

  @override
  // TODO: implement storageName
  String get storageName => throw UnimplementedError();

  final AuthController authController = AuthController.find;
  Rxn<int> tabIndex = Rxn(0);
  String? swipeDirection;
  String gender = 'Laki - laki';
  List<String> navItemIcon = [
    AppImages.icWeatherApp.path,
    AppImages.icEarthquake.path,
    AppImages.icProfileMan.path,
    AppImages.icProfileWoman.path,
  ];

  void changeTabMenu(int index) {
    tabIndex.value = index;
    update();
  }
}
