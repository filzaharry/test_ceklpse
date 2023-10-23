import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
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
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("assets/img/bg_blue.jpg"),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/detailprofile");
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          // profileC.profilePic == ""
                          //     ? CircleAvatar(
                          //         radius: 20.0,
                          //         backgroundColor: Colors.white,
                          //         backgroundImage:
                          //             AssetImage('assets/img/home/user.png'))
                          //     : CircleAvatar(
                          //         radius: 20.0,
                          //         backgroundColor: Colors.white,
                          //         backgroundImage: NetworkImage(
                          //             profileC.profilePic.toString()),
                          //       ),
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
                            child: Obx(() => Text(
                                  'Halo Brave Dragon',
                                  // 'Halo ' + profileC.fullname.value,
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
