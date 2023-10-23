import 'package:flutter/material.dart';

class FillButtonPrimary extends StatelessWidget {
  final String text;
  final int type;

  FillButtonPrimary({required this.text, this.type = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width / 2.2,
      alignment: Alignment.center,
      height: 45.0,
      decoration: new BoxDecoration(
        color:
            type == 0 ? Color(0xffFFCB03) : Color.fromARGB(255, 195, 195, 195),
        borderRadius: new BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: new Text(
        text,
        style: new TextStyle(
            fontSize: 18.0,
            color:
                type == 0 ? Colors.black : Color.fromARGB(255, 160, 160, 160),
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
