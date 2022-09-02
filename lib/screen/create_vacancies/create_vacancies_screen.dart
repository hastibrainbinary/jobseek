import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/common/widgets/backButton.dart';
import 'package:jobseek/common/widgets/common_error_box.dart';
import 'package:jobseek/common/widgets/common_textField.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';
import 'create_vacancies_controller.dart';

class CreateVacanciesScreen extends StatelessWidget {
  const CreateVacanciesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateVacanciesController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.backgroungColor,
        body: Column(
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
                  'Create Vacancies',
                  style: appTextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      height: 1,
                      color: ColorRes.black),
                ),
              ],
            ),
            SizedBox(
              height: Get.height - 120,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        const Image(
                          image: AssetImage(AssetRes.airBnbLogo),
                          height: 100,
                        ),
                        Positioned(
                          bottom: 2,
                          left: 80,
                          child: Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: ColorRes.containerColor),
                              child: const Icon(
                                Icons.edit,
                                size: 13,
                                color: ColorRes.white,
                              )),
                        )
                      ],
                    ),
                    const SizedBox(height: 18),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      color: ColorRes.lightGrey.withOpacity(0.8),
                      height: 1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Obx(
                        () => Column(children: [
                          Row(
                            children: [
                              Text(
                                "Open Position",
                                style: appTextStyle(
                                  color: ColorRes.black.withOpacity(0.6),
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "*",
                                style: appTextStyle(color: ColorRes.starColor),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          commonTextFormField(
                              textDecoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Open Position",
                                  hintStyle: appTextStyle(
                                      fontSize: 14,
                                      color: ColorRes.black.withOpacity(0.15))),
                              controller: controller.positionController),
                          controller.isPositionValidate.value == true
                              ? Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    commonErrorBox("Please Enter Position"),
                                  ],
                                )
                              : const SizedBox(),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                "Salary",
                                style: appTextStyle(
                                    color: ColorRes.grey, fontSize: 14),
                              ),
                              Text(
                                "*",
                                style: appTextStyle(color: ColorRes.starColor),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          commonTextFormField(
                              textDecoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Salary",
                                hintStyle: appTextStyle(
                                    fontSize: 14,
                                    color: ColorRes.black.withOpacity(0.15)),
                                suffixIcon: Container(
                                  padding: const EdgeInsets.all(13),
                                  child: Image(
                                    image:
                                        const AssetImage(AssetRes.currencyIcon),
                                    height: 5,
                                    color: ColorRes.black.withOpacity(0.15),
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
                              Text(
                                "Location",
                                style: appTextStyle(
                                    color: ColorRes.grey, fontSize: 14),
                              ),
                              Text(
                                "*",
                                style: appTextStyle(color: ColorRes.starColor),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          commonTextFormField(
                              textDecoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Location",
                                hintStyle: appTextStyle(
                                    fontSize: 14,
                                    color: ColorRes.black.withOpacity(0.15)),
                                suffixIcon: Container(
                                  padding: const EdgeInsets.all(20),
                                  child: Image(
                                    image: const AssetImage(AssetRes.dropIcon),
                                    height: 5,
                                    color: ColorRes.black.withOpacity(0.15),
                                  ),
                                ),
                              ),
                              controller: controller.locationController),
                          controller.isLocationValidate.value == true
                              ? Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    commonErrorBox("Please Enter Location"),
                                  ],
                                )
                              : const SizedBox(),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                "Type",
                                style: appTextStyle(
                                    color: ColorRes.grey, fontSize: 14),
                              ),
                              Text(
                                "*",
                                style: appTextStyle(color: ColorRes.starColor),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          commonTextFormField(
                              textDecoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Type",
                                hintStyle: appTextStyle(
                                  fontSize: 14,
                                  color: ColorRes.black.withOpacity(0.15),
                                ),
                                suffixIcon: Container(
                                  padding: const EdgeInsets.all(20),
                                  child: Image(
                                    color: ColorRes.black.withOpacity(0.20),
                                    image: const AssetImage(
                                      AssetRes.dropIcon,
                                    ),
                                    height: 5,
                                  ),
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
                            height: 70,
                          ),
                          GetBuilder<CreateVacanciesController>(
                              id: "profile",
                              builder: (controller) {
                                return (controller.positionController.text == '' ||
                                        controller.salaryController.text ==
                                            '' ||
                                        controller.locationController.text ==
                                            '' ||
                                        controller.typeController.text == '')
                                    ? InkWell(
                                        // dashboard write
                                        onTap: () => controller.validate(),

                                        child: Container(
                                          height: 50,
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                          child: Text("Next",
                                              style: appTextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: ColorRes.white)),
                                        ),
                                      )
                                    : InkWell(
                                        // dashboard write
                                        onTap: () => controller.validate(),
                                        child: Container(
                                          height: 60,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: const LinearGradient(
                                                colors: [
                                                  ColorRes.gradientColor,
                                                  ColorRes.containerColor
                                                ]),
                                          ),
                                          child: Text("Next",
                                              style: appTextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
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