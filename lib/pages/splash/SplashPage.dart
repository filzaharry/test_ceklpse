import 'package:flutter/material.dart';
import 'package:flutter_test_ceklpse/pages/splash/controller/SplashController.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashController controller = SplashController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.moveSplash();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: null,
        body: Center(
          child: Text('Splash Page Loading ...'),
        ),
      ),
    );
  }
}
// Image.asset('assets/img/splash/saranghaeyo.png')