import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/looking_for_screen/looking_for_widget/looking_for_widget.dart';
import 'package:jobseek/screen/looking_for_screen/looking_for_you_screen_controller.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class LookingForScreen extends StatelessWidget {
  const LookingForScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LookingForYouScreenController());
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: Get.height * 0.25,
          ),
          Image.asset(AssetRes.lookingForYou),
          Expanded(
            child: Container(
              //height: Get.height*0.35,
              width: Get.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 5,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorRes.containerColor.withOpacity(0.2)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(AssetRes.userIcon),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "What are you looking for?",
                    style: appTextStyle(color: ColorRes.black),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () => controller.onChangeWantJobChoice(),
                            child: Obx(() => lookingForYouBox(AssetRes.wantJob,
                                "I want job", controller.isJob.value))),
                        InkWell(
                            onTap: () => controller.onChangeEmployeeChoice(),
                            child: Obx(() => lookingForYouBox(
                                AssetRes.person,
                                "I want an employee",
                                controller.isEmployee.value))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
