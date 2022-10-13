import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/common/widgets/common_error_box.dart';
import 'package:jobseek/common/widgets/common_textField.dart';
import 'package:jobseek/screen/profile/profile_controller.dart';
import 'package:jobseek/screen/settings/settings_screen.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class ProfileUserScreenU extends StatelessWidget {
  ProfileUserScreenU({Key? key}) : super(key: key);
  final controller = Get.put(ProfileUserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorRes.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
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
              const SizedBox(width: 80),
              Center(
                child: Text(
                  'Profile',
                  style: appTextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      height: 1,
                      color: ColorRes.black),
                ),
              ),
              const SizedBox(
                width: 70,
              ),
              Container(
                margin: const EdgeInsets.all(15),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: ColorRes.logoColor,
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (con) => const SettingsScreenU()));
                  },
                  child: const Icon(
                    Icons.settings,
                    color: ColorRes.containerColor,
                  ),
                ),
              ),
            ]),
            const SizedBox(height: 10),
            SizedBox(
              height: Get.height - 210,
              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(50),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          AssetRes.userprofileLogo))),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 2,
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet<void>(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: 450,
                                        decoration: const BoxDecoration(
                                          color: ColorRes.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(45),
                                            topRight: Radius.circular(45),
                                          ),
                                        ),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              const SizedBox(height: 30),
                                              Text(
                                                'Change Avatar',
                                                style: appTextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: ColorRes.black
                                                        .withOpacity(0.8)),
                                              ),
                                              // const SizedBox(height: 20),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 18,
                                                        vertical: 18),
                                                child: Container(
                                                  height: 120,
                                                  width: Get.width,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: const Color(
                                                          0xffF3ECFF),
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(5),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      InkWell(
                                                        onTap: () =>
                                                            controller.ontap(),
                                                        child: Container(
                                                          height: 70,
                                                          width: 70,
                                                          margin:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      100,
                                                                  vertical: 10),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: ColorRes
                                                                .logoColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        80),
                                                          ),
                                                          child: const Icon(
                                                            Icons.camera_alt,
                                                            size: 40,
                                                            color: ColorRes
                                                                .containerColor,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        "Take photo",
                                                        style: appTextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14,
                                                            color:
                                                                ColorRes.black),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 18),
                                                child: Container(
                                                  height: 120,
                                                  width: Get.width,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: const Color(
                                                          0xffF3ECFF),
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(5),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      InkWell(
                                                        onTap: () => controller
                                                            .ontapGallery(),
                                                        child: Container(
                                                          height: 70,
                                                          width: 70,
                                                          margin:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      100,
                                                                  vertical: 10),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: ColorRes
                                                                .logoColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        80),
                                                          ),
                                                          child: const Image(
                                                            image: AssetImage(
                                                                AssetRes
                                                                    .galleryImage),
                                                            color: ColorRes
                                                                .containerColor,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        "Form gallery",
                                                        style: appTextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14,
                                                            color:
                                                                ColorRes.black),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: const CircleAvatar(
                                  radius: 10,
                                  backgroundColor: ColorRes.containerColor,
                                  child: Icon(
                                    Icons.edit,
                                    size: 10,
                                    color: ColorRes.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Adam Smith',
                              style: appTextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: ColorRes.black),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'adam.smith@yourdomain.com',
                              style: appTextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: ColorRes.black.withOpacity(0.6)),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'UI/UX Designer',
                              style: appTextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: ColorRes.black.withOpacity(0.6)),
                            ),
                          ],
                        ),
                      ],
                    ),
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
                                "Full Name",
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
                                  contentPadding: const EdgeInsets.all(15),
                                  border: InputBorder.none,
                                  hintText: "  Full Name",
                                  hintStyle: appTextStyle(
                                      fontSize: 14,
                                      color: ColorRes.black.withOpacity(0.15))),
                              controller: controller.fullNameController),
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
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Email",
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
                                contentPadding: const EdgeInsets.all(15),
                                border: InputBorder.none,
                                hintText: "  Email",
                                hintStyle: appTextStyle(
                                    fontSize: 14,
                                    color: ColorRes.black.withOpacity(0.15)),
                                suffixIcon: Icon(
                                  Icons.mail_outline_outlined,
                                  color: ColorRes.black.withOpacity(0.20),
                                ),
                              ),
                              controller: controller.emailController),
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
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Date of birth",
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
                          InkWell(
                            onTap: () {
                              controller.onDatePickerTap(context);
                            },
                            child: commonTextFormField(
                                onTap: () =>
                                    controller.onDatePickerTap(context),
                                textDecoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(15),
                                  border: InputBorder.none,
                                  hintText: "  Date of birth",
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
                                controller: controller.dateOfBirthController),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                "Address",
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
                                contentPadding: const EdgeInsets.all(15),
                                hintText: "  Address",
                                hintStyle: appTextStyle(
                                  fontSize: 14,
                                  color: ColorRes.black.withOpacity(0.15),
                                ),
                              ),
                              controller: controller.addressController),
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
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Occupation",
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
                                contentPadding: const EdgeInsets.all(15),
                                hintText: "  Occupation",
                                hintStyle: appTextStyle(
                                  fontSize: 14,
                                  color: ColorRes.black.withOpacity(0.15),
                                ),
                              ),
                              controller: controller.occupationController),
                          controller.isoccupationValidate.value == true
                              ? Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    commonErrorBox("Enter Valid Occupation"),
                                  ],
                                )
                              : const SizedBox(),
                          //   const SizedBox(
                          //     height: 30,
                          // ),
                          const SizedBox(height: 20),
                          const SizedBox(
                            height: 10,
                          ),
                          GetBuilder<ProfileUserController>(
                              id: "Organization",
                              builder: (controller) {
                                return (controller.fullNameController.text ==
                                            '' ||
                                        controller.emailController.text == '' ||
                                        controller.addressController.text ==
                                            '' ||
                                        controller.occupationController.text ==
                                            '' ||
                                        controller.dateOfBirthController.text ==
                                            '')
                                    ? InkWell(
                                        // dashboard write
                                        onTap: controller.onLoginBtnTap1,

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
                                          child: Text("Save Changes",
                                              style: appTextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: ColorRes.white)),
                                        ),
                                      )
                                    : InkWell(
                                        // dashboard write
                                        onTap: controller.onLoginBtnTap1,
                                        child: Container(
                                          height: 50,
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
                                          child: Text("Save Changes",
                                              style: appTextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: ColorRes.white)),
                                        ),
                                      );
                              }),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
