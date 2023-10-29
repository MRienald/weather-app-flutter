import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app_flutter/resources/resources.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.23,
              backgroundColor: AppColors.white,
              backgroundImage: AppImages.imgLogo.image().image,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.neutral60,
                    width: 3,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              "Forecast App",
              style: TextStyle(
                  color: AppColors.neutral70,
                  fontSize: 8.w,
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              "By. Muhammad Rienaldi Muharam",
              style: TextStyle(
                  color: AppColors.neutral60,
                  fontSize: 4.w,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
