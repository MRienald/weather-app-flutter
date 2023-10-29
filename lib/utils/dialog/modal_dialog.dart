import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:weather_app_flutter/resources/resources.dart';

class CustomModalDialog {
  YYDialog dialogModuleNotReady(
    BuildContext context,
    String title,
    String contentText,
  ) {
    return YYDialog().build(context)
      ..width = MediaQuery.of(context).size.width * 0.9
      ..height = MediaQuery.of(context).size.height * 0.43
      ..backgroundColor = AppColors.white
      ..borderRadius = 10.0
      ..showCallBack = () {
        print("showCallBack invoke");
      }
      ..barrierDismissible = false
      ..widget(Padding(
        padding: EdgeInsets.only(top: 32),
        child: Image.asset(
          AppImages.icWarning.path,
          width: 80,
          height: 80,
        ),
      ))
      ..widget(Padding(
        padding: EdgeInsets.only(top: 16, right: 20, left: 20),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              color: AppColors.neutral90,
              fontWeight: FontWeight.w700),
        ),
      ))
      ..widget(Padding(
        padding: EdgeInsets.only(top: 24, right: 32, left: 32),
        child: Text(
          contentText,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 12,
              color: AppColors.neutral50,
              fontWeight: FontWeight.w500),
        ),
      ))
      ..widget(Padding(
        padding: EdgeInsets.only(top: 36),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 129,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.blueTag,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                "Kembali",
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ))
      ..animatedFunc = (child, animation) {
        return ScaleTransition(
          child: child,
          scale: Tween(begin: 0.0, end: 1.0).animate(animation),
        );
      }
      ..show();
  }
}
