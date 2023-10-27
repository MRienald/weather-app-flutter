import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app_flutter/resources/resources.dart';

class ListEarthquake extends StatelessWidget {
  const ListEarthquake({
    Key? key,
    this.controller,
  }) : super(key: key);

  final controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.dataList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => controller.chooseWeather(index),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.27,
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: AppColors.neutral40.withOpacity(0.5),
                ),
                borderRadius: BorderRadius.circular(10),
                color: (controller.earthquakeIndex.value == index)
                    ? AppColors.background3
                    : AppColors.background2,
              ),
              child: Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.warningBorder,
                    ),
                    child: Text(
                      controller.dataList[index].magnitude ?? "6.1",
                      style: TextStyle(
                        fontSize: 8.w,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.50,
                    margin: EdgeInsets.only(left: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.dataList[index].wilayah ??
                              "196 km TimurLaut MALUKUBRTDAYA",
                          style: TextStyle(
                            fontSize: 4.w,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              AppImages.icSchedule.path,
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.dataList[index].jam ??
                                        "20:25:01 WIB",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    controller.dataList[index].tanggal ??
                                        "25 Oktober 2023",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              AppImages.icLocationEarthquake.path,
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              width: 150,
                              child: Text(
                                controller.dataList[index].potensi ??
                                    "tidak berpotensi tsunami",
                                style: TextStyle(
                                  fontSize: 4.w,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
