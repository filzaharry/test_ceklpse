import 'package:flutter/material.dart';

class LineDivider extends StatelessWidget {
  const LineDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
      ),
      child: Divider(
        thickness: 1,
        color: Colors.black38,
      ),
    );
  }
}
