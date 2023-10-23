import 'package:flutter/material.dart';

class TestPage2 extends StatefulWidget {
  const TestPage2({super.key});

  @override
  State<TestPage2> createState() => _TestPage2State();
}

class _TestPage2State extends State<TestPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test Page 2')),
      body: Center(
        child: Container(
          child: Text('Test Page 2'),
        ),
      ),
    );
  }
}
