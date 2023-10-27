// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

BottomNavigationBarItem NavBarItem(
    {required IconData icons, required String label}) {
  return BottomNavigationBarItem(
    activeIcon: Padding(
        padding: EdgeInsets.only(bottom: 4),
        child: Icon(
          icons,
          size: 8.w,
        )),
    icon: Padding(
        padding: EdgeInsets.only(bottom: 4),
        child: Icon(
          icons,
          size: 7.w,
        )),
    label: label,
  );
}
