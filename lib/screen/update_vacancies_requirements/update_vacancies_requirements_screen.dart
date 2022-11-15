import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/common/widgets/common_error_box.dart';
import 'package:jobseek/common/widgets/common_textField.dart';
import 'package:jobseek/screen/job_detail_screen/job_detail_widget/job_detail_widget.dart';
import 'package:jobseek/screen/update_vacancies_requirements/update_vacancies_requirement_controller.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class UpdateVacanciesRequirementsScreen extends StatelessWidget {
  UpdateVacanciesRequirementsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateVacanciesRequirementController());

    return Scaffold(
      backgroundColor: ColorRes.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 50),
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.only(left: 10),
                  margin: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: ColorRes.logoColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: ColorRes.containerColor,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    "Update  Vacancies",
                    style: appTextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Obx(() => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.isJobDetails.value = true;
                          controller.update();
                        },
                        child: Container(
                          height: 44,
                          width: 164,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: controller.isJobDetails == true
                                  ? ColorRes.white
                                  : ColorRes.containerColor,
                            ),
                            gradient: LinearGradient(
                              colors: controller.isJobDetails == true
                                  ? [
                                      ColorRes.gradientColor,
                                      ColorRes.containerColor
                                    ]
                                  : [ColorRes.white, ColorRes.white],
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Text(
                              textAlign: TextAlign.center,
                              'Job Details',
                              style: appTextStyle(
                                  color: controller.isJobDetails == true
                                      ? ColorRes.white
                                      : ColorRes.containerColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: controller.ontap,
                        child: Container(
                          height: 44,
                          width: 164,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: controller.isJobDetails == true
                                  ? [ColorRes.white, ColorRes.white]
                                  : [
                                      ColorRes.gradientColor,
                                      ColorRes.containerColor
                                    ],
                            ),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: controller.isJobDetails == true
                                  ? ColorRes.containerColor
                                  : ColorRes.white,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Center(
                              child: Text(
                                'Requirements',
                                style: appTextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: controller.isJobDetails == true
                                      ? ColorRes.containerColor
                                      : ColorRes.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  controller.isJobDetails.value
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: Get.height - 215,
                            child: SingleChildScrollView(
                              child: Column(children: [
                                Stack(
                                  children: [
                                    const Image(
                                      image: AssetImage(AssetRes.airBnbLogo),
                                      height: 70,
                                    ),
                                    Positioned(
                                      bottom: 1,
                                      left: 57,
                                      child: Container(
                                        height: 12,
                                        width: 12,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                            color: ColorRes.containerColor),
                                        child: const Icon(
                                          Icons.edit,
                                          size: 7,
                                          color: ColorRes.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 18),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  color: ColorRes.lightGrey.withOpacity(0.8),
                                  height: 1,
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        "Open Position",
                                        style: appTextStyle(
                                          color:
                                              ColorRes.black.withOpacity(0.6),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "*",
                                      style: appTextStyle(
                                          color: ColorRes.starColor),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                commonTextFormField(
                                    textDecoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.all(15),
                                        border: InputBorder.none,
                                        hintText: "ui ux design",
                                        hintStyle: appTextStyle(
                                            fontSize: 14,
                                            color: ColorRes.black)),
                                    controller: controller.positionController),
                                controller.isPositionValidate.value == true
                                    ? Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          commonErrorBox(
                                              "Please Enter Position"),
                                        ],
                                      )
                                    : const SizedBox(),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        "Salary",
                                        style: appTextStyle(
                                            color: ColorRes.grey, fontSize: 14),
                                      ),
                                    ),
                                    Text(
                                      "*",
                                      style: appTextStyle(
                                          color: ColorRes.starColor),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                commonTextFormField(
                                    textDecoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(15),
                                      border: InputBorder.none,
                                      hintText: '15000',
                                      hintStyle: appTextStyle(
                                          fontSize: 14, color: ColorRes.black),
                                      suffixIcon: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: Image(
                                          image: const AssetImage(
                                              AssetRes.currencyIcon),
                                          color:
                                              ColorRes.black.withOpacity(0.30),
                                        ),
                                      ),
                                    ),
                                    controller: controller.salaryController),
                                controller.isSalaryValidate.value == true
                                    ? Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          commonErrorBox("Please Enter Salary"),
                                        ],
                                      )
                                    : const SizedBox(),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        "Location",
                                        style: appTextStyle(
                                            color: ColorRes.grey, fontSize: 14),
                                      ),
                                    ),
                                    Text(
                                      "*",
                                      style: appTextStyle(
                                          color: ColorRes.starColor),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                commonTextFormField(
                                    textDecoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(15),
                                      border: InputBorder.none,
                                      hintText: 'india',
                                      hintStyle: appTextStyle(
                                        fontSize: 14,
                                        color: ColorRes.black,
                                      ),
                                      suffixIcon: GetBuilder<
                                          UpdateVacanciesRequirementController>(
                                        id: "dropdown",
                                        builder: (controller) {
                                          return DropdownButton(
                                              iconSize: 35.0,
                                              iconEnabledColor:
                                                  Colors.grey.shade400,
                                              iconDisabledColor:
                                                  Colors.grey.shade400,
                                              underline: Container(),
                                              icon: const Icon(
                                                  Icons.arrow_drop_down),
                                              items: controller.items1.map(
                                                (val) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: val,
                                                    child: Text(val),
                                                  );
                                                },
                                              ).toList(),
                                              onChanged: (String? val) {
                                                controller.changeDropdwon(
                                                    val: val!);
                                              });
                                        },
                                      ),
                                    ),
                                    controller: controller.locationController),
                                controller.isLocationValidate.value == true
                                    ? Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          commonErrorBox(
                                              "Please Enter Location"),
                                        ],
                                      )
                                    : const SizedBox(),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        "Type",
                                        style: appTextStyle(
                                            color: ColorRes.grey, fontSize: 14),
                                      ),
                                    ),
                                    Text(
                                      "*",
                                      style: appTextStyle(
                                          color: ColorRes.starColor),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                commonTextFormField(
                                    textDecoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(15),
                                      border: InputBorder.none,
                                      hintText: 'Full time',
                                      hintStyle: appTextStyle(
                                        fontSize: 14,
                                        color: ColorRes.black,
                                      ),
                                      suffixIcon: DropdownButton(
                                        iconSize: 35.0,
                                        iconEnabledColor: Colors.grey.shade400,
                                        iconDisabledColor: Colors.grey.shade400,
                                        underline: Container(),
                                        icon: const Icon(Icons.arrow_drop_down),
                                        items: controller.items.map(
                                          (val) {
                                            return DropdownMenuItem<String>(
                                              value: val,
                                              child: Text(val),
                                            );
                                          },
                                        ).toList(),
                                        onChanged: (String? val) => controller
                                            .changeDropwonType(val: val!),
                                      ),
                                    ),
                                    controller: controller.typeController),
                                controller.isTypeValidate.value == true
                                    ? Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          commonErrorBox("Please Enter Type"),
                                        ],
                                      )
                                    : const SizedBox(),
                                const SizedBox(
                                  height: 20,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        "Status",
                                        style: appTextStyle(
                                            color: ColorRes.grey, fontSize: 14),
                                      ),
                                    ),
                                    Text(
                                      "*",
                                      style: appTextStyle(
                                          color: ColorRes.starColor),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                commonTextFormField(
                                    textDecoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(15),
                                      border: InputBorder.none,
                                      hintText: 'Active',
                                      hintStyle: appTextStyle(
                                        fontSize: 14,
                                        color: ColorRes.black,
                                      ),
                                      suffixIcon: DropdownButton(
                                        iconSize: 35.0,
                                        iconEnabledColor: Colors.grey.shade400,
                                        iconDisabledColor: Colors.grey.shade400,
                                        underline: Container(),
                                        icon: const Icon(Icons.arrow_drop_down),
                                        items: controller.items2.map(
                                          (val) {
                                            return DropdownMenuItem<String>(
                                              value: val,
                                              child: Text(val),
                                            );
                                          },
                                        ).toList(),
                                        onChanged: (String? val) => controller
                                            .changeDropdwonStatus(val: val!),
                                      ),
                                    ),
                                    controller: controller.statusController),
                                controller.isStatusValidate.value == true
                                    ? Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          commonErrorBox("Please Enter Status"),
                                        ],
                                      )
                                    : const SizedBox(),
                                const SizedBox(
                                  height: 20,
                                ),
                                GetBuilder<
                                        UpdateVacanciesRequirementController>(
                                    id: "Vacancies",
                                    builder: (controller) {
                                      return (controller.positionController.text == '' ||
                                              controller
                                                      .salaryController.text ==
                                                  '' ||
                                              controller.locationController
                                                      .text ==
                                                  '' ||
                                              controller.typeController.text ==
                                                  '' ||
                                              controller
                                                      .statusController.text ==
                                                  '')
                                          ? InkWell(
                                              // dashboard write
                                              onTap: controller.onLoginBtnTap,

                                              child: Container(
                                                height: 50,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      ColorRes.gradientColor
                                                          .withOpacity(0.2),
                                                      ColorRes.containerColor
                                                          .withOpacity(0.4)
                                                    ],
                                                  ),
                                                ),
                                                child: Text("Update Vacancy",
                                                    style: appTextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: ColorRes.white)),
                                              ),
                                            )
                                          : InkWell(
                                              onTap: controller.onLoginBtnTap,
                                              child: Container(
                                                height: 50,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  gradient:
                                                      const LinearGradient(
                                                          colors: [
                                                        ColorRes.gradientColor,
                                                        ColorRes.containerColor
                                                      ]),
                                                ),
                                                child: Text("Update Vacancy",
                                                    style: appTextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: ColorRes.white)),
                                              ),
                                            );
                                    }),
                                const SizedBox(
                                  height: 20,
                                ),
                              ]),
                            ),
                          ),
                        )
                      : Column(
                          children: [
                            SizedBox(
                              height: 350,
                              child: ListView.builder(
                                  padding: const EdgeInsets.all(0),
                                  shrinkWrap: true,
                                  itemCount: controller.requirmentList.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        detailBox(controller
                                            .requirmentList[index]
                                            .toString()),
                                        (controller.text.value == true)
                                            ? Container(
                                                //padding: EdgeInsets.symmetric( vertical: 10),
                                                height: 46,
                                                width: 339,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color:
                                                      const Color(0xffF3F0F8),
                                                ),
                                                child: const TextField(
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      prefixIcon: Icon(
                                                        Icons
                                                            .check_circle_outline,
                                                        color: ColorRes
                                                            .containerColor,
                                                        size: 30,
                                                      )),
                                                ),
                                              )
                                            : const SizedBox(),
                                      ],
                                    );
                                  }),
                            ),
                            const SizedBox(height: 22),
                            InkWell(
                              onTap: () {
                                controller.text.value = true;
                              },
                              child: Container(
                                height: 50,
                                width: 339,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: ColorRes.containerColor),
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
                            const SizedBox(height: 60),
                            Container(
                              height: 50,
                              width: 339,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                  colors: [
                                    ColorRes.gradientColor,
                                    ColorRes.containerColor,
                                  ],
                                ),
                              ),
                              child: Text("Update Vacancy",
                                  style: appTextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: ColorRes.white)),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                ],
              ))
        ]),
      ),
    );
  }
}

showCustomDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: 46,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xffEEEBF4),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              maxLines: 6,
            ),
          ),
        );
      });
}
