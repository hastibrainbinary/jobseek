import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/common/widgets/backButton.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

import 'add_requirements_controller.dart';

class RequirementsScreen extends StatelessWidget {
  RequirementsScreen({Key? key}) : super(key: key);
  final controller = Get.put(AddRequirementController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.backgroungColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 18),
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
                const SizedBox(width: 46),
                Text(
                  'Add Requirements',
                  style: appTextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      height: 1,
                      color: ColorRes.black),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'Requirements',
                style: appTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 1,
                    color: ColorRes.black.withOpacity(0.7)),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                  color: const Color(0xffF3F0F8),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xffF3ECFF))),
              child: TextField(
               // readOnly: controller.read,
                decoration: InputDecoration(

                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                ),
                onSubmitted: (value) {
                 // controller.true;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: 50,
                width: 339,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: ColorRes.containerColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage(AssetRes.addIcon),
                      height: 10,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Add New Requirements',
                      style: appTextStyle(
                          color: ColorRes.containerColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
