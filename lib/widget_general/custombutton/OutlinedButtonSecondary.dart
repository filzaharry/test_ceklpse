import 'package:flutter/material.dart';

class OutlinedButtonSecondary extends StatelessWidget {
  final String text;
  final int type;

  OutlinedButtonSecondary({required this.text, this.type = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 45.0,
      decoration: new BoxDecoration(
          color: type == 0 ? Color(0xff234431) : Color(0xffE43027),
          // border: Border.all(color: Color(0XFFE5A740), width: 3.0),
          borderRadius: new BorderRadius.circular(5.0)),
      child: new Text(
        text,
        style: new TextStyle(
            fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w500),
      ),
    );
  }
}
