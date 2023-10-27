// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app_flutter/data/remote/baseUrl.dart';
import 'package:weather_app_flutter/model/5-forecast-weather.dart';
import 'package:weather_app_flutter/resources/resources.dart';

class CardWeather extends StatelessWidget {
  const CardWeather({
    Key? key,
    this.controller,
  }) : super(key: key);

  final controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 35,
          left: 0,
          right: 0,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.38,
            decoration: BoxDecoration(
              color: AppColors.background1,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColors.neutral20.withOpacity(0.5),
                  blurRadius: 4,
                  offset: const Offset(1, 2),
                ),
              ],
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: Image.asset(
                          (controller.currentWeather != null)
                              ? (controller.getMainEnumValue(
                                          controller.currentWeather) ==
                                      'CLEAR')
                                  ? AppImages.imgClearSky.path
                                  : (controller.getMainEnumValue(
                                              controller.currentWeather) ==
                                          'CLOUDS')
                                      ? AppImages.imgPolution.path
                                      : (controller.getMainEnumValue(
                                                  controller.currentWeather) ==
                                              'RAIN')
                                          ? AppImages.imgWeatherDrizzl.path
                                          : (controller.getMainEnumValue(
                                                      controller
                                                          .currentWeather) ==
                                                  'SNOW')
                                              ? AppImages.imgWeatherSnow.path
                                              : AppImages.imgClearSky.path
                              : AppImages.imgClearSky.path,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.width * 0.3,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                "${BaseUrl.iconUrl + ((controller.list5DaysWeather != null) ? controller.list5DaysWeather[0].weather.first.icon : "02d")}@2x.png",
                                height: 8.w,
                                width: 8.w,
                              ),
                              Text(
                                controller.formatDate(
                                  (controller.list5DaysWeather != null)
                                      ? (controller.list5DaysWeather[0] ??
                                              ListElement())
                                          .dtTxt
                                          .toString()
                                      : "2023-10-27 03:00:00",
                                ),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                ((controller.list5DaysWeather ?? [null])
                                            .first !=
                                        null)
                                    ? controller.getMainEnumValue(
                                        controller.list5DaysWeather[0])
                                    : "90%",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.width * 0.3,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                "${BaseUrl.iconUrl + ((controller.list5DaysWeather != null) ? controller.list5DaysWeather[1].weather.first.icon : "02d")}@2x.png",
                                height: 8.w,
                                width: 8.w,
                              ),
                              Text(
                                controller.formatDate(
                                  (controller.list5DaysWeather != null)
                                      ? (controller.list5DaysWeather[1] ??
                                              ListElement())
                                          .dtTxt
                                          .toString()
                                      : "2023-10-27 03:00:00",
                                ),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                ((controller.list5DaysWeather ?? [null])
                                            .first !=
                                        null)
                                    ? controller.getMainEnumValue(
                                        controller.list5DaysWeather[1])
                                    : "90%",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.width * 0.3,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                "${BaseUrl.iconUrl + ((controller.list5DaysWeather != null) ? controller.list5DaysWeather[2].weather.first.icon : "02d")}@2x.png",
                                height: 8.w,
                                width: 8.w,
                              ),
                              Text(
                                controller.formatDate(
                                  (controller.list5DaysWeather != null)
                                      ? (controller.list5DaysWeather[2] ??
                                              ListElement())
                                          .dtTxt
                                          .toString()
                                      : "2023-10-27 03:00:00",
                                ),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                ((controller.list5DaysWeather ?? [null])
                                            .first !=
                                        null)
                                    ? controller.getMainEnumValue(
                                        controller.list5DaysWeather[2])
                                    : "90%",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Positioned(
                  left: 0,
                  top: MediaQuery.of(context).size.height * 0.135,
                  child: Container(
                    height: 90,
                    width: 120,
                    padding: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      color: AppColors.neutral70.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              (controller.currentWeather != null)
                                  ? controller.currentWeather.main.temp
                                      .toStringAsFixed(1)
                                  : "30",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.07,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "°C",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          (controller.currentWeather != null)
                              ? controller
                                  .getMainEnumValue(controller.currentWeather)
                              : "Berawan",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          controller.formatDate(
                            (controller.currentWeather != null)
                                ? controller.currentWeather.dtTxt.toString()
                                : "2023-10-27 03:00:00",
                          ),
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                          ),
                        ),
                        Text(
                          controller.currentLoc.name ?? "Pondok Melati",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 100,
          right: 100,
          top: 0,
          child: Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: Image.network(
                "${BaseUrl.iconUrl + ((controller.currentWeather != null) ? controller.currentWeather.weather.first.icon : "02d")}@2x.png"),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.43,
          width: double.infinity,
        )
      ],
    );
  }
}
