import 'package:logger/logger.dart';
import 'package:weather_app_flutter/data/remote/baseUrl.dart';
import 'package:weather_app_flutter/model/5-forecast-weather.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_flutter/model/listUpdateEarthquakeInfo.dart';
import 'dart:convert' as convert;

import 'package:weather_app_flutter/model/updateEarthquakeInfo.dart';

class APIService {
  Future<Response5ForecastWeather> get5DaysForecastWeather(
      double lat, double lon) async {
    Response5ForecastWeather responseData = Response5ForecastWeather();
    final uri = Uri.parse(BaseUrl.openWeatherUrl).replace(queryParameters: {
      'lat': lat.toString(),
      'lon': lon.toString(),
      'appid': BaseUrl.openWeatherAPIKey,
      'units': 'metric',
    });
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      responseData = Response5ForecastWeather.fromJson(json);

      return responseData;
    } else {
      return Response5ForecastWeather();
    }
  }

  Future<UpdateEartquakeInfo> getUpdateEarthquakeInfo() async {
    UpdateEartquakeInfo responseData = UpdateEartquakeInfo();
    final uri = Uri.parse("${BaseUrl.bbkgURL}autogempa.json");
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      responseData = UpdateEartquakeInfo.fromJson(json);

      return responseData;
    } else {
      return UpdateEartquakeInfo();
    }
  }

  Future<ListUpdateEartquakeInfo> getListUpdateEarthquakeInfo() async {
    ListUpdateEartquakeInfo responseData = ListUpdateEartquakeInfo();
    final uri = Uri.parse("${BaseUrl.bbkgURL}gempaterkini.json");
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      responseData = ListUpdateEartquakeInfo.fromJson(json);

      return responseData;
    } else {
      return ListUpdateEartquakeInfo();
    }
  }
}
