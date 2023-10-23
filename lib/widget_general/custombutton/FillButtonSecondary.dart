import 'package:flutter/material.dart';

class FillButtonSecondary extends StatelessWidget {
  final String text;
  final int type;

  FillButtonSecondary({required this.text, this.type = 0});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // alignment: Alignment.center,
        width: MediaQuery.of(context).size.width / 2.2,

        height: 40.0,
        decoration: new BoxDecoration(
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.5),
            //     spreadRadius: 0,
            //     blurRadius: 4,
            //     offset: Offset(0, 4), // changes position of shadow
            //   ),
            // ],
            border: Border.all(color: Color(0xffF9A21C), width: 2),
            color: Colors.white,
            // border: Border.all(color: Color(0XFFE5A740), width: 3.0),
            borderRadius: new BorderRadius.circular(50.0)),
        child: Center(
          child: new Text(
            text,
            style: new TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
