import 'package:flutter/material.dart';

class ModalLoading extends StatelessWidget {
  const ModalLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        Center(
            child: SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator(
            color: Color(0xFF000000),
            strokeWidth: 3,
          ),
        )),
      ],
    );
  }
}
