import 'package:flutter/material.dart';
import 'package:flutter_test_ceklpse/widget_general/custombutton/FillButtonPrimary.dart';
import 'package:flutter_test_ceklpse/widget_general/custombutton/OutlinedButtonPrimary.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final String positiveBtnText;
  final String negativeBtnText;
  final String image;
  bool? isNetworkImage;

  final Function onPostivePressed;
  final Function onNegativePressed;

  CustomAlertDialog({
    required this.title,
    required this.message,
    this.isNetworkImage,
    this.image = "",
    this.positiveBtnText = "",
    this.negativeBtnText = "",
    required this.onPostivePressed,
    required this.onNegativePressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // contentPadding: EdgeInsets.symmetric(vertical: 30),
      backgroundColor: Color(0xFFFFF7E1),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      title: null,
      content: WillPopScope(
        onWillPop: () async => false,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        isNetworkImage == true
                            ? Container(
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                                child: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: NetworkImage(image),
                                ),
                              )
                            : image != ""
                                ? Container(
                                    margin:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    child: Image(
                                      image: AssetImage(image),
                                      // width: 120,
                                      height: 200,
                                    ),
                                  )
                                : SizedBox(),
                        title != ""
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 7),
                                child: Text(
                                  title,
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                decoration: BoxDecoration(
                                    color: Color(0xFFec008b),
                                    borderRadius: BorderRadius.circular(20)))
                            : SizedBox(),
                        SizedBox(
                          height: 20,
                        ),

                        //MESSAGE
                        message != ""
                            ? Text(
                                message,
                                textAlign: TextAlign.center,
                              )
                            : SizedBox(),
                        SizedBox(
                          height: 40,
                        ),
                        //BUTTON
                        negativeBtnText != "" && positiveBtnText != ""
                            ? Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      // child: Text(negativeBtnText),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: FillButtonPrimary(
                                            text: positiveBtnText),
                                      ),

                                      // textColor: Theme.of(context).accentColor,
                                      onTap: () {
                                        // Get.back();
                                        onPostivePressed();
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      // child: Text(negativeBtnText),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: OutlinedButtonPrimary(
                                            text: negativeBtnText),
                                      ),

                                      // textColor: Theme.of(context).accentColor,
                                      onTap: () {
                                        // Get.back();
                                        onNegativePressed();
                                      },
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  negativeBtnText != ""
                                      ? GestureDetector(
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: FillButtonPrimary(
                                                text: negativeBtnText),
                                          ),
                                          onTap: () {
                                            // Get.back();
                                            onNegativePressed();
                                          },
                                        )
                                      : SizedBox(),
                                  positiveBtnText != ""
                                      ? TextButton(
                                          child: Text(positiveBtnText),
                                          onPressed: () {
                                            // Get.back();
                                            onPostivePressed();
                                          },
                                        )
                                      : SizedBox(),
                                ],
                              )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Positioned(
            //   top: -40,
            //   right: -40,
            //   child: GestureDetector(
            //     onTap: () {
            //       // Get.back();
            //       onNegativePressed();
            //     },
            //     child: Container(
            //       margin: EdgeInsets.only(bottom: 20, right: 20),
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(8),
            //         color: Colors.red,
            //       ),
            //       child: Icon(
            //         Icons.close,
            //         color: Colors.white,
            //         size: 40,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
