import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app_flutter/resources/resources.dart';
import 'package:weather_app_flutter/utils/dialog/modal_dialog.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    this.controller,
  }) : super(key: key);

  final controller;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(),
          DrawerHeader(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.white,
                  backgroundImage: (controller.gender == 'Laki - laki')
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
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Hi... Muhammad Rienaldi",
                  style: TextStyle(
                    fontSize: 5.w,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            horizontalTitleGap: -5,
            leading: Image.asset(
              AppImages.icAbout.path,
              height: 20,
              width: 20,
            ),
            title: const Text(
              'Tentang Kami',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
            ),
            tileColor: AppColors.background2,
            onTap: () {
              CustomModalDialog().dialogModuleNotReady(
                context,
                "Fitur Belum Tersedia!",
                "Mohon maaf fitur ini belum tersedia dan masih dalam tahap pengembangan.",
              );
            },
          ),
          ListTile(
            horizontalTitleGap: -5,
            leading: Image.asset(
              AppImages.icNotification.path,
              height: 20,
              width: 20,
            ),
            title: const Text(
              'Notifikasi',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
            ),
            tileColor: AppColors.background2,
            onTap: () {
              CustomModalDialog().dialogModuleNotReady(
                context,
                "Fitur Belum Tersedia!",
                "Mohon maaf fitur ini belum tersedia dan masih dalam tahap pengembangan.",
              );
            },
          ),
          ListTile(
            horizontalTitleGap: -5,
            leading: Image.asset(
              AppImages.icLanguage.path,
              height: 20,
              width: 20,
            ),
            title: const Text(
              'Ganti Bahasa',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
            ),
            tileColor: AppColors.background2,
            onTap: () {
              CustomModalDialog().dialogModuleNotReady(
                context,
                "Fitur Belum Tersedia!",
                "Mohon maaf fitur ini belum tersedia dan masih dalam tahap pengembangan.",
              );
            },
          ),
          ListTile(
            horizontalTitleGap: -5,
            leading: Image.asset(
              AppImages.icCompliant.path,
              height: 20,
              width: 20,
            ),
            title: const Text(
              'Kebijakan Privasi',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
            ),
            tileColor: AppColors.background2,
            onTap: () {
              CustomModalDialog().dialogModuleNotReady(
                context,
                "Fitur Belum Tersedia!",
                "Mohon maaf fitur ini belum tersedia dan masih dalam tahap pengembangan.",
              );
            },
          ),
          ListTile(),
          ListTile(
            horizontalTitleGap: -5,
            leading: Image.asset(
              AppImages.icLogout.path,
              height: 20,
              width: 20,
            ),
            title: const Text(
              'Logout',
              style: TextStyle(
                color: AppColors.primaryRed,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
              color: AppColors.primaryRed,
            ),
            tileColor: AppColors.background2,
            onTap: () {
              controller.authController.signOut();
            },
          )
        ],
      ),
    );
  }
}
