import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:weather_app_flutter/data/remote/errorhandler/error_handler.dart';
import 'package:weather_app_flutter/feature/auth/auth_controller.dart';
import 'package:weather_app_flutter/routes/page_names.dart';

class AuthService {
  final AuthController authController = AuthController.find;
  signInWithGoogle() async {
    authController.setLoad();
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) async {
      await authController
          .saveAuthData(user: value.user!, token: value.user?.uid ?? "")
          .handleError((message) {
        Get.snackbar('Terjadi kesalahan', message.toString(),
            backgroundColor: Colors.red, colorText: Colors.white);
        return throw message;
      });
    });
  }
}
