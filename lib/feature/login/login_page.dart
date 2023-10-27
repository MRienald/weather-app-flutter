// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app_flutter/feature/login/login_controller.dart';
import 'package:weather_app_flutter/resources/resources.dart';
import 'package:weather_app_flutter/routes/page_names.dart';
import 'package:weather_app_flutter/utils/firebase_service/auth_service.dart';
import 'package:weather_app_flutter/utils/helper/validator.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: FormBuilder(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundColor: AppColors.white,
                      backgroundImage: AppImages.imgLogo.image().image,
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
                      height: 5.h,
                    ),
                    Text(
                      "Masuk atau buat akun untuk memulai",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: (6.5).w, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    FormBuilderTextField(
                      name: 'username',
                      //enabled: !controller.isLoading,
                      style: Theme.of(context).textTheme.headline5,
                      decoration: InputDecoration(
                        icon: Text(
                          "@",
                          style: TextStyle(fontSize: 5.w),
                        ),
                        fillColor: Colors.transparent,
                        hintText: 'Masukkan Email anda',
                      ),
                      validator: Validator.required(),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    FormBuilderTextField(
                      name: 'password',
                      //enabled: !controller.isLoading,
                      obscureText: controller.hidePasswod,
                      style: Theme.of(context).textTheme.headline5,
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock_outline_rounded),
                        suffixIcon: InkWell(
                          onTap: () {
                            controller.hideOrShowPassword();
                          },
                          child: (controller.hidePasswod == false)
                              ? Icon(Icons.visibility_outlined)
                              : Icon(Icons.visibility_off_outlined),
                        ),
                        fillColor: Colors.transparent,
                        hintText: 'Masukkan password',
                      ),
                      validator: Validator.required(),
                      keyboardType: TextInputType.text,
                    ),
                    InkWell(
                      onTap: () {
                        if (controller.formKey.currentState != null &&
                            controller.formKey.currentState!
                                .saveAndValidate()) {
                          controller.login();
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 8.h),
                        alignment: Alignment.center,
                        height: 5.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.blueTag,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'Masuk',
                          style: TextStyle(
                              fontSize: 4.w,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        AuthService().signInWithGoogle();
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 12),
                        alignment: Alignment.center,
                        height: 5.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.primaryRed,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'Masuk dengan akun Gmail',
                          style: TextStyle(
                              fontSize: 4.w,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 5.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "belum punya akun? registrasi",
                            style: TextStyle(
                                fontSize: (3.5).w, fontWeight: FontWeight.w600),
                          ),
                          InkWell(
                            onTap: () {
                              Get.offAndToNamed(PageName.REGIST);
                            },
                            child: Text(
                              " di sini",
                              style: TextStyle(
                                  fontSize: (3.5).w,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryRed),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
