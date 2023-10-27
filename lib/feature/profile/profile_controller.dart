import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:logger/logger.dart';
import 'package:weather_app_flutter/data/remote/base/base_controller.dart';

class ProfileController extends BaseController {
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

  @override
  void onInit() async {
    // TODO: implement onInit
    init();
    super.onInit();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  String firstName = "";
  String lastName = "";

  void init() async {
    if (auth.currentUser != null) {
      List<String> listName = auth.currentUser!.displayName!.split(" ");
      firstName = listName.first;
      List<String> temp = [];
      listName.skip(1).forEach((data) {
        temp.add(data);
      });
      lastName = temp.join(" ");
      update();
    }
  }
}
