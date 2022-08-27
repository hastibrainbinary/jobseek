import 'package:flutter/material.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/color_res.dart';

Widget commonErrorBox(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorRes.invalidColor),
    child: Row(
      children: [
        const Icon(
          Icons.error,
          color: ColorRes.starColor,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          text,
          style: appTextStyle(color: ColorRes.starColor,fontWeight: FontWeight.normal,fontSize: 14),
        )
      ],
    ),
  );
}
