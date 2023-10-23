import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_ceklpse/pages/login/controller/LoginController.dart';
import 'package:flutter_test_ceklpse/widget_general/PasswordHidden.dart';
import 'package:flutter_test_ceklpse/widget_general/custombutton/FillButtonPrimary.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  LoginController loginC = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.15,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                              ),
                              child: new TextFormField(
                                controller: loginC.username,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(
                                    16,
                                  )
                                ],
                                keyboardType: TextInputType.numberWithOptions(
                                  signed: true,
                                  decimal: true,
                                ),
                                decoration: FormDecoration(
                                  'Username',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    print('Mohon masukkan username anda');
                                    return 'Mohon masukkan username anda';
                                  }
                                  return null;
                                },
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
                  onTap: () => validateAndSave(),
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
