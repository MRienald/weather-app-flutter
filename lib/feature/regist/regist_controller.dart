import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:weather_app_flutter/data/remote/base/base_controller.dart';
import 'package:weather_app_flutter/data/remote/errorhandler/error_handler.dart';

class RegistController extends BaseController {
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
  get statusData => throw UnimplementedError();

  @override
  // TODO: implement storageName
  String get storageName => throw UnimplementedError();

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  List<bool> hidePasswod = [true, true];
  FirebaseAuth auth = FirebaseAuth.instance;

  void hideOrShowPassword(int index) {
    hidePasswod[index] = !hidePasswod[index];
    update();
  }

  Future<void> registAccount() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: formKey.currentState?.value['username'],
        password: formKey.currentState?.value['password'],
      );

      User? user = userCredential.user;
      if (user != null) {
        String fullName =
            "${formKey.currentState?.value['firstname']} ${formKey.currentState?.value['lastname']}";
        await user.updateDisplayName(fullName);
        finishLoadData();
      } else {
        finishLoadData(errorMessage: "Registrasi Gagal!");
        debugPrint("User tidak ditemukan setelah registrasi.");
      }
    } catch (error) {
      finishLoadData(errorMessage: "Registrasi Gagal!");
      debugPrint("Terjadi kesalahan: $error");
      rethrow;
    }
  }
}
