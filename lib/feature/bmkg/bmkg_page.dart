import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app_flutter/feature/bmkg/bmkg_controller.dart';
import 'package:weather_app_flutter/feature/bmkg/components/card_bmkg.dart';
import 'package:weather_app_flutter/feature/bmkg/components/detail_info_earthquake.dart';
import 'package:weather_app_flutter/feature/bmkg/components/list_earthquake.dart';
import 'package:weather_app_flutter/resources/resources.dart';
import 'package:weather_app_flutter/utils/widgets/loading_page.dart';

class BMKGPage extends StatelessWidget {
  const BMKGPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BMKGController>(
      builder: (controller) {
        return SafeArea(
          child: (controller.dataList.isEmpty &&
                  controller.updateEarthquake == null)
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
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        CardBMKG(
                          controller: controller,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        DetailInfoEarthquake(
                          controller: controller,
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        ListEarthquake(
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
