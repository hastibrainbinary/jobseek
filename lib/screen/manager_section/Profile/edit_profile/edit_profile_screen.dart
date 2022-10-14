import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/common/widgets/common_error_box.dart';
import 'package:jobseek/common/widgets/common_textField.dart';
import 'package:jobseek/screen/manager_section/Profile/edit_profile/edit_profile_controller.dart';
import 'package:jobseek/screen/manager_section/Profile/profile_controller.dart';
import 'package:jobseek/screen/manager_section/Settings/settings_screen.dart';
import 'package:jobseek/service/pref_services.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';
import 'package:jobseek/utils/pref_keys.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  final controller = Get.put(EditProfileController());
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorRes.backgroundColor,
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
                      builder: (con) => const SettingScreenM(),
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
                  child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                      stream: fireStore
                          .collection("Auth")
                          .doc("Manager")
                          .collection("register")
                          .doc(PrefService.getString(PrefKeys.userId))
                          .collection("company")
                          .doc("details")
                          .snapshots(),
                      builder: (context,
                          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                              snapshot) {
                        if (kDebugMode) {
                          print(snapshot.data);
                        }
                        controller.companyNameController.text =
                            snapshot.data?["name"] ?? "-";
                        controller.companyEmailController.text =
                            snapshot.data?["email"] ?? "-";
                        controller.dateController.text =
                            snapshot.data?["date"] ?? "-";
                        controller.countryController.text =
                            snapshot.data?["country"] ?? "-";
                        controller.companyAddressController.text =
                            snapshot.data?["address"] ?? "-";
                        if (snapshot.hasError) {
                          return const Text(
                            'No Data...',
                          );
                        } else {
                          return snapshot.hasData
                              ? Obx(
                                  () => Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
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
                                              color: ColorRes.starColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    commonTextFormField(
                                        textDecoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.all(15),
                                          border: InputBorder.none,
                                          hintText: "name of company",
                                          hintStyle: appTextStyle(
                                            fontSize: 14,
                                            color: ColorRes.black
                                                .withOpacity(0.15),
                                          ),
                                        ),
                                        readOnly: true,
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
                                          hintText: "Company Email",
                                          hintStyle: appTextStyle(
                                              fontSize: 14,
                                              color: ColorRes.black
                                                  .withOpacity(0.15)),
                                          suffixIcon: Container(
                                            padding: const EdgeInsets.all(16),
                                            child: Image(
                                              image: const AssetImage(
                                                  AssetRes.emailLogo),
                                              color: ColorRes.black
                                                  .withOpacity(0.15),
                                            ),
                                          ),
                                        ),
                                        readOnly: true,
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
                                            hintText: "Date",
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
                                          readOnly: true,
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
                                          hintText: "Country",
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
                                        readOnly: true,
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
                                          hintText: "Address",
                                          hintStyle: appTextStyle(
                                            fontSize: 14,
                                            color: ColorRes.black
                                                .withOpacity(0.15),
                                          ),
                                        ),
                                        readOnly: true,
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
                                                    child: Text("Edit",
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
                                                  onTap: controller.onTapEdit,
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
                                                    child: Text("Edit",
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
                              : Center(
                                  child: Container(
                                    padding: const EdgeInsets.all(35),
                                    height: 110,
                                    width: 110,
                                    decoration: BoxDecoration(
                                        color: ColorRes.white,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: const CircularProgressIndicator(
                                      backgroundColor: Color(0xffE2D3FE),
                                      color: ColorRes.containerColor,
                                    ),
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
