import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app_flutter/resources/resources.dart';

class AvatarProfile extends StatelessWidget {
  const AvatarProfile({Key? key, this.controller, this.parentController})
      : super(key: key);

  final parentController;
  final controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 35.w,
              height: 35.w,
            ),
            Positioned(
              top: 10,
              right: 10,
              bottom: 10,
              left: 10,
              child: CircleAvatar(
                backgroundColor: AppColors.white,
                backgroundImage: (parentController.gender == 'Laki - laki')
                    ? AppImages.icProfileMan.image().image
                    : AppImages.icProfileWoman.image().image,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.neutral40,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: Container(
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.neutral40,
                    width: 1.5,
                  ),
                ),
                child: Icon(
                  Icons.edit,
                  size: 5.w,
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 12.w,
                  width: 12.w,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
          child: Text(
            controller.auth.currentUser?.displayName ?? "Username",
            maxLines: 1,
            style: TextStyle(
                fontSize: 5.w,
                fontWeight: FontWeight.w700,
                overflow: TextOverflow.ellipsis),
          ),
        )
      ],
    );
  }
}
