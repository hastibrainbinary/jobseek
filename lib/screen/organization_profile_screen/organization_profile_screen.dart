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
              const SizedBox(width: 20),
              Text(
                'Organization Profile',
                style: appTextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    height: 1,
                    color: ColorRes.black),
              ),
            ]),
            const SizedBox(
              height: 18,
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
                  InkWell(
                    onTap: () => controller.ontapGallery1(),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: ColorRes.logoColor,
                          shape: BoxShape.circle,
                          image: (controller.image == null)
                              ? const DecorationImage(
                                  image: AssetImage(
                                    AssetRes.cloud,
                                  ),
                                )
                              : DecorationImage(
                                  image: FileImage(
                                    controller.image!,
                                  ),
                                  fit: BoxFit.fill)),
                    ),
                    //  Container(
                    //   height: 60,
                    //   width: 60,
                    //   decoration: const BoxDecoration(
                    //       color: ColorRes.logoColor, shape: BoxShape.circle),
                    //   child: Image.asset(
                    //     AssetRes.cloud,
                    //     height: 20,
                    //     width: 20,
                    //   ),
                    // ),
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
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          "Name Of Company",
                          style: appTextStyle(
                            color: ColorRes.black.withOpacity(0.6),
                            fontSize: 14,
                          ),
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
                        contentPadding: const EdgeInsets.all(15),
                        border: InputBorder.none,
                        hintText: "Name Of Company",
                        hintStyle: appTextStyle(
                            fontSize: 14,
                            color: ColorRes.black.withOpacity(0.15))),
                    controller: controller.companyNameController,
                  ),
                  controller.isNameValidate.value == true
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            commonErrorBox("Please Enter Company name"),
                          ],
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          "Company Email",
                          style:
                              appTextStyle(color: ColorRes.grey, fontSize: 14),
                        ),
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
                        contentPadding: const EdgeInsets.all(15),
                        border: InputBorder.none,
                        hintText: "Company Email",
                        hintStyle: appTextStyle(
                            fontSize: 14,
                            color: ColorRes.black.withOpacity(0.15)),
                        suffixIcon: Container(
                          padding: const EdgeInsets.all(15),
                          child: Image(
                            image: const AssetImage(AssetRes.emailLogo),
                            //height: 5,
                            color: ColorRes.black.withOpacity(0.15),
                          ),
                        ),
                      ),
                      controller: controller.companyEmailController),
                  controller.isEmailValidate.value == true
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            commonErrorBox("Please Enter Company Email"),
                          ],
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          "Established date",
                          style:
                              appTextStyle(color: ColorRes.grey, fontSize: 14),
                        ),
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
                          contentPadding: const EdgeInsets.all(15),
                          border: InputBorder.none,
                          hintText: "Established date",
                          hintStyle: appTextStyle(
                              fontSize: 14,
                              color: ColorRes.black.withOpacity(0.15)),
                          suffixIcon: Container(
                            padding: const EdgeInsets.all(15),
                            child: Image(
                              image: const AssetImage(AssetRes.dateIcon),
                              color: ColorRes.black.withOpacity(0.15),
                            ),
                          ),
                        ),
                        controller: controller.dateController),
                  ),
                  controller.isDateValidate.value == true
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            commonErrorBox("Please Enter Date"),
                          ],
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          "Country",
                          style:
                              appTextStyle(color: ColorRes.grey, fontSize: 14),
                        ),
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
                        contentPadding: const EdgeInsets.all(15),
                        border: InputBorder.none,
                        hintText: "Country",
                        hintStyle: appTextStyle(
                          fontSize: 14,
                          color: ColorRes.black.withOpacity(0.15),
                        ),
                        suffixIcon:
                            GetBuilder<OrganizationProfileScreenController>(
                          id: "dropdown",
                          builder: (controller) {
                            return DropdownButton(
                                //value: controller.dropDownValue,
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
                                onChanged: (String? val) {
                                  controller.changeDropdwon(val: val!);
                                });
                          },
                        ),
                      ),
                      controller: controller.countryController),
                  controller.isCountryValidate.value == true
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            commonErrorBox("Please Enter Country"),
                          ],
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          "Company Address",
                          style:
                              appTextStyle(color: ColorRes.grey, fontSize: 14),
                        ),
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
                        contentPadding: const EdgeInsets.all(15),
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
                            commonErrorBox("Please Enter Address"),
                          ],
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 35,
                  ),
                  GetBuilder<OrganizationProfileScreenController>(
                      id: "Organization",
                      builder: (controller) {
                        return (controller.companyNameController.text == '' ||
                                controller.companyEmailController.text == '' ||
                                controller.dateController.text == '' ||
                                controller.countryController.text == '' ||
                                controller.companyAddressController.text == '')
                            ? InkWell(
                                // dashboard write
                                onTap: () => controller.onLoginBtnTap,
                                child: Container(
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
                                ),
                              )
                            : InkWell(
                                // dashboard write
                                onTap: () {
                                  if (kDebugMode) {
                                    print("=a4fyj66enum j");
                                  }
                                  controller.onLoginBtnTap();
                                },
                                // controller.onLoginBtnTap,
                                child: Container(
                                  height: 50,
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
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
