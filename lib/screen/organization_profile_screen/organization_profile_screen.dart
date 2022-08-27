import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/common/widgets/common_error_box.dart';
import 'package:jobseek/common/widgets/common_textField.dart';
import 'package:jobseek/screen/organization_profile_screen/organization_profile_screen_controller.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class OrganizationProfileScreen extends StatelessWidget {
  const OrganizationProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrganizationProfileScreenController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Organization Profile",
                style: appTextStyle(color: ColorRes.black, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: Get.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: ColorRes.borderColor, width: 2)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                        color: ColorRes.logoColor, shape: BoxShape.circle),
                    child: Image.asset(
                      AssetRes.cloud,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Upload Company Logo",
                    style: appTextStyle(color: ColorRes.grey, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              color: ColorRes.lightGrey,
              height: 2,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(() => Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Name of Company",
                            style: appTextStyle(color: ColorRes.grey),
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
                              hintText: "Name of Company",
                              hintStyle: appTextStyle(
                                  color: ColorRes.grey.withOpacity(0.5))),
                          controller: controller.companyName),
                      controller.isNameValidate.value == true
                          ? Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                commonErrorBox("Enter Valid Name"),
                              ],
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Company Email",
                            style: appTextStyle(color: ColorRes.grey),
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
                              hintText: "Company Email",
                              hintStyle: appTextStyle(
                                  color: ColorRes.grey.withOpacity(0.5)),
                              suffixIcon: const Icon(Icons.mail_outline)),
                          controller: controller.companyEmail),
                      controller.isEmailValidate.value == true
                          ? Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                commonErrorBox("Enter Valid Email"),
                              ],
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Established date",
                            style: appTextStyle(color: ColorRes.grey),
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
                              hintText: "Established date",
                              hintStyle: appTextStyle(
                                  color: ColorRes.grey.withOpacity(0.5)),
                              suffixIcon: const Icon(Icons.calendar_today)),
                          controller: controller.companyName),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "City",
                            style: appTextStyle(color: ColorRes.grey),
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
                            hintText: "City",
                            hintStyle: appTextStyle(
                                color: ColorRes.grey.withOpacity(0.5)),
                            suffixIcon: const Icon(
                              Icons.arrow_drop_down_rounded,
                              size: 50,
                            ),
                          ),
                          controller: controller.companyName),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Company Address",
                            style: appTextStyle(color: ColorRes.grey),
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
                            hintText: "Address",
                            hintStyle: appTextStyle(
                                color: ColorRes.grey.withOpacity(0.5)),
                            // suffixIcon: const Icon(Icons.mail_outline),
                          ),
                          controller: controller.companyAddress),
                      controller.isAddressValidate.value == true
                          ? Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                commonErrorBox("Enter Valid Address"),
                              ],
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () => controller.validateAndSubmit(),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(colors: [
                              ColorRes.gradientColor,
                              ColorRes.gradientColor,
                            ]),
                          ),
                          child: Center(
                            child: Text(
                              "Confirm",
                              style: appTextStyle(color: ColorRes.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
