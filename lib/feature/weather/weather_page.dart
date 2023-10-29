// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/feature/weather/components/card_weather.dart';
import 'package:weather_app_flutter/feature/weather/components/detail_weater.dart';
import 'package:weather_app_flutter/feature/weather/components/list_weather.dart';
import 'package:weather_app_flutter/feature/weather/weather_controller.dart';
import 'package:weather_app_flutter/resources/resources.dart';
import 'package:weather_app_flutter/utils/widgets/loading_page.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WeatherController>(
      builder: (controller) {
        return SafeArea(
          child: (controller.list5DaysWeather == null &&
                  controller.currentWeather == null)
              ? const LoadingPage()
              : Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  color: AppColors.white,
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        CardWeather(
                          controller: controller,
                        ),
                        const SizedBox(
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
