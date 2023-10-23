import 'package:flutter/material.dart';

class OutlinedButtonPrimary extends StatelessWidget {
  final String text;
  final int type;

  OutlinedButtonPrimary({required this.text, this.type = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width / 2.2,
      alignment: Alignment.center,
      height: 45.0,
      decoration: new BoxDecoration(
        color: Color.fromARGB(255, 233, 233, 233),
        borderRadius: new BorderRadius.circular(40),
      ),
      child: new Text(
        text,
        style: new TextStyle(
          fontSize: 18.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
