import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/common/widgets/common_error_box.dart';
import 'package:jobseek/common/widgets/common_textField.dart';
import 'package:jobseek/screen/manager_section/Profile/profile_controller.dart';
import 'package:jobseek/screen/manager_section/Settings/settings_screen.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorRes.backgroungColor,
      body: Column(
        children: [
          const SizedBox(height: 60),
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
            const SizedBox(width: 50),
            Center(
              child: Text(
                'Edit Profile',
                style: appTextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    height: 1,
                    color: ColorRes.black),
              ),
            ),
            const SizedBox(
              width: 60,
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
                      builder: (con) => const SettingScreen(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.settings,
                  color: ColorRes.containerColor,
                ),
              ),
            ),
          ]),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: (controller.image == null)
                                    ? const DecorationImage(
                                        image: AssetImage(
                                          AssetRes.roundAirbnb,
                                        ),
                                        fit: BoxFit.fill)
                                    : DecorationImage(
                                        image: FileImage(
                                          controller.image!,
                                        ),
                                        fit: BoxFit.fill)),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 10,
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
                                              'Change Logo Company',
                                              style: appTextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: ColorRes.black
                                                      .withOpacity(0.8)),
                                            ),
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
                                                    color:
                                                        const Color(0xffF3ECFF),
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
                                                        margin: const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 100,
                                                            vertical: 10),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: ColorRes
                                                              .logoColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(80),
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
                                                    color:
                                                        const Color(0xffF3ECFF),
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
                                                          .ontapGallery1(),
                                                      child: Container(
                                                        height: 70,
                                                        width: 70,
                                                        margin: const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 100,
                                                            vertical: 10),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: ColorRes
                                                              .logoColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(80),
                                                        ),
                                                        child: const Image(
                                                          image: AssetImage(
                                                              AssetRes
                                                                  .galleryaimage),
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
                                radius: 7.5,
                                backgroundColor: ColorRes.containerColor,
                                child: Icon(
                                  Icons.edit,
                                  size: 8,
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
                            'AirBNB',
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
                            'United States',
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
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("user")
                          .where('userid', isEqualTo: "aaaaaa")
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return const Text(
                            'No Data...',
                          );
                        } else {
                          // final List<QueryDocumentSnapshot<Object?>> docs = snapshot.data!.docs;
                          return snapshot.hasData
                              ? Obx(
                                  () => Column(children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Text(
                                            "Name Of Company",
                                            style: appTextStyle(
                                              color: ColorRes.black
                                                  .withOpacity(0.6),
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
                                            hintText: snapshot.data?.docs[0]
                                                ["name"],
                                            hintStyle: appTextStyle(
                                                fontSize: 14,
                                                color: ColorRes.black
                                                    .withOpacity(0.15))),
                                        controller:
                                            controller.companyNameController),
                                    controller.isNameValidate.value == true
                                        ? Column(
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              commonErrorBox(
                                                  "Please Enter Company name"),
                                            ],
                                          )
                                        : const SizedBox(),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Text(
                                            "Company Email",
                                            style: appTextStyle(
                                                color: ColorRes.grey,
                                                fontSize: 14),
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
                                          contentPadding:
                                              const EdgeInsets.all(15),
                                          border: InputBorder.none,
                                          hintText: snapshot.data?.docs[0]
                                              ["email"],
                                          hintStyle: appTextStyle(
                                              fontSize: 14,
                                              color: ColorRes.black
                                                  .withOpacity(0.15)),
                                          suffixIcon: Container(
                                            padding: const EdgeInsets.all(15),
                                            child: Image(
                                              image: const AssetImage(
                                                  AssetRes.emailLogo),
                                              //height: 5,
                                              color: ColorRes.black
                                                  .withOpacity(0.15),
                                            ),
                                          ),
                                        ),
                                        controller:
                                            controller.companyEmailController),
                                    controller.isEmailValidate.value == true
                                        ? Column(
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              commonErrorBox(
                                                  "Please Enter Company Email"),
                                            ],
                                          )
                                        : const SizedBox(),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Text(
                                            "Established date",
                                            style: appTextStyle(
                                                color: ColorRes.grey,
                                                fontSize: 14),
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
                                    InkWell(
                                      onTap: () {
                                        controller.onDatePickerTap(context);
                                      },
                                      child: commonTextFormField(
                                          onTap: () => controller
                                              .onDatePickerTap(context),
                                          textDecoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.all(15),
                                            border: InputBorder.none,
                                            hintText: snapshot.data?.docs[0]
                                                ["date"],
                                            hintStyle: appTextStyle(
                                                fontSize: 14,
                                                color: ColorRes.black
                                                    .withOpacity(0.15)),
                                            suffixIcon: Container(
                                              padding: const EdgeInsets.all(15),
                                              child: Image(
                                                image: const AssetImage(
                                                    AssetRes.dateIcon),
                                                color: ColorRes.black
                                                    .withOpacity(0.15),
                                              ),
                                            ),
                                          ),
                                          controller:
                                              controller.dateController),
                                    ),
                                    controller.isDateController.value == true
                                        ? Column(
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              commonErrorBox(
                                                  "Please Enter Date"),
                                            ],
                                          )
                                        : const SizedBox(),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Text(
                                            "Country",
                                            style: appTextStyle(
                                                color: ColorRes.grey,
                                                fontSize: 14),
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
                                          contentPadding:
                                              const EdgeInsets.all(15),
                                          border: InputBorder.none,
                                          hintText: snapshot.data?.docs[0]
                                              ["country"],
                                          hintStyle: appTextStyle(
                                            fontSize: 14,
                                            color: ColorRes.black
                                                .withOpacity(0.15),
                                          ),
                                          suffixIcon: Container(
                                            padding: const EdgeInsets.all(20),
                                            child: Image(
                                              color: ColorRes.black
                                                  .withOpacity(0.20),
                                              image: const AssetImage(
                                                AssetRes.dropIcon,
                                              ),
                                              height: 5,
                                            ),
                                          ),
                                        ),
                                        controller:
                                            controller.countryController),
                                    controller.isCountryValidate.value == true
                                        ? Column(
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              commonErrorBox(
                                                  "Please Enter Country"),
                                            ],
                                          )
                                        : const SizedBox(),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Text(
                                            "Company Address",
                                            style: appTextStyle(
                                                color: ColorRes.grey,
                                                fontSize: 14),
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
                                          contentPadding:
                                              const EdgeInsets.all(15),
                                          border: InputBorder.none,
                                          hintText: snapshot.data?.docs[0]
                                              ["address"],
                                          hintStyle: appTextStyle(
                                            fontSize: 14,
                                            color: ColorRes.black
                                                .withOpacity(0.15),
                                          ),
                                        ),
                                        controller: controller
                                            .companyAddressController),
                                    controller.isAddressValidate.value == true
                                        ? Column(
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              commonErrorBox(
                                                  "Please Enter Address"),
                                            ],
                                          )
                                        : const SizedBox(),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    GetBuilder<ProfileController>(
                                        id: "Organization",
                                        builder: (controller) {
                                          return (controller.companyNameController.text == '' ||
                                                  controller
                                                          .companyEmailController
                                                          .text ==
                                                      '' ||
                                                  controller.dateController
                                                          .text ==
                                                      '' ||
                                                  controller.countryController
                                                          .text ==
                                                      '' ||
                                                  controller
                                                          .companyAddressController
                                                          .text ==
                                                      '')
                                              ? InkWell(
                                                  // dashboard write
                                                  onTap:
                                                      controller.onLoginBtnTap1,
                                                  child: Container(
                                                    height: 50,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          ColorRes.gradientColor
                                                              .withOpacity(0.2),
                                                          ColorRes
                                                              .containerColor
                                                              .withOpacity(0.4)
                                                        ],
                                                      ),
                                                    ),
                                                    child: Text("Save Changes",
                                                        style: appTextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: ColorRes
                                                                .white)),
                                                  ),
                                                )
                                              : InkWell(
                                                  // dashboard write
                                                  onTap:
                                                      controller.onLoginBtnTap1,
                                                  child: Container(
                                                    height: 50,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      gradient:
                                                          const LinearGradient(
                                                              colors: [
                                                            ColorRes
                                                                .gradientColor,
                                                            ColorRes
                                                                .containerColor
                                                          ]),
                                                    ),
                                                    child: Text("Save Changes",
                                                        style: appTextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: ColorRes
                                                                .white)),
                                                  ),
                                                );
                                        }),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ]),
                                )
                              : const Center(
                                  child: CircularProgressIndicator(
                                    color: ColorRes.containerColor,
                                  ),
                                );
                        }
                      }),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
