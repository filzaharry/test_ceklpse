import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController {
  void moveSplash() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      SharedPreferences.getInstance().then((prefs) {
        if (prefs.getString('auth').toString() != 'null') {
          Get.offNamedUntil('/home', ModalRoute.withName('/home'));
        } else {
          Get.offNamedUntil('/login', ModalRoute.withName('/login'));
        }
      }).catchError((err) {
        Get.offNamedUntil('/login', ModalRoute.withName('/login'));
      });
    });
  }
}
