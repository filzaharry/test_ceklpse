// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_ceklpse/pages/login/controller/LoginController.dart';
import 'package:flutter_test_ceklpse/pages/login/widget/LoginForm.dart';
import 'package:flutter_test_ceklpse/progressHUD.dart';
import 'package:flutter_test_ceklpse/widget_general/PasswordHidden.dart';
import 'package:flutter_test_ceklpse/widget_general/custombutton/FillButtonPrimary.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginC = Get.put(LoginController());
  late FocusNode focusNodeHp;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    loginC.cleanDataInputLogin();
    focusNodeHp = FocusNode();
  }

  void validateAndSave() {
    final FormState form = _formKey.currentState!;
    if (form.validate()) {
      loginC.onSubmit();
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ProgressHUD(
        inAsyncCall: loginC.isApiCallProcess.isTrue,
        opacity: 0.3,
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [LoginForm()],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
