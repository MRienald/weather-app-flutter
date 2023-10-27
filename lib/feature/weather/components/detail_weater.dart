// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app_flutter/feature/weather/components/content_main_weather.dart';
import 'package:weather_app_flutter/resources/resources.dart';

class DetailWeather extends StatelessWidget {
  const DetailWeather({Key? key, this.controller}) : super(key: key);

  final controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisExtent: 200,
            childAspectRatio: 1,
            crossAxisSpacing: 8,
            mainAxisSpacing: 12,
          ),
          itemCount: controller.gridItem.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.redTag.withOpacity(0.6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        controller.gridItem.values.elementAt(index),
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        controller.gridItem.keys.elementAt(index),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(211, 211, 211, 1),
                        ),
                      ),
                    ],
                  ),
                  ContentMainWeather(
                    controller: controller,
                    index: index,
                  )
                ],
              ),
            );
          }),
    );
  }
}
