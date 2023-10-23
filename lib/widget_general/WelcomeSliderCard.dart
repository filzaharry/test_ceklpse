import 'package:flutter/material.dart';

class WelcomeSliderCard extends StatelessWidget {
  final String image;
  final String title;
  final String caption;
  final String footer;
  final String typeFooter;
  final String izin1;
  final String izin2;

  WelcomeSliderCard(
      {required this.image,
      this.title = "",
      required this.caption,
      this.footer = "",
      this.izin1 = "",
      this.izin2 = "",
      this.typeFooter = "default"});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Text('data'),
        Positioned(
          bottom: 0,
          child: Container(
            height: MediaQuery.of(context).size.height / 1.65,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(bottom: 60),
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Colors.transparent,
              // image: new DecorationImage(
              //   image: new AssetImage("assets/2023/onboard_bg.png"),
              //   fit: BoxFit.fill,
              // ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    caption,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      height: 1.25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // if (typeFooter == "izin")
        //   Container(
        //     // margin: EdgeInsets.only(bottom: 0),
        //     child: Column(
        //       children: [
        //         Text(
        //           "HATI HATI PENIPUAN",
        //           style: TextStyle(
        //               color: Colors.black,
        //               fontSize: 9,
        //               fontWeight: FontWeight.bold),
        //         ),
        //         Text(
        //           "Promo ini tidak dipungut biaya apapun",
        //           style: TextStyle(
        //             color: Colors.black,
        //             fontSize: 9,
        //             // fontWeight: FontWeight.w500
        //           ),
        //         ),
        //         SizedBox(
        //           height: 15,
        //         ),
        //         Text(
        //           "Nomor Izin :",
        //           style: TextStyle(
        //             color: Colors.black,
        //             fontSize: 9,
        //             // fontWeight: FontWeight.w500
        //           ),
        //         ),
        //         Text(
        //           "Undian Langsung : " + izin1,
        //           style: TextStyle(
        //             color: Colors.black,
        //             fontSize: 9,
        //             // fontWeight: FontWeight.w500
        //           ),
        //         ),
        //         Text(
        //           "Undian Tidak Langsung : " + izin2,
        //           style: TextStyle(
        //             color: Colors.black,
        //             fontSize: 9,
        //             // fontWeight: FontWeight.w500
        //           ),
        //         ),
        //       ],
        //     ),
        //   )
        // else if (typeFooter == "link")
        //   Container(
        //     margin: EdgeInsets.only(bottom: 20),
        //     child: Text(
        //       footer,
        //       style: TextStyle(
        //           color: Colors.black,
        //           fontSize: 9,
        //           fontWeight: FontWeight.w600),
        //     ),
        //   )
      ],
    );
  }
}
