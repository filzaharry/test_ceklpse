import 'package:flutter/material.dart';

class TestPage1 extends StatefulWidget {
  const TestPage1({super.key});

  @override
  State<TestPage1> createState() => _TestPage1State();
}

class _TestPage1State extends State<TestPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test Page 1')),
      body: Center(
        child: Container(
          child: Text('Test Page 1'),
        ),
      ),
    );
  }
}
