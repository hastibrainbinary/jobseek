import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/auth/sign_up/widget/signup_bottom/country.dart';
import 'package:jobseek/screen/see_details/see_details_controller.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class SeeDetailsScreen extends StatelessWidget {
  const SeeDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;
    final controller = Get.put(SeeDetailsController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorRes.backgroundColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "See Details",
                  style: appTextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: ColorRes.black),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(
                        image: AssetImage(AssetRes.detailsImage),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    height: 60,
                    width: Get.width - 152,
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xffE9DDFF),
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                      border: Border.all(color: ColorRes.borderColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            AssetRes.seePdf,
                            height: 40,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width * 0.3,
                              child: Text(
                                  controller.filepath
                                      .value /*"Resume - Adam Smith.pdf"*/,
                                  style: appTextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: ColorRes.black)),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 1),
                                  child: Text(
                                    "Get started.pdf",
                                    style: appTextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: ColorRes.black),
                                  ),
                                ),
                                const SizedBox(width: 50),
                                Container(
                                  height: 16,
                                  width: 16,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      border:
                                          Border.all(color: ColorRes.black)),
                                  child: const Icon(
                                    Icons.arrow_downward,
                                    size: 10,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("13/06/2022",
                                    style: appTextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            ColorRes.black.withOpacity(0.6))),
                                const SizedBox(width: 10),
                                Text(
                                  "9:58",
                                  style: appTextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 8,
                                      color: ColorRes.black.withOpacity(0.6)),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  "258.4 KB",
                                  style: appTextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 8,
                                      color: ColorRes.black.withOpacity(0.6)),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).viewInsets.bottom > 0
                    ? Get.height * 0.4
                    : Get.height * 0.65,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          " Name",
                          style: appTextStyle(
                            color: ColorRes.black.withOpacity(0.6),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 51,
                        width: 339,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: ColorRes.containerColor)),
                        child: Text(
                          args['fullName'],
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      // const SizedBox(height: 10),
                      // commonTextFormField(
                      //   controller: controller.nameController,
                      //   color: ColorRes.containerColor,
                      //   textDecoration: const InputDecoration(
                      //       hintText: 'Viral Savaliya',
                      //       hintStyle: TextStyle(color: Colors.black),
                      //       contentPadding: EdgeInsets.all(15),
                      //       border: InputBorder.none),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          " Email",
                          style: appTextStyle(
                            color: ColorRes.black.withOpacity(0.6),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 51,
                        width: 339,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: ColorRes.containerColor)),
                        child: Text(
                          args['Email'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      // commonTextFormField(
                      //   controller: controller.emailController,
                      //   color: ColorRes.containerColor,
                      //   textDecoration: const InputDecoration(
                      //       hintText: 'example@yourdomain.com',
                      //       hintStyle: TextStyle(color: Colors.black),
                      //       contentPadding: EdgeInsets.all(15),
                      //       border: InputBorder.none),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "Phone Number",
                          style: appTextStyle(
                            color: ColorRes.black.withOpacity(0.6),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 51,
                        width: 339,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: ColorRes.containerColor)),
                        child: Text(
                          args['Phone'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      // Container(
                      //   height: 50,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(12),
                      //     border: Border.all(color: ColorRes.containerColor),
                      //   ),
                      //   child: Row(
                      //     children: [
                      //       countryCodePicker(context, padding: 4),
                      //       // SizedBox(
                      //       //   width: Get.width / 2,
                      //       //   child: TextFormField(
                      //       //     // keyboardType: TextInputType.number,
                      //       //     // controller: controller.phoneNumberController,
                      //       //     decoration: InputDecoration(
                      //       //         // hintText: '99135 01269',
                      //       //         fillColor: Colors.transparent,
                      //       //         filled: true,
                      //       //         hintStyle: appTextStyle(
                      //       //             fontSize: 15,
                      //       //             fontWeight: FontWeight.w600,
                      //       //             color: ColorRes.black),
                      //       //         border: InputBorder.none),
                      //       //   ),
                      //       // ),
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          " city",
                          style: appTextStyle(
                            color: ColorRes.black.withOpacity(0.6),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 51,
                        width: 339,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: ColorRes.containerColor)),
                        child: Text(
                          args['City'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      // commonTextFormField(
                      //   controller: controller.cityController,
                      //   color: ColorRes.containerColor,
                      //   textDecoration: const InputDecoration(
                      //       hintText: 'Surat',
                      //       hintStyle: TextStyle(color: Colors.black),
                      //       contentPadding: EdgeInsets.all(15),
                      //       border: InputBorder.none),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "State",
                          style: appTextStyle(
                            color: ColorRes.black.withOpacity(0.6),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 51,
                        width: 339,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: ColorRes.containerColor)),
                        child: Text(
                          args['State'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      // commonTextFormField(
                      //   controller: controller.stateController,
                      //   color: ColorRes.containerColor,
                      //   textDecoration: const InputDecoration(
                      //       hintText: 'Gujarat',
                      //       hintStyle: TextStyle(color: ColorRes.black),
                      //       contentPadding: EdgeInsets.all(15),
                      //       border: InputBorder.none),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "Country",
                          style: appTextStyle(
                            color: ColorRes.black.withOpacity(0.6),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 51,
                        width: 339,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: ColorRes.containerColor)),
                        child: Text(
                          args['Country'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      // commonTextFormField(
                      //   controller: controller.countryController,
                      //   color: ColorRes.containerColor,
                      //   textDecoration: const InputDecoration(
                      //       hintText: 'India',
                      //       hintStyle: TextStyle(color: ColorRes.black),
                      //       contentPadding: EdgeInsets.all(15),
                      //       border: InputBorder.none),
                      // ),
                      const SizedBox(height: 25),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 50,
                          width: Get.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: const LinearGradient(colors: [
                                Color(0xFFBF9EFF),
                                Color(0xFF8B4EFF),
                              ])),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Back",
                                  style: appTextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).viewInsets.bottom > 0
                    ? Get.height * 0.4
                    : Get.height * 0.65,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          " Name",
                          style: appTextStyle(
                            color: ColorRes.black.withOpacity(0.6),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 51,
                        width: 339,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: ColorRes.containerColor)),
                      ),
                      // const SizedBox(height: 10),
                      // commonTextFormField(
                      //   controller: controller.nameController,
                      //   color: ColorRes.containerColor,
                      //   textDecoration: const InputDecoration(
                      //       hintText: 'Viral Savaliya',
                      //       hintStyle: TextStyle(color: Colors.black),
                      //       contentPadding: EdgeInsets.all(15),
                      //       border: InputBorder.none),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          " Email",
                          style: appTextStyle(
                            color: ColorRes.black.withOpacity(0.6),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 51,
                        width: 339,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: ColorRes.containerColor)),
                      ),
                      // commonTextFormField(
                      //   controller: controller.emailController,
                      //   color: ColorRes.containerColor,
                      //   textDecoration: const InputDecoration(
                      //       hintText: 'example@yourdomain.com',
                      //       hintStyle: TextStyle(color: Colors.black),
                      //       contentPadding: EdgeInsets.all(15),
                      //       border: InputBorder.none),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "Phone Number",
                          style: appTextStyle(
                            color: ColorRes.black.withOpacity(0.6),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: ColorRes.containerColor),
                        ),
                        child: Row(
                          children: [
                            countryCodePicker(context, padding: 4),
                            // SizedBox(
                            //   width: Get.width / 2,
                            //   child: TextFormField(
                            //     // keyboardType: TextInputType.number,
                            //     // controller: controller.phoneNumberController,
                            //     decoration: InputDecoration(
                            //         // hintText: '99135 01269',
                            //         fillColor: Colors.transparent,
                            //         filled: true,
                            //         hintStyle: appTextStyle(
                            //             fontSize: 15,
                            //             fontWeight: FontWeight.w600,
                            //             color: ColorRes.black),
                            //         border: InputBorder.none),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          " city",
                          style: appTextStyle(
                            color: ColorRes.black.withOpacity(0.6),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 51,
                        width: 339,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: ColorRes.containerColor)),
                      ),
                      // commonTextFormField(
                      //   controller: controller.cityController,
                      //   color: ColorRes.containerColor,
                      //   textDecoration: const InputDecoration(
                      //       hintText: 'Surat',
                      //       hintStyle: TextStyle(color: Colors.black),
                      //       contentPadding: EdgeInsets.all(15),
                      //       border: InputBorder.none),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "State",
                          style: appTextStyle(
                            color: ColorRes.black.withOpacity(0.6),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 51,
                        width: 339,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: ColorRes.containerColor)),
                      ),
                      // commonTextFormField(
                      //   controller: controller.stateController,
                      //   color: ColorRes.containerColor,
                      //   textDecoration: const InputDecoration(
                      //       hintText: 'Gujarat',
                      //       hintStyle: TextStyle(color: ColorRes.black),
                      //       contentPadding: EdgeInsets.all(15),
                      //       border: InputBorder.none),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "Country",
                          style: appTextStyle(
                            color: ColorRes.black.withOpacity(0.6),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 51,
                        width: 339,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: ColorRes.containerColor)),
                      ),
                      // commonTextFormField(
                      //   controller: controller.countryController,
                      //   color: ColorRes.containerColor,
                      //   textDecoration: const InputDecoration(
                      //       hintText: 'India',
                      //       hintStyle: TextStyle(color: ColorRes.black),
                      //       contentPadding: EdgeInsets.all(15),
                      //       border: InputBorder.none),
                      // ),
                      const SizedBox(height: 25),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 50,
                          width: Get.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: const LinearGradient(colors: [
                                Color(0xFFBF9EFF),
                                Color(0xFF8B4EFF),
                              ])),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Back",
                                  style: appTextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
