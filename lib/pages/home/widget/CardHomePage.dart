import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardHomePage extends StatelessWidget {
  String? title;
  String? push;

  CardHomePage({
    required this.title,
    required this.push,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(push!),
      child: Container(
        // width: double.infinity,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.43,
        ),
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.grey,
        ),
        clipBehavior: Clip.none,
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            // Positioned(
            //   left: 10,
            //   top: -20,
            //   child: Container(
            //     height: imgHeight,
            //     width: imgWidth,
            //     child: image != '' ? Image.asset(image.toString()) : SizedBox(),
            //   ),
            // ),
            Positioned(
              //main content container postition.
              child: Container(
                height: 100,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          title.toString(),
                          style: TextStyle(
                              // color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
