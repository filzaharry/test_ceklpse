import 'dart:async';
import 'dart:convert';

import 'package:flutter_test_ceklpse/pages/home/model/UserModel.dart';
import 'package:flutter_test_ceklpse/widget_general/Constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  static HomeController get find => Get.find();

  RxBool isApiCallProcess = false.obs;
  RxString imageProfile = ''.obs;
  RxString nameProfile = ''.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  loadData() {
    userData().then((value) {
      print('brave dragon =====');
      print(jsonEncode(value));
      if (value.statusCode == 200) {
        imageProfile.value = value.data!.picture!;
        nameProfile.value = value.data!.name!;
      } else {
        print("Terjadi kesalahan");
      }
    });
  }

  logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
    Get.offAndToNamed('/login');
  }
}

Future<UserDataResponseModel> userData() async {
  Map<String, String> headers = {};
  SharedPreferences pref = await SharedPreferences.getInstance();
  headers['authentication'] = pref.getString("auth").toString();
  String url = apiUrl + "user";
  final response = await http.get(Uri.parse(url), headers: headers);

  if (response.statusCode >= 200) {
    return UserDataResponseModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to Load Data');
  }
}
