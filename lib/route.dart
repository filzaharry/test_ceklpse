import 'package:flutter/material.dart';
import 'package:flutter_test_ceklpse/pages/home/HomeApp.dart';
import 'package:flutter_test_ceklpse/pages/login/LoginPage.dart';
import 'package:flutter_test_ceklpse/pages/splash/SplashPage.dart';
import 'package:get/get.dart';

class RouteApp extends StatelessWidget {
  const RouteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
        theme: _theme(),
        title: "Pop Ice",
        routes: <String, WidgetBuilder>{
          '/login': (BuildContext context) => LoginPage(),
          '/home': (BuildContext context) => HomeApp(),
        });
  }

  ThemeData _theme() {
    return new ThemeData(
      fontFamily: "MyriadPro",
    );
  }
}
