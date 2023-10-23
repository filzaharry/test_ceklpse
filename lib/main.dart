import 'package:flutter/material.dart';
import 'package:flutter_test_ceklpse/route.dart';

Future<void> main() async {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const RouteApp();
  }
}
