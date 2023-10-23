import 'package:flutter/material.dart';

class CenterLoading extends StatelessWidget {
  const CenterLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(
          color: Colors.black,
          strokeWidth: 3,
        ),
      ),
    );
  }
}
