import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:weather_app_flutter/data/local/storage/storage_constants.dart';
import 'package:weather_app_flutter/data/remote/api_services.dart';
import 'package:weather_app_flutter/data/remote/base/base_controller.dart';
import 'package:weather_app_flutter/data/remote/errorhandler/error_handler.dart';
import 'package:weather_app_flutter/model/listUpdateEarthquakeInfo.dart';
import 'package:weather_app_flutter/model/updateEarthquakeInfo.dart';

class BMKGController extends BaseController<Gempa> {
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
  get statusData => dataList;

  @override
  // TODO: implement storageName
  String get storageName => StorageName.EARTHQUAKE;

  @override
  void onInit() async {
    // TODO: implement onInit
    await getUpdateInfo();
    super.onInit();
  }

  GempaData updateEarthquake = GempaData();
  Gempa? currentEarthquake;
  Rxn<int> earthquakeIndex = Rxn();

  void chooseWeather(int index) {
    if (dataList != null) {
      currentEarthquake = dataList[index];
    }
    earthquakeIndex.value = index;
    update();
  }

  Future<void> getUpdateInfo() async {
    await APIService().getUpdateEarthquakeInfo().then((value) async {
      if (value.infogempa != null) {
        updateEarthquake = value.infogempa!.gempa!;
      }
      await getListUpdateInfo();
      finishLoadData();
      update();
    }).handleError((onError) {
      finishLoadData(errorMessage: onError.toString());
      debugPrint("error : " + onError.toString());
      return throw onError;
    });
  }

  Future<void> getListUpdateInfo() async {
    await APIService().getListUpdateEarthquakeInfo().then((value) async {
      if (value.infogempa != null) {
        saveCacheAndFinish(list: value.infogempa?.gempa);
      }
    }).handleError((onError) {
      finishLoadData(errorMessage: onError.toString());
      debugPrint("error : " + onError.toString());
      return throw onError;
    });
  }
}
