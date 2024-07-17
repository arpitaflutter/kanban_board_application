import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban_board_app/global_variables.dart';

class SettingController extends GetxController {
  var locale = Locale('en', '').obs;

  List<Color> colors = <Color>[
    Colors.blue,
    Colors.black,
    Colors.red,
    Colors.orangeAccent,
    Colors.green
  ];

  void changeIndex({required int index}) {
    defaultColor.value = colors[index];
    update();
  }

  void changeLocale(String langCode) {
    var locale = Locale(langCode);
    Get.updateLocale(locale);
    this.locale.value = locale;
  }
}
