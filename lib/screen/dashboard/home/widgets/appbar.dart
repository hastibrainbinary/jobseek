import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/service/pref_services.dart';
import 'package:jobseek/utils/app_res.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/color_res.dart';
import 'package:jobseek/utils/pref_keys.dart';

Widget homeAppBar() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18),
    child: Row(
      children: [
        Container(
          height: 40,
          width: 40,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: ColorRes.logoColor),
          child: const Text(
            "Logo",
            style: TextStyle(
                color: ColorRes.containerColor,
                fontSize: 10,
                fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: 'Hello, ',
                      style: appTextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: ColorRes.black)),
                  TextSpan(
                    text: PrefService.getString(PrefKeys.fullName).toString(),
                    style: appTextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: ColorRes.containerColor,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () => Get.toNamed(AppRes.notificationScreen),
          child: Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: ColorRes.logoColor),
              child: const Icon(
                Icons.notifications,
                color: ColorRes.containerColor,
              )),
        ),
      ],
    ),
  );
}
