import 'package:flutter/material.dart';

class TestPage4 extends StatefulWidget {
  const TestPage4({super.key});

  @override
  State<TestPage4> createState() => _TestPage4State();
}

class _TestPage4State extends State<TestPage4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test Page 4')),
      body: Center(
        child: Container(
          child: Text('Test Page 4'),
        ),
      ),
    );
    ;
  }
}
