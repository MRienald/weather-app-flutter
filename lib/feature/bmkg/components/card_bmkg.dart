import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app_flutter/data/remote/baseUrl.dart';
import 'package:weather_app_flutter/resources/resources.dart';

class CardBMKG extends StatelessWidget {
  const CardBMKG({
    Key? key,
    this.controller,
  }) : super(key: key);

  final controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        color: AppColors.background4,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.neutral20.withOpacity(0.5),
            blurRadius: 4,
            offset: Offset(1, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                AppImages.imgBmkgAsset.path,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.successMain.withOpacity(0.3),
              border: Border.all(
                width: 1,
                color: AppColors.successBorder,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              (controller.currentEarthquake != null)
                  ? controller.currentEarthquake.potensi ?? ""
                  : controller.updateEarthquake.potensi ?? "",
              style: TextStyle(
                fontSize: 3.w,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: MediaQuery.of(context).size.width * 0.3,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.icEarthquake.path,
                        height: 8.w,
                        width: 8.w,
                      ),
                      Text(
                        "Magnitudo",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        (controller.currentEarthquake != null)
                            ? controller.currentEarthquake.magnitude ?? ""
                            : controller.updateEarthquake.magnitude ?? "",
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
                      Image.asset(
                        AppImages.icPoolDepth.path,
                        height: 8.w,
                        width: 8.w,
                      ),
                      Text(
                        "Kedalaman",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        (controller.currentEarthquake != null)
                            ? controller.currentEarthquake.kedalaman ?? "0"
                            : controller.updateEarthquake.kedalaman ?? "0",
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
                      Image.asset(
                        AppImages.icCoordinate.path,
                        height: 8.w,
                        width: 8.w,
                      ),
                      Text(
                        (controller.currentEarthquake != null)
                            ? controller.currentEarthquake.lintang ?? "0"
                            : controller.updateEarthquake.lintang ?? "0",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        (controller.currentEarthquake != null)
                            ? controller.currentEarthquake.bujur ?? "0"
                            : controller.updateEarthquake.bujur ?? "0",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
