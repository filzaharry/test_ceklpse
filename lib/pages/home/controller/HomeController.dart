import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  static HomeController get find => Get.find();

  RxBool isApiCallProcess = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  loadData() {}
}
