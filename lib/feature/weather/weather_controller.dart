// ignore_for_file: unused_local_variable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:weather_app_flutter/data/local/storage/storage_constants.dart';
import 'package:weather_app_flutter/data/remote/api_services.dart';
import 'package:weather_app_flutter/data/remote/base/base_controller.dart';
import 'package:weather_app_flutter/data/remote/errorhandler/error_handler.dart';
import 'package:weather_app_flutter/data/remote/location/location_service.dart';
import 'package:weather_app_flutter/model/5-forecast-weather.dart';
import 'package:weather_app_flutter/resources/resources.dart';

class WeatherController extends BaseController {
  @override
  void onInit() async {
    // TODO: implement onInit
    await getLocation();
    super.onInit();
  }

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
  String get storageName => StorageName.BALANCE;

  List<ListElement>? list5DaysWeather;
  ListElement? currentWeather;
  City currentLoc = City();
  double lat = 0.0;
  double lon = 0.0;
  String dateFormatDayAndHours = '';

  Rxn<int> weatherIndex = Rxn(0);
  Map<String, String> gridItem = {
    "UV INDEX": AppImages.icUv.path,
    "FEELS LIKE": AppImages.icThermometer.path,
    "SUNSET": AppImages.icSunset.path,
    "WIND": AppImages.icWind.path,
    "HUMIDITY": AppImages.icHumidity.path,
    "PRESSURE": AppImages.icGauge.path,
  };

  void chooseWeather(int index) {
    if (list5DaysWeather != null) {
      currentWeather = list5DaysWeather![index];
    }
    weatherIndex.value = index;
    update();
  }

  void setDateNow() {
    if (list5DaysWeather == null) return;

    for (int i = 0; i < list5DaysWeather!.length - 1; i++) {
      if (compareDate(list5DaysWeather![i].dtTxt.toString(),
          list5DaysWeather![i + 1].dtTxt.toString())) {
        chooseWeather(i);
      }
    }
  }

  String getDayName(int day) {
    switch (day) {
      case 1:
        return 'Minggu';
      case 2:
        return 'Senin';
      case 3:
        return 'Selasa';
      case 4:
        return 'Rabu';
      case 5:
        return 'Kamis';
      case 6:
        return 'Jumat';
      case 0:
        return 'Sabtu';
      default:
        return 'Invalid Day';
    }
  }

  bool compareDate(String inputDateHead, String inputDateTail) {
    DateTime now = DateTime.now();
    DateTime inputDateTimeHead = DateTime.parse(inputDateHead);
    DateTime inputDateTimeTail = DateTime.parse(inputDateTail);
    if (inputDateTimeHead.hour <= now.hour &&
        inputDateTimeTail.hour >= now.hour) {
      now =
          DateTime(now.year, now.month, now.day, inputDateTimeHead.hour, 0, 0);
    }

    return (now.hour == inputDateTimeHead.hour) &&
        (now.day == inputDateTimeHead.day);
  }

  String formatNumber(int number) {
    if (number >= 1000) {
      String formattedNumber = number.toString();
      String result = '';
      int counter = 0;

      for (int i = formattedNumber.length - 1; i >= 0; i--) {
        result = formattedNumber[i] + result;
        counter++;
        if (counter % 3 == 0 && i > 0) {
          result = '.' + result;
        }
      }

      return result;
    } else {
      return number.toString();
    }
  }

  String calculateDewPoint(double temperature, double humidity) {
    const double a = 17.27;
    const double b = 237.7;
    double alpha =
        ((a * temperature) / (b + temperature)) + (log(humidity / 100));
    double dewPoint = (b * alpha) / (a - alpha);
    String dewPointString = dewPoint.toStringAsFixed(0);

    return dewPointString;
  }

  String formatDate(String inputTanggal) {
    DateTime inputDate = DateTime.parse(inputTanggal);

    String formattedDate = DateFormat('EEEE, HH:mm').format(inputDate);

    return '$formattedDate WIB';
  }

  String formatDate2(String inputDate) {
    DateTime dateTime = DateTime.parse(inputDate);

    String formattedDate = DateFormat('dd MMM y | HH:mm').format(dateTime);

    return formattedDate;
  }

  String formatDate3(int? inputDate) {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch((inputDate ?? 0) * 1000);

    String formattedDate = DateFormat('HH.mm').format(dateTime);

    return formattedDate;
  }

  String getMainEnumValue(ListElement listElement) {
    String mainEnumValue =
        listElement.weather!.first.main.toString().split('.').last;
    return mainEnumValue;
  }

  String getDescEnumValue(ListElement listElement) {
    String descEnumValue =
        listElement.weather!.first.description.toString().split('.').last;
    return descEnumValue;
  }

  Future<void> get5ForecastWeather(double lat, double lon) async {
    await APIService().get5DaysForecastWeather(lat, lon).then((value) async {
      if (value.list != null) {
        list5DaysWeather = value.list!;
        currentWeather = value.list!.first;
        currentLoc = value.city!;
        update();
        setDateNow();
      }
      finishLoadData();
      update();
    }).handleError((onError) {
      finishLoadData(errorMessage: onError.toString());
      debugPrint("error : " + onError.toString());
      return throw onError;
    });
  }

  Future<void> getLocation() async {
    LocationService().getUserCurrentLocation().then((value) async {
      lat = value.latitude;
      lon = value.longitude;
      await get5ForecastWeather(lat, lon);
      finishLoadData();
      update();
    }).handleError((onError) {
      finishLoadData(errorMessage: onError.toString());
      debugPrint("error : " + onError.toString());
      return throw onError;
    });
  }
}
