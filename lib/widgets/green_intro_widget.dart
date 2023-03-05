import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Widget greenIntroWidgetWithoutLogos(
    {String title = "Profile Settings", String? subtitle}) {
  return Container(
    width: Get.width,
    height: Get.height * 0.6,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/img_1.png"),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Easy Taxi",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
