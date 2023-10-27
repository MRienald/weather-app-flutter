import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app_flutter/resources/resources.dart';

class DetailInfoEarthquake extends StatelessWidget {
  const DetailInfoEarthquake({
    Key? key,
    this.controller,
  }) : super(key: key);

  final controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.background3,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppImages.icClock.path,
                height: 20,
                width: 20,
              ),
              SizedBox(
                width: 12,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Waktu :",
                      style: TextStyle(
                        fontSize: 4.w,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      // "26 Oktober 2023 | 12:44:17 WIB",
                      ((controller.currentEarthquake != null)
                              ? controller.currentEarthquake.tanggal
                              : (controller.updateEarthquake == null)
                                  ? "0"
                                  : controller.updateEarthquake.tanggal) +
                          " | " +
                          ((controller.currentEarthquake != null)
                              ? controller.currentEarthquake.jam
                              : (controller.updateEarthquake == null)
                                  ? "0"
                                  : controller.updateEarthquake.jam),
                      style: TextStyle(
                        fontSize: 4.w,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          (controller.currentEarthquake != null)
              ? SizedBox()
              : Column(
                  children: [
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          AppImages.icEarthquakeRadius.path,
                          height: 20,
                          width: 20,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Wilayah Dirasakan (Skala MMI)",
                                style: TextStyle(
                                  fontSize: 4.w,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                // "III-IV Saumlaki",
                                (controller.updateEarthquake == null)
                                    ? "0"
                                    : controller.updateEarthquake.dirasakan,
                                style: TextStyle(
                                  fontSize: 4.w,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
          SizedBox(
            height: 24,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppImages.icPlace.path,
                height: 20,
                width: 20,
              ),
              SizedBox(
                width: 12,
              ),
              Container(
                width: (MediaQuery.of(context).size.width > 370)
                    ? MediaQuery.of(context).size.width * 0.8
                    : MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Lokasi Gempa",
                      style: TextStyle(
                        fontSize: 4.w,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      // "Pusat Gempa berada di laut 176 km Timur laut Maluku Barat Daya",
                      (controller.currentEarthquake != null)
                          ? "Pusat Gempa berada di ${controller.currentEarthquake.wilayah}"
                          : (controller.updateEarthquake == null)
                              ? "0"
                              : controller.updateEarthquake.wilayah,
                      style: TextStyle(
                        fontSize: 4.w,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
