import 'package:flutter/material.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/color_res.dart';

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
          child: const Text("Logo",
              style: TextStyle(color: ColorRes.containerColor)),
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
                    text: 'Rakib!',
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
        Container(
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
      ],
    ),
  );
}


