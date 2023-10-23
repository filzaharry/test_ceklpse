import 'package:flutter/material.dart';

class TestPage3 extends StatefulWidget {
  const TestPage3({super.key});

  @override
  State<TestPage3> createState() => _TestPage3State();
}

class _TestPage3State extends State<TestPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test Page 3')),
      body: Center(
        child: Container(
          child: Text('Test Page 3'),
        ),
      ),
    );
    ;
  }
}
