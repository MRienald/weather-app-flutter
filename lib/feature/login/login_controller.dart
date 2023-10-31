import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:logger/logger.dart';
import 'package:weather_app_flutter/data/remote/base/base_controller.dart';
import 'package:weather_app_flutter/data/remote/errorhandler/error_handler.dart';
import 'package:weather_app_flutter/feature/auth/auth_controller.dart';

class LoginController extends BaseController {
  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    // TODO: implement refreshPage
  }

  @override
  // TODO: implement statusData
  get statusData => dataObj;

  @override
  // TODO: implement storageName
  String get storageName => throw UnimplementedError();

  final AuthController authController = AuthController.find;
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  bool hidePasswod = true;

  void hideOrShowPassword() {
    hidePasswod = !hidePasswod;
    update();
  }

  Future<void> login() async {
    loadingState();
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: formKey.currentState?.value['username'],
      password: formKey.currentState?.value['password'],
    )
        .then((value) async {
      await authController.saveAuthData(
          user: value.user!, token: value.user?.uid ?? "");
      finishLoadData();
    }).handleError((onError) {
      finishLoadData(errorMessage: onError.toString());
      debugPrint("error : " + onError.toString());
      return throw onError;
    });
  }
}
