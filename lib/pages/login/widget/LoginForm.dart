import 'package:flutter/material.dart';
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
  String hp = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            // controller: loginC.hp,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            decoration: new InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 12,
              ),
              hintText: 'No. Whatsapp',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF234431), width: 1),
                borderRadius: new BorderRadius.circular(5.0),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF234431), width: 1),
                borderRadius: new BorderRadius.circular(5.0),
              ),
            ),
            onChanged: (value) {
              setState(() {
                hp = value;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          PasswordHidden(
            // controller: loginC.password,
            field: 'Kata Sandi',
            onChange: (value) {
              setState(() {
                password = value;
              });
            },
          ),
          SizedBox(height: 20),
          new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  loginC.cleanDataInputLogin();
                  Get.toNamed('/forgotpass');
                },
                child: new Text(
                  "Lupa Kata Sandi",
                  style: new TextStyle(
                    shadows: [
                      Shadow(color: Colors.black, offset: Offset(0, -5))
                    ],
                    color: Colors.transparent,
                    decorationColor: Colors.black,
                    decoration: TextDecoration.underline,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              if (hp != "" && password != "") {
                if (_formKey.currentState!.validate()) {
                  loginC.onSubmit();
                }
              }
            },
            child: FillButtonPrimary(
              text: "LOGIN",
              type: hp != "" && password != "" ? 0 : 1,
            ),
          ),
        ],
      ),
    );
  }
}
