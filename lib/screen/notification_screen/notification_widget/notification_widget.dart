import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

Widget notificationBox() {
  return Container(
    height: 92,
    margin: const EdgeInsets.only(bottom: 30),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: ColorRes.borderColor, width: 2),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20),
          alignment: Alignment.center,
          height: 50,
          width: 70,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetRes.notificationDetail),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: Get.width * 0.65,
          padding: const EdgeInsets.only(right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Text(
                "Your application to Apple Company has been read",
                style: appTextStyle(
                    color: ColorRes.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 13),
                maxLines: 2,
              ),
              // const SizedBox(
              //   height: 5,
              // ),
              Text(
                "17:00",
                style: appTextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: ColorRes.black.withOpacity(0.5),
                ),
                textAlign: TextAlign.left,
              ),
              // const SizedBox(
              //   height: 20,
              // ),
            ],
          ),
        )
      ],
    ),
  );
}
