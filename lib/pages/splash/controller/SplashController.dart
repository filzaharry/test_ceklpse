import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// const String splashImage = "assets/2023/splash_bg.jpg";

class SplashController {
  void moveSplash() {
    print('asdasd');
    Future.delayed(const Duration(milliseconds: 3000), () {
      print('asdasd123');
      // Get.offNamedUntil('/login', ModalRoute.withName('/login'));
      // Get.to(OtpPage());
      // Get.to(TncPage());
      SharedPreferences.getInstance().then((prefs) {
        // prefs.remove('auth');
        print('AUTHHHH');
        print(prefs.getString('auth').toString());
        print(prefs.getBool('isNotFirstLaunch'));
        if (prefs.getBool('isNotFirstLaunch') == true) {
          // print(prefs.getString('auth').toString());
          if (prefs.getString('auth').toString() != 'null') {
            // print('asd');
            // Get.offAndToNamed('/home');
            // Get.offNamedUntil('/home', (route) => false);
            Get.offNamedUntil('/home', ModalRoute.withName('/home'));
          } else {
            // print('123');
            Get.offNamedUntil('/login', ModalRoute.withName('/login'));
          }
        } else {
          Get.offNamedUntil('/welcome', ModalRoute.withName('/welcome'));
        }
      }).catchError((err) {
        Get.offNamedUntil('/login', ModalRoute.withName('/login'));
      });
    });
  }
}
