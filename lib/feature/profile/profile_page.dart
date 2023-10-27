import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app_flutter/feature/profile/components/avatar_profile.dart';
import 'package:weather_app_flutter/feature/profile/components/profile_detail.dart';
import 'package:weather_app_flutter/feature/profile/profile_controller.dart';
import 'package:weather_app_flutter/resources/resources.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, this.parentController});

  final parentController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return Container(
          width: double.infinity,
          color: AppColors.background1,
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
          child: Column(
            children: [
              AvatarProfile(
                parentController: parentController,
                controller: controller,
              ),
              SizedBox(
                height: 3.h,
              ),
              ProfileDetail(
                parentController: parentController,
                controller: controller,
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        );
      },
    );
  }
}
