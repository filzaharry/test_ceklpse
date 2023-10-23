import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'HomePage.dart';

class HomeApp extends StatefulWidget {
  int selectedIndex;
  HomeApp({this.selectedIndex = 1});
  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  int _selectedIndex = 2;
  static List<Widget> _pageOptions = <Widget>[
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // homeC.loadData();
    // livechatC.loadData();
    // notifC.loadData();
    // profileC.loadData();
    SharedPreferences.getInstance().then((prefs) async {
      switch (_selectedIndex) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
        case 3:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: _pageOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 32,
        elevation: 0,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(4),
              child: ImageIcon(
                AssetImage("assets/icons/bx_faq.png"),
                size: 24,
              ),
            ),
            activeIcon: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              child: Container(
                padding: EdgeInsets.all(4),
                color: Color(0xFF01C3FF),
                child: ImageIcon(
                  AssetImage("assets/icons/bx_faq.png"),
                  size: 24,
                  color: Colors.white,
                ),
              ),
            ),
            label: 'FAQ',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(4),
              child: ImageIcon(
                AssetImage("assets/icons/bx_home.png"),
                size: 24,
              ),
            ),
            activeIcon: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              child: Container(
                padding: EdgeInsets.all(4),
                color: Color(0xFF01C3FF),
                child: ImageIcon(
                  AssetImage("assets/icons/bx_home.png"),
                  size: 24,
                  color: Colors.white,
                ),
              ),
            ),
            label: 'Beranda',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(4),
              child: ImageIcon(
                AssetImage("assets/icons/bx_user.png"),
                size: 24,
              ),
            ),
            activeIcon: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              child: Container(
                padding: EdgeInsets.all(4),
                color: Color(0xFF01C3FF),
                child: ImageIcon(
                  AssetImage("assets/icons/bx_user.png"),
                  size: 24,
                  color: Colors.white,
                ),
              ),
            ),
            label: 'Profil',
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
}
