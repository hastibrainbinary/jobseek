import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/color_res.dart';

Widget lookingForYouBox(String icon, text, bool isSelect) {
  return Container(
    width: Get.width * 0.44,
    height: Get.height * 0.18,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: isSelect == true
                ? ColorRes.containerColor
                : ColorRes.borderColor,
            width: 2),),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            height: 80,
            width:80,
            padding: const EdgeInsets.all(22),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: ColorRes.logoColor),
            child: SizedBox(height: 30,width: 30,child: Image.asset(icon),),),
        Text(
          text,
          style: appTextStyle(color: ColorRes.black, fontSize: 12),
        ),
      ],
    ),
  );
}
