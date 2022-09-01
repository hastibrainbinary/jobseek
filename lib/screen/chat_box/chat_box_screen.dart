import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

import 'chat_box_controller.dart';

class ChatBoxScreen extends StatelessWidget {
  ChatBoxScreen({Key? key}) : super(key: key);
  final controller = Get.put(ChatBoxController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.backgroungColor,
        body: Column(children: [
          const SizedBox(height: 10),
          Row(children: [
            Container(
              margin: const EdgeInsets.all(15),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: ColorRes.logoColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(top: 11),
                child: Text(
                  textAlign: TextAlign.center,
                  "Logo",
                  style: appTextStyle(
                      color: ColorRes.containerColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 10),
                ),
              ),
            ),
            const SizedBox(width: 56),
            Text(
              'Chat Box',
              style: appTextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  height: 1,
                  color: ColorRes.black),
            ),
          ]),
          const SizedBox(height: 25),
          Container(
            width: 339,
            decoration: const BoxDecoration(
                color: ColorRes.white2,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: TextField(
              controller: controller.searchController,
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: const Icon(Icons.search, color: ColorRes.grey),
                hintText: "Search",
                hintStyle: appTextStyle(
                    fontSize: 14,
                    color: ColorRes.grey,
                    fontWeight: FontWeight.w500),
                contentPadding: const EdgeInsets.only(left: 20, top: 13),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.only(right: 20),
            height: 32,
            child: ListView.builder(
                itemCount: controller.jobs.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => controller.onTapJobs(index),
                    child: Obx(() => Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 32,
                          width: 70,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorRes.containerColor, width: 2),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: controller.selectedJobs.value == index
                                  ? ColorRes.containerColor
                                  : ColorRes.white),
                          child: Text(
                            controller.jobs[index],
                            style: appTextStyle(
                                color: controller.selectedJobs.value == index
                                    ? ColorRes.white
                                    : ColorRes.containerColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        )),
                  );
                }),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: Get.height * 0.60,
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 92,
                  width: Get.width,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      border: Border.all(
                        color: const Color(0xffF3ECFF),
                      ),
                      color: ColorRes.white),
                  child: Row(
                    children: [
                      Image.asset(AssetRes.chatImage),
                      const SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "UI/UX Designer",
                            style: appTextStyle(
                                color: ColorRes.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "Hi Adam Smith,",
                            style: appTextStyle(
                                color: ColorRes.black,
                                fontSize: 9,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 22,
                            width: 22,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  ColorRes.gradientColor,
                                  ColorRes.containerColor
                                ],
                              ),
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                textAlign: TextAlign.center,
                                '1',
                                style: appTextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: ColorRes.white),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "20.00",
                            style: appTextStyle(
                                fontSize: 12,
                                color: ColorRes.black.withOpacity(0.8),
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      const SizedBox(width: 10)
                    ],
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
