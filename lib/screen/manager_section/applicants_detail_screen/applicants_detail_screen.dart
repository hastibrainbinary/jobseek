import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/manager_section/applicants_detail_screen/applicants_detail_screen_widget/applicants_details_screen_widget.dart';
import 'package:jobseek/screen/manager_section/applicants_detail_screen/applicants_details_controller.dart';
import 'package:jobseek/screen/manager_section/manager_home_screen/manager_home_screen_widget/manager_home_screen_widget.dart';
import 'package:jobseek/utils/app_res.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

import '../../../utils/string.dart';

class ApplicantsDetailScreen extends StatelessWidget {
  final bool isWrong;
  ApplicantsDetailScreen({
    Key? key,
    required this.isWrong,
  }) : super(key: key);
  final ApplicantsDetailsController controller =
      Get.put(ApplicantsDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        const SizedBox(
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: ColorRes.logoColor,
                    borderRadius: BorderRadius.circular(8)),
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: ColorRes.containerColor,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    "Applicants",
                    style: appTextStyle(color: ColorRes.black, fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: MediaQuery.of(context).viewInsets.bottom > 0
              ? Get.height * 0.5
              : Get.height * 0.8,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GetBuilder<ApplicantsDetailsController>(
                    id: "drop",
                    builder: (controller) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorRes.borderColor),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Image(
                                      image: AssetImage(AssetRes.detailsImage),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Adam Smith",
                                        style: appTextStyle(
                                            color: ColorRes.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "UI/UX Designer",
                                        style: appTextStyle(
                                            color: ColorRes.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: ColorRes.logoColor,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: const GradientIcon(
                                      Icons.chat,
                                      20,
                                      LinearGradient(colors: [
                                        Color(0xFFBE9DFF),
                                        Color(0xFF8B4EFF),
                                      ]),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: ColorRes.logoColor,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: const GradientIcon(
                                        Icons.videocam_sharp,
                                        20,
                                        LinearGradient(colors: [
                                          Color(0xFFBE9DFF),
                                          Color(0xFF8B4EFF),
                                        ])),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            color: ColorRes.lightGrey,
                            height: 2,
                            width: Get.width,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () => Get.toNamed(AppRes.resumeScreen),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: const LinearGradient(colors: [
                                    Color(0xFFBF9EFF),
                                    Color(0xFF8B4EFF),
                                  ])),
                              child: Center(
                                child: Text(
                                  "See Resume",
                                  style: appTextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: controller.selectedValue == "Rejected"
                                      ? ColorRes.red
                                      : (controller.selectedValue == "Active"
                                          ? ColorRes.darkGreen
                                          : ColorRes.containerColor),
                                  width: 2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: controller.selectedValue == "Rejected"
                                      ? ColorRes.red
                                      : (controller.selectedValue == "Active"
                                          ? ColorRes.darkGreen
                                          : ColorRes.containerColor),
                                ),
                                isExpanded: true,
                                value: controller.selectedValue,
                                items: controller.list.map((e) {
                                  return DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(
                                      e.toString(),
                                      style: appTextStyle(
                                          color: controller.selectedValue ==
                                                  "Rejected"
                                              ? ColorRes.red
                                              : (controller.selectedValue ==
                                                      "Active"
                                                  ? ColorRes.darkGreen
                                                  : ColorRes.containerColor),
                                          fontSize: 14),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? value) =>
                                    controller.onChangeStatus(value!),
                                hint: Text(
                                  "Mark Status as",
                                  style: appTextStyle(
                                      color: ColorRes.containerColor,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            color: ColorRes.grey.withOpacity(0.15),
                            height: 1,
                            width: Get.width,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          controller.selectedValue == "Schedule Interview"
                              ? Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: dateTimeBox(
                                              text: "Date",
                                              image: AssetRes.calender,
                                              onTap: controller.selectDate,
                                              value: controller.showDate,
                                              context: context),
                                        )),
                                        Expanded(
                                            child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: dateTimeBox(
                                              text: "Hour",
                                              image: AssetRes.time,
                                              onTap: controller.selectTime,
                                              value: controller.showTime,
                                              context: context),
                                        )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Message",
                                    style: appTextStyle(
                                        color: ColorRes.black2, fontSize: 16),
                                  ),
                                  Text(
                                    "*",
                                    style: appTextStyle(color: ColorRes.red),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: ColorRes.containerColor,
                                        width: 1.5)),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Message"),
                                  maxLines: 6,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                InkWell(
                  onTap: () {
                    settingModalBottomSheet(context, isWrong);
                  },
                  child: Container(
                    height: 50,
                    width: Get.width,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(colors: [
                          Color(0xFFBF9EFF),
                          Color(0xFFBF9EFF),
                        ])),
                    child: Center(
                      child: Text(
                        "Send to Applicants",
                        style: appTextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}

void settingModalBottomSheet(context, bool isWrong) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return Container(
          height: 390,
          decoration: const BoxDecoration(
            color: ColorRes.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45),
              topRight: Radius.circular(45),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Image.asset(
                  isWrong == false
                      ? AssetRes.successImage
                      : AssetRes.failedImage,
                  height: 130),
              const SizedBox(height: 20),
              Center(
                child: isWrong == false
                    ? Text("Successful!",
                        style: appTextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: ColorRes.containerColor))
                    : Text("Oops, Failed",
                        style: appTextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: ColorRes.starColor)),
              ),
              const SizedBox(height: 10),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: isWrong == false
                      ? Text("Notifications have been sent to applicants..",
                          style: appTextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorRes.black.withOpacity(0.6),
                          ),
                          textAlign: TextAlign.center)
                      : Text(
                          Strings
                              .pleasemakesurethatyourinternetconnectionisactiveandstablethenpressTryAgain,
                          style: appTextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorRes.black.withOpacity(0.6),
                          ),
                          textAlign: TextAlign.center),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 50,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                margin: const EdgeInsets.only(right: 18, left: 18, top: 10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(colors: [
                    ColorRes.gradientColor,
                    ColorRes.containerColor,
                  ]),
                ),
                child: Text(isWrong == false ? Strings.ok : Strings.tryAgain,
                    style: appTextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        );
      });
}
