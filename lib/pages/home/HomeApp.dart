import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_test_ceklpse/pages/home/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_ceklpse/pages/test_page_1/TestPage1.dart';
import 'package:flutter_test_ceklpse/pages/test_page_2/TestPage2.dart';
import 'package:flutter_test_ceklpse/pages/test_page_3/TestPage3.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeApp extends StatefulWidget {
  int selectedIndex;
  HomeApp({this.selectedIndex = 1});
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeApp> {
  final double circular = 4.0;
  late SharedPreferences prefs;
  bool isLogin = false;
  bool isNoPelExists = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isApiCallProcess = false;
  int _notification = 0;
  var dataUser;
  var countNotif;
  var username;

  String homeSwitch = "off";
  String test1Switch = "off";
  String test2Switch = "off";
  String test3Switch = "off";
  String test4Switch = "off";

  String? lengthNotif;
  List length = [];

  @override
  void initState() {
    super.initState();
  }

  static List<Widget> _pageOptions = <Widget>[
    TestPage1(),
    HomePage(),
    TestPage2(),
    TestPage3(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        key: _scaffoldKey,
        body: Container(
          child: DefaultTabController(
            length: 5,
            initialIndex: 0,
            child: Scaffold(
              appBar: null,
              body: _pageOptions.elementAt(widget.selectedIndex),
              bottomNavigationBar: _bottomCustomBar(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomCustomBar(BuildContext context) {
    switch (widget.selectedIndex) {
      case 0:
        setState(() {
          homeSwitch = "on";
          test1Switch = "off";
          test2Switch = "off";
          test3Switch = "off";
          test4Switch = "off";
        });
        break;
      case 1:
        setState(() {
          homeSwitch = "off";
          test1Switch = "on";
          test2Switch = "off";
          test3Switch = "off";
          test4Switch = "off";
        });
        break;
      case 2:
        setState(() {
          homeSwitch = "off";
          test1Switch = "off";
          test2Switch = "on";
          test3Switch = "off";
          test4Switch = "off";
        });
        break;
      case 3:
        setState(() {
          homeSwitch = "off";
          test1Switch = "off";
          test2Switch = "off";
          test3Switch = "on";
          test4Switch = "off";
        });
        break;
      case 3:
        setState(() {
          homeSwitch = "off";
          test1Switch = "off";
          test2Switch = "off";
          test3Switch = "off";
          test4Switch = "on";
        });
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey))),
      child: BottomNavigationBar(
        iconSize: 32,
        elevation: 0,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.person,
                size: 24,
                color: Colors.grey,
              ),
            ),
            activeIcon: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              child: Container(
                padding: EdgeInsets.all(4),
                color: Color(0xFF01C3FF),
                child: Icon(
                  Icons.person,
                  size: 24,
                  color: Colors.grey,
                ),
              ),
            ),
            label: 'Test1',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.person,
                size: 24,
                color: Colors.grey,
              ),
            ),
            activeIcon: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              child: Container(
                padding: EdgeInsets.all(4),
                color: Color(0xFF01C3FF),
                child: Icon(
                  Icons.person,
                  size: 24,
                  color: Colors.grey,
                ),
              ),
            ),
            label: 'Beranda',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.person,
                size: 24,
                color: Colors.grey,
              ),
            ),
            activeIcon: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              child: Container(
                padding: EdgeInsets.all(4),
                color: Color(0xFF01C3FF),
                child: Icon(
                  Icons.person,
                  size: 24,
                  color: Colors.grey,
                ),
              ),
            ),
            label: 'Test2',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.person,
                size: 24,
                color: Colors.grey,
              ),
            ),
            activeIcon: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              child: Container(
                padding: EdgeInsets.all(4),
                color: Color(0xFF01C3FF),
                child: Icon(
                  Icons.person,
                  size: 24,
                  color: Colors.grey,
                ),
              ),
            ),
            label: 'Test3',
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: widget.selectedIndex,
        selectedItemColor: Color(0xFF808080),
        unselectedItemColor: Color(0xFF808080),
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        selectedFontSize: 11,
        unselectedFontSize: 11,
      ),
    );
  }

  Widget _bottomBar(BuildContext context) {
    return TabBar(
      tabs: <Widget>[
        Tab(
          icon: Icon(Icons.person),
        ),
        Tab(icon: Icon(Icons.map)),
        Tab(icon: Icon(Icons.home)),
        Tab(
          icon: Stack(children: <Widget>[
            new Icon(Icons.notifications),
            Positioned(
              top: 0.0,
              right: 0.0,
              child: new Icon(Icons.brightness_1,
                  size: 8.0, color: Colors.redAccent),
            )
          ]),
        ),
        Tab(icon: Icon(Icons.person)),
      ],
      indicator: UnderlineTabIndicator(
        borderSide:
            BorderSide(width: 4.0, color: Color(int.parse("0xff0F64DE"))),
        insets: EdgeInsets.symmetric(horizontal: 25.0),
      ),
      labelColor: Color(int.parse("0xff0F64DE")),
      unselectedLabelColor: Colors.black,
      onTap: (index) {
        if (index == 0) {
          SharedPreferences.getInstance().then((prefs) => {
                setState(() {
                  isLogin = prefs.getBool('is_login') ?? false;
                })
              });
        }
      },
    );
  }
}
