import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:jobseek/common/widgets/backButton.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/color_res.dart';

import 'notification_controller.dart';

class NotificationScreenU extends StatelessWidget {
  const NotificationScreenU({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotificationControllerU controller = Get.put(NotificationControllerU());
    return Scaffold(
      backgroundColor: ColorRes.backgroungColor,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: backButton(),
                  ),
                ),
                const SizedBox(width: 80),
                Text(
                  'Notification',
                  style: appTextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      height: 1,
                      color: ColorRes.black),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Sound',
                    style: appTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorRes.black),
                  ),
                ),
                SizedBox(width: Get.width - 135),
                Obx(() => FlutterSwitch(
                    height: 27,
                    width: 45,
                    value: controller.isSwitchedSound.value,
                    activeColor: ColorRes.blueColor,
                    toggleSize: 20,
                    onToggle: (value) => controller.onchangeSound(value))),
              ],
            ),
            const SizedBox(height: 25),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              color: ColorRes.lightGrey.withOpacity(0.8),
              height: 1,
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Vibrate',
                    style: appTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorRes.black),
                  ),
                ),
                SizedBox(width: Get.width - 145),
                Obx(() => FlutterSwitch(
                    height: 27,
                    width: 45,
                    value: controller.isSwitchedVibrate.value,
                    activeColor: ColorRes.blueColor,
                    toggleSize: 20,
                    onToggle: (value) => controller.onchangeVibrate(value))),
              ],
            ),
            const SizedBox(height: 25),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              color: ColorRes.lightGrey.withOpacity(0.8),
              height: 1,
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'New tips available',
                    style: appTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorRes.black),
                  ),
                ),
                SizedBox(width: Get.width - 220),
                Obx(
                      () => FlutterSwitch(
                    height: 27,
                    width: 45,
                    value: controller.isSwitchedTips.value,
                    activeColor: ColorRes.blueColor,
                    toggleSize: 20,
                    onToggle: (value) => controller.onchangeTips(value),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              color: ColorRes.lightGrey.withOpacity(0.8),
              height: 1,
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'New service available',
                    style: appTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorRes.black),
                  ),
                ),
                SizedBox(width: Get.width - 245),
                Obx(() => FlutterSwitch(
                    height: 27,
                    width: 45,
                    value: controller.isSwitchedService.value,
                    activeColor: ColorRes.blueColor,
                    toggleSize: 20,
                    onToggle: (value) => controller.onchangeService(value))),
              ],
            ),
          ]),
    );
  }
}