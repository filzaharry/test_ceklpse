import 'package:flutter/material.dart';
import 'package:flutter_test_ceklpse/pages/home/controller/HomeController.dart';
import 'package:flutter_test_ceklpse/pages/home/widget/CardHomePage.dart';
import 'package:flutter_test_ceklpse/pages/home/widget/HomeMainMenu.dart';
import 'package:flutter_test_ceklpse/widget_general/custombutton/FillButtonPrimary.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeC = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    homeC.loadData();
  }

  Future<void> _refresh() {
    return Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Obx(
                          () => homeC.isApiCallProcess.isTrue
                              ? SizedBox()
                              : CircleAvatar(
                                  radius: 20.0,
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage(
                                    homeC.imageProfile.value,
                                  ),
                                ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xff2B3990),
                            borderRadius: new BorderRadius.circular(40),
                          ),
                          child: Obx(() => homeC.isApiCallProcess.isTrue
                              ? SizedBox()
                              : Text(
                                  homeC.nameProfile.value,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                        ),
                      ],
                    ),
                  ),
                  HomeMainMenu(),
                  GestureDetector(
                    onTap: () {
                      homeC.logout();
                    },
                    child: FillButtonPrimary(text: 'Logout'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
