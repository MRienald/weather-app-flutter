import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app_flutter/data/remote/baseUrl.dart';
import 'package:weather_app_flutter/feature/weather/components/card_weather.dart';
import 'package:weather_app_flutter/feature/weather/components/detail_weater.dart';
import 'package:weather_app_flutter/feature/weather/components/list_weather.dart';
import 'package:weather_app_flutter/feature/weather/weather_controller.dart';
import 'package:weather_app_flutter/resources/resources.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WeatherController>(
      builder: (controller) {
        return SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            color: AppColors.white,
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(controller.list5DaysWeather!.length.toString()),
                  CardWeather(
                    controller: controller,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ListWeather(
                    controller: controller,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  DetailWeather(
                    controller: controller,
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
