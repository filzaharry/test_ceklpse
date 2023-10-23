// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_ceklpse/pages/login/controller/LoginController.dart';
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

  @override
  void initState() {
    super.initState();
    loginC.cleanDataInputLogin();
    focusNodeHp = FocusNode();
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
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage("assets/img/bg_blue.jpg"),
              //     fit: BoxFit.cover,
              //   ),
              // ),
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.15,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    // image: DecorationImage(
                                    //   fit: BoxFit.fill,
                                    //   alignment: Alignment.bottomCenter,
                                    //   image:
                                    //       AssetImage('assets/img/frame/sm.png'),
                                    // ),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                      // SizedBox(
                                      //   height: 50,
                                      //   child: Image.asset(
                                      //     'assets/img/login/login.png',
                                      //   ),
                                      // ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 30),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 10.0,
                                              ),
                                              child: new TextFormField(
                                                controller: loginC.phone,
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(
                                                    16,
                                                  )
                                                ],
                                                keyboardType: TextInputType
                                                    .numberWithOptions(
                                                  signed: true,
                                                  decimal: true,
                                                ),
                                                decoration: FormDecoration(
                                                  'No. Handphone',
                                                ),
                                              ),
                                            ),
                                            PasswordHidden(
                                              controller: loginC.password,
                                              field: 'Kata Sandi',
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 80),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    loginC.onSubmit();
                                    // Get.toNamed('/home');
                                  },
                                  child: FillButtonPrimary(
                                    text: 'Mulai',
                                    // type: welcomeC.toggleButton == true ? 1 : 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration FormDecoration(String name) {
    return new InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      hintText: name,
      // labelText: name,
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(color: Colors.black, fontSize: 14),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 1),
        borderRadius: new BorderRadius.circular(14),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 1),
        borderRadius: new BorderRadius.circular(14),
      ),
    );
  }
}
