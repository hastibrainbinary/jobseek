import 'package:flutter/foundation.dart';
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
            const SizedBox(width: 80),
            Text(
              'Profile',
              style: appTextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  height: 1,
                  color: ColorRes.black),
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
                          builder: (con) => const SettingScreen()));
                },
                child: const Icon(
                  Icons.settings,
                  color: ColorRes.containerColor,
                ),
              ),
            ),
          ]),
          const SizedBox(height: 15),
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
                            padding: const EdgeInsets.only(right: 10),
                            child: const Image(
                              image: AssetImage(AssetRes.roundAirbnb),
                              height: 110,
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            right: 8,
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
                                      height: 268,
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
                                            const SizedBox(height: 40),
                                            Text(
                                              'Change Logo Company',
                                              style: appTextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: ColorRes.black
                                                      .withOpacity(0.8)),
                                            ),
                                            const SizedBox(height: 20),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(18.0),
                                              child: Container(
                                                height: 140,
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
                                                child: Container(
                                                    height: 50,
                                                    width: 50,
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 100,
                                                        vertical: 10),
                                                    decoration: BoxDecoration(
                                                      color: ColorRes.logoColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              80),
                                                    ),
                                                    child: const Image(
                                                      image: AssetImage(AssetRes
                                                          .galleryaimage),
                                                    )),
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
                          )
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
                              style: appTextStyle(
                                  color: ColorRes.grey, fontSize: 14),
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
                              value: controller.dropDownValue?.value ??
                                  controller.items[0],
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
                                  print('value $val');
                                }
                                controller.dropDownValue?.value =
                                    controller.items as String;
                                controller.update();
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              "Company Address",
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
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
