import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app_flutter/feature/auth/auth_controller.dart';
import 'package:weather_app_flutter/feature/weather/weather_controller.dart';
import 'data/local/storage/storage_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

class Initializer {
  static Future<void> init() async {
    try {
      _initScreenPreference();
      await GetStorage.init(StorageName.STORAGE_NAME);
      await Get.putAsync<FlutterSecureStorage>(() async {
        return const FlutterSecureStorage();
      });
      Get.put<AuthController>(AuthController());
    } catch (err) {
      rethrow;
    }
  }

  // static Future<void> initHive() async {
  //   Directory dir = await getApplicationDocumentsDirectory();
  //   await Hive.initFlutter(dir.path);
  //   // HiveAdapters().registerAdapter();
  //   // await Hive.openBox<User>(HiveConstants.USERS_BOX);
  //   // await Hive.openBox<Place>(HiveConstants.PLACES);
  // }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
