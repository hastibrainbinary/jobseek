import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/color_res.dart';

Widget notificationBox() {
  return Container(
    margin: EdgeInsets.only(bottom: 30),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: ColorRes.borderColor,width: 2)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
          width: 70,
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          width: Get.width * 0.65,
          padding: const EdgeInsets.only(right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Your application to Apple Company has been read",
                style: appTextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
                maxLines: 2,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "17:00",
                style: appTextStyle(color: ColorRes.grey.withOpacity(0.5),),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    ),
  );
}
