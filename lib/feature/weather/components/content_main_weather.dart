import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app_flutter/resources/resources.dart';

class ContentMainWeather extends StatelessWidget {
  ContentMainWeather({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final controller;
  int index;

  @override
  Widget build(BuildContext context) {
    return (controller.currentWeather == null ||
            controller.list5DaysWeather == null)
        ? SizedBox()
        : (index == 3 || index == 5)
            ? Container(
                height: 150,
                width: double.infinity,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Positioned(
                      top: 5,
                      bottom: 5,
                      right: 5,
                      left: 5,
                      child: Image.asset(
                        (index == 3)
                            ? AppImages.icCompass.path
                            : AppImages.icBarometer.path,
                      ),
                    ),
                    Positioned(
                      top: (index == 5) ? 45 : 40,
                      bottom: (index == 5) ? 30 : 40,
                      right: (index == 5) ? 35 : 40,
                      left: (index == 5) ? 35 : 40,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.neutral70.withOpacity(0.15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            (index == 5)
                                ? const Icon(
                                    Icons.arrow_downward_rounded,
                                    color: AppColors.white,
                                  )
                                : SizedBox(),
                            Text(
                              (index == 3)
                                  ? (controller.currentWeather.wind.speed * 3.6)
                                      .toStringAsFixed(0)
                                  : controller.formatNumber(
                                      controller.currentWeather.main.pressure),
                              style: TextStyle(
                                fontSize: 5.w,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                              ),
                            ),
                            Text(
                              (index == 3) ? "km/h" : "hPa",
                              style: TextStyle(
                                fontSize: 4.w,
                                fontWeight: FontWeight.w500,
                                color: AppColors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    (controller.currentWeather == null ||
                            controller.list5DaysWeather == null)
                        ? ""
                        : (index == 0)
                            ? "3"
                            : (index == 1)
                                ? "${(controller.currentWeather != null) ? controller.currentWeather.main.feelsLike.toStringAsFixed(1) : "39"}°C"
                                : (index == 2)
                                    ? controller.formatDate3(
                                        controller.currentLoc.sunset)
                                    : (index == 4)
                                        ? "${controller.currentWeather.main.humidity}%"
                                        : "",
                    style: TextStyle(
                      fontSize: 8.w,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                  (index == 0)
                      ? Text(
                          "Moderate",
                          style: TextStyle(
                            fontSize: 6.w,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        )
                      : SizedBox(),
                  SizedBox(
                    height: (index == 0)
                        ? MediaQuery.of(context).size.width * 0.1
                        : MediaQuery.of(context).size.width * 0.2,
                  ),
                  Text(
                    (controller.currentWeather == null ||
                            controller.list5DaysWeather == null)
                        ? ""
                        : (index == 0)
                            ? "Use sun Protection until 16.00"
                            : (index == 1)
                                ? "Humidity is making it feel hotter"
                                : (index == 2)
                                    ? "Sunrise: ${controller.formatDate3(controller.currentLoc.sunrise)}"
                                    : (index == 4)
                                        ? "The Dew point is ${controller.calculateDewPoint((controller.currentWeather.main.temp ?? 0).toDouble(), (controller.currentWeather.main.humidity ?? 0).toDouble())}° right now"
                                        : "",
                    style: TextStyle(
                      fontSize: (3.5).w,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  )
                ],
              );
  }
}
