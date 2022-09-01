import 'package:flutter/foundation.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: ColorRes.logoColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        'Logo',
                        style: appTextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 8,
                            color: ColorRes.containerColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 46),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Organization Profile",
                    style: appTextStyle(color: ColorRes.black, fontSize: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: Get.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: ColorRes.borderColor,
                ),
              ),
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
                    style: appTextStyle(
                        color: ColorRes.black.withOpacity(0.5), fontSize: 15),
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
              color: ColorRes.lightGrey.withOpacity(0.8),
              height: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(
                () => Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Name of Company",
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
                            hintText: "Name of Company",
                            hintStyle: appTextStyle(
                                fontSize: 14,
                                color: ColorRes.black.withOpacity(0.15))),
                        controller: controller.companyNameController),
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
                          style:
                              appTextStyle(color: ColorRes.grey, fontSize: 14),
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
                              fontSize: 14,
                              color: ColorRes.black.withOpacity(0.15)),
                          suffixIcon: Icon(
                            Icons.mail_outline_outlined,
                            color: ColorRes.black.withOpacity(0.20),
                          ),
                        ),
                        controller: controller.companyEmailController),
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
                          style:
                              appTextStyle(color: ColorRes.grey, fontSize: 14),
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
                    InkWell(
                      onTap: () {
                        controller.onDatePickerTap(context);
                      },
                      child: commonTextFormField(
                          onTap: () => controller.onDatePickerTap(context),
                          textDecoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Established date",
                            hintStyle: appTextStyle(
                                fontSize: 14,
                                color: ColorRes.black.withOpacity(0.15)),
                            suffixIcon: Container(
                              padding: const EdgeInsets.all(15),
                              child: Image(
                                color: ColorRes.black.withOpacity(0.20),
                                image: const AssetImage(
                                  AssetRes.dateIcon,
                                ),
                                height: 20,
                              ),
                            ),
                          ),
                          controller: controller.dateController),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Country",
                          style:
                              appTextStyle(color: ColorRes.grey, fontSize: 14),
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
                    Container(
                      height: 55,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: ColorRes.borderColor),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          iconSize: 30.0,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: ColorRes.black.withOpacity(0.20),
                          ),

                          // ignore: unnecessary_null_comparison
                          value:
                              controller.dropDownValue ?? controller.items[0],
                          style: appTextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                          items: controller.items.map(
                            (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            if (kDebugMode) {
                              print('value');
                            }
                            controller.dropDownValue =
                                controller.items as String;
                            controller.update();
                          },
                        ),
                      ),
                    ),
                    // commonTextFormField(
                    //     textDecoration: InputDecoration(
                    //       border: InputBorder.none,
                    //       hintText: "Country",
                    //       hintStyle: appTextStyle(
                    //           color: ColorRes.black.withOpacity(0.15)),
                    //       suffixIcon: Container(
                    //         padding: const EdgeInsets.all(20),
                    //         child: Image(
                    //           color: ColorRes.black.withOpacity(0.20),
                    //           image: const AssetImage(
                    //             AssetRes.dropIcon,
                    //           ),
                    //           height: 10,
                    //         ),
                    //       ),
                    //     ),
                    //     controller: controller.country),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Company Address",
                          style:
                              appTextStyle(color: ColorRes.grey, fontSize: 14),
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
                            fontSize: 14,
                            color: ColorRes.black.withOpacity(0.15),
                          ),
                        ),
                        controller: controller.companyAddressController),
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
                    GetBuilder<OrganizationProfileScreenController>(
                        id: "profile",
                        builder: (controller) {
                          return (controller.companyNameController.text == '' ||
                                  controller.companyEmailController.text ==
                                      '' ||
                                  controller.dateController.text == '' ||
                                  controller.countryController.text == '' ||
                                  controller.companyAddressController.text ==
                                      '')
                              ? Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      colors: [
                                        ColorRes.gradientColor.withOpacity(0.2),
                                        ColorRes.containerColor.withOpacity(0.4)
                                      ],
                                    ),
                                  ),
                                  child: Text("Confirm",
                                      style: appTextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: ColorRes.white)),
                                )
                              : InkWell(
                                  // dashboard write
                                  onTap: () => controller.validateAndSubmit(),
                                  child: Container(
                                    height: 60,
                                    width: MediaQuery.of(context).size.width,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(colors: [
                                        ColorRes.gradientColor,
                                        ColorRes.containerColor
                                      ]),
                                    ),
                                    child: Text("Confirm",
                                        style: appTextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: ColorRes.white)),
                                  ),
                                );
                        }),
                    // InkWell(
                    //   onTap: () => controller.validateAndSubmit(),
                    //   child: Container(
                    //     height: 60,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //       gradient: LinearGradient(colors: [
                    //         ColorRes.gradientColor.withOpacity(0.4),
                    //         ColorRes.gradientColor.withOpacity(0.4),
                    //       ]),
                    //     ),
                    //     child: Center(
                    //       child: Text(
                    //         "Confirm",
                    //         style: appTextStyle(color: ColorRes.white),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 20,
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
