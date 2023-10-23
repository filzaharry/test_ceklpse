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

  TextEditingController phone = TextEditingController();
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
    phone.clear();
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
    if (phone.text == "" || password.text == "") {
      isApiCallProcess.value = false;

      Get.dialog(
          CustomAlertDialog(
            title: "Terjadi Kesalahan",
            image: 'assets/img/dialog/warning.png',
            message: "Ada field yang belum terisi",
            onNegativePressed: () async {
              Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
            },
            onPostivePressed: () {},
            positiveBtnText: '',
          ),
          barrierDismissible: true);
    } else {
      isApiCallProcess.value = false;
      req?.hp = phone.text;
      req?.password = password.text;

      postData(req!).then((value) async {
        print(jsonEncode(value));
        if (value.statusCode == 200 || value.statusCode == 201) {
          cleanDataInputLogin();
          loadNewData();

          Get.offNamedUntil('/home', ModalRoute.withName('/home'));
          Get.dialog(
            CustomAlertDialog(
              title: value.popup!.title!,
              image: value.popup!.icon!,
              message: value.popup!.content!,
              onNegativePressed: () async {
                Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
              },
              onPostivePressed: () {},
              positiveBtnText: '',
            ),
            barrierDismissible: true,
          );
        } else {
          Get.dialog(
            CustomAlertDialog(
              title: value.popup!.title!,
              image: value.popup!.icon!,
              message: value.popup!.content!,
              onNegativePressed: () async {
                Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
              },
              onPostivePressed: () {},
              positiveBtnText: '',
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
    await pref.setBool("openHomeFromLogin", true);
    // print('RESPONSE ==== ');
    // print(response.headers['authentication'].toString());
    // print(pref.getString("auth").toString());
    // print(response.body);

    isApiCallProcess.value = false;

    if (response.statusCode >= 200) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load Data');
    }
  }
}
