// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app_flutter/data/remote/baseUrl.dart';
import 'package:weather_app_flutter/resources/resources.dart';

class ListWeather extends StatelessWidget {
  const ListWeather({
    Key? key,
    this.controller,
    this.parentController,
  }) : super(key: key);

  final controller;
  final parentController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Prakiraan Cuaca",
          style: TextStyle(
            fontSize: 6.w,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: (controller.list5DaysWeather != null)
                ? controller.list5DaysWeather.length
                : 0,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  controller.chooseWeather(index);
                },
                child: Container(
                  width: 120,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: (controller.weatherIndex.value == index)
                        ? AppColors.background3
                        : null,
                    border: (controller.weatherIndex.value == index)
                        ? null
                        : Border.all(
                            width: 1,
                            color: AppColors.grey,
                          ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (controller.list5DaysWeather == null)
                          ? SizedBox()
                          : Text(
                              (controller.compareDate(
                                      controller.list5DaysWeather[index].dtTxt
                                          .toString(),
                                      controller
                                          .list5DaysWeather[index +
                                              ((controller.list5DaysWeather
                                                          .length ==
                                                      index + 1)
                                                  ? 0
                                                  : 1)]
                                          .dtTxt
                                          .toString()))
                                  ? "Now"
                                  : controller.getDayName(controller
                                          .list5DaysWeather[index].dtTxt.day %
                                      7),
                              style: TextStyle(
                                fontSize: 4.w,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                      Text(
                        controller.formatDate2(controller
                                .list5DaysWeather[index].dtTxt
                                .toString()) ??
                            "27 Oct 2023 | 07:00",
                        style: TextStyle(
                          fontSize: 3.w,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Image.network(
                        "${BaseUrl.iconUrl + controller.list5DaysWeather[index].weather.first.icon}@2x.png",
                        height: 60,
                        width: 60,
                      ),
                      Text(
                        (controller.list5DaysWeather[index].main.temp
                                    .toStringAsFixed(1) ??
                                "35") +
                            "°C",
                        style: TextStyle(
                          fontSize: (5.5).w,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
