import 'package:flutter/material.dart';
import 'package:flutter_test_ceklpse/pages/home/HomeApp.dart';
import 'package:flutter_test_ceklpse/pages/login/LoginPage.dart';
import 'package:flutter_test_ceklpse/pages/splash/SplashPage.dart';
import 'package:flutter_test_ceklpse/pages/test_page_1/TestPage1.dart';
import 'package:flutter_test_ceklpse/pages/test_page_2/TestPage2.dart';
import 'package:flutter_test_ceklpse/pages/test_page_3/TestPage3.dart';
import 'package:flutter_test_ceklpse/pages/test_page_4/TestPage4.dart';
import 'package:get/get.dart';

class RouteApp extends StatelessWidget {
  const RouteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
        theme: _theme(),
        title: "Test Project CekLpse",
        routes: <String, WidgetBuilder>{
          '/login': (BuildContext context) => LoginPage(),
          '/home': (BuildContext context) => HomeApp(),
          '/test_page_1': (BuildContext context) => TestPage1(),
          '/test_page_2': (BuildContext context) => TestPage2(),
          '/test_page_3': (BuildContext context) => TestPage3(),
          '/test_page_4': (BuildContext context) => TestPage4(),
        });
  }

  ThemeData _theme() {
    return new ThemeData(
      fontFamily: "MyriadPro",
    );
  }
}
