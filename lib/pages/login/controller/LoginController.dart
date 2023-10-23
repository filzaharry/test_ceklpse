import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test_ceklpse/pages/login/model/LoginRequest.dart';
import 'package:flutter_test_ceklpse/pages/login/model/LoginResponse.dart';
import 'package:flutter_test_ceklpse/widget_general/Constants.dart';
import 'package:flutter_test_ceklpse/widget_general/CustomAlertDialog.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  static LoginController get find => Get.find();

  RxBool isApiCallProcess = false.obs;
  RxBool keyboardVisible = false.obs;
  LoginRequestModel? req;

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  bool? modalStatus;
  String? modalTitle;
  String? modalSubtitle;

  @override
  Future<void> onInit() async {
    super.onInit();
    req = LoginRequestModel();
  }

  cleanDataInputLogin() {
    username.clear();
    password.clear();
  }

  loadNewData() {
    // final profileC = Get.put(ProfileController());
    // final notifC = Get.put(NotificationController());
    // final historyC = Get.put(HistoryController());

    // profileC.loadData();
    // notifC.loadData();
    // historyC.loadMonth();
    // notifC.loadTotalNotif();
  }

  onSubmit() async {
    isApiCallProcess.value = true;
    if (username.text == "" || password.text == "") {
      isApiCallProcess.value = false;

      Get.dialog(
          CustomAlertDialog(
            title: errorTitle,
            // image: value.data!.icon!,
            message: emptyForm,
            onNegativePressed: () async {
              Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
            },
            onPostivePressed: () {
              Get.back();
            },
            positiveBtnText: 'Tutup',
          ),
          barrierDismissible: true);
    } else {
      req?.username = username.text;
      req?.password = password.text;

      postData(req!).then((value) async {
        // print(jsonEncode(value));
        isApiCallProcess.value = false;
        if (value.statusCode == 200 || value.statusCode == 201) {
          cleanDataInputLogin();
          loadNewData();

          Get.offNamedUntil('/home', ModalRoute.withName('/home'));
          Get.dialog(
            CustomAlertDialog(
              title: value.message!,
              // image: value.data!.icon!,
              message: value.data!.message!,
              onNegativePressed: () async {
                Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
              },
              onPostivePressed: () {
                Get.back();
              },
              positiveBtnText: 'Tutup',
            ),
            barrierDismissible: true,
          );
        } else {
          Get.dialog(
            CustomAlertDialog(
              title: value.message!,
              // image: value.data!.icon!,
              message: value.data!.message!,
              onNegativePressed: () async {
                Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
              },
              onPostivePressed: () {
                Get.back();
              },
              positiveBtnText: 'Tutup',
            ),
            barrierDismissible: true,
          );
        }
      });
    }
  }

  Future<LoginResponseModel> postData(LoginRequestModel requestModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('auth');

    String url = apiUrl + "auth/login";
    Map<String, String> headers2 = {'Content-Type': 'application/json'};

    final response = await http.post(Uri.parse(url),
        body: jsonEncode(requestModel), headers: headers2);

    await pref.setString("auth", response.headers['authentication'].toString());

    if (response.statusCode >= 200) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load Data');
    }
  }
}
