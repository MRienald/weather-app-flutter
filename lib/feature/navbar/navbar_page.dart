import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app_flutter/feature/bmkg/bmkg_page.dart';
import 'package:weather_app_flutter/feature/navbar/navbar_controller.dart';
import 'package:weather_app_flutter/feature/profile/profile_page.dart';
import 'package:weather_app_flutter/feature/weather/weather_page.dart';
import 'package:weather_app_flutter/resources/resources.dart';
import 'package:weather_app_flutter/utils/widgets/navnar_item.dart';

class NavbarPage extends StatelessWidget {
  const NavbarPage({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavbarController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.appBar,
          appBar: AppBar(),
          drawer: Drawer(
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
                    Logger().e("message");
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
                    Logger().e("message");
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
                    Logger().e("message");
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
                    Logger().e("message");
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
          ),
          body: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: 0,
                child: SafeArea(
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      controller.swipeDirection =
                          details.delta.dx < 0 ? 'left' : 'right';
                    },
                    onPanEnd: (details) {
                      if (controller.swipeDirection == null) {
                        return;
                      }
                      if (controller.swipeDirection == 'left') {
                        controller.changeTabMenu(controller.tabIndex.value == 2
                            ? 2
                            : controller.tabIndex.value! + 1);
                      }
                      if (controller.swipeDirection == 'right') {
                        controller.changeTabMenu(controller.tabIndex.value == 0
                            ? 0
                            : controller.tabIndex.value! - 1);
                      }
                    },
                    child: Container(
                      color: AppColors.warningBorder,
                      alignment: Alignment.center,
                      child: IndexedStack(
                        index: controller.tabIndex.value ?? 0,
                        children: [
                          const WeatherPage(),
                          const BMKGPage(),
                          ProfilePage(
                            parentController: controller,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 20,
                child: SafeArea(
                  child: Container(
                    padding: EdgeInsets.all(4),
                    margin: EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.background2,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          24,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ...List.generate(
                          3,
                          (index) => InkWell(
                            onTap: () {
                              controller.changeTabMenu(index);
                            },
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: (controller.tabIndex.value == index)
                                    ? AppColors.appBar.withOpacity(0.5)
                                    : AppColors.appBar.withOpacity(0),
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                (index == 2)
                                    ? (controller.gender == 'Laki - laki')
                                        ? controller.navItemIcon[index]
                                        : controller.navItemIcon[index + 1]
                                    : controller.navItemIcon[index],
                                height: 40,
                                width: 40,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
