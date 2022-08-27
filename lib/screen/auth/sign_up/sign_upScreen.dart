import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobseek/screen/auth/Forgot_Password/ForgotPassword_Screen.dart';
import 'package:jobseek/screen/auth/sign_up/sign_upController.dart';
import 'package:jobseek/screen/auth/sign_up/widget/signup_bottom/country.dart';
import 'package:jobseek/screen/sign_inScreen/Signin_Screen.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class sign_upScreen extends StatelessWidget {
  sign_upScreen({Key? key}) : super(key: key);

  SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.white,
        body: Obx(() {
          return Stack(
            children: [
              SingleChildScrollView(
                  child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Container(
                          alignment: Alignment.center,
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: ColorRes.logoColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text('Logo',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: ColorRes.containerColor)),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.0221),
                      Center(
                        child: Text(
                          'Sign up for free',
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: ColorRes.black),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.0221),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 10),
                        child: Row(
                          children: [
                            Text('First Name',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: ColorRes.black.withOpacity(0.6))),
                            const Text(
                              '*',
                              style: TextStyle(
                                  fontSize: 15, color: ColorRes.starColor),
                            ),
                          ],
                        ),
                      ),
                      GetBuilder<SignUpController>(
                        id: "showFirstname",
                        builder: (controller) => Column(
                          children: [
                            Container(
                              height: 51,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(6, 6),
                                      color: ColorRes.containerColor
                                          .withOpacity(0.10),
                                      spreadRadius: 0,
                                      blurRadius: 35),
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Material(
                                shadowColor: ColorRes.containerColor,
                                borderRadius: BorderRadius.circular(12),
                                child: TextFormField(
                                  controller: controller.firstnameController,
                                  decoration: InputDecoration(
                                    hintText: 'First Name',
                                    fillColor: ColorRes.white,
                                    filled: true,
                                    hintStyle: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            ColorRes.black.withOpacity(0.15)),
                                    border: controller.firstnameController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.firstError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    focusedBorder: controller
                                            .firstnameController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.firstError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    disabledBorder: controller
                                            .firstnameController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.firstError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    enabledBorder: controller
                                            .firstnameController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.firstError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    errorBorder: controller
                                            .firstnameController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.firstError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    focusedErrorBorder: controller
                                            .firstnameController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.firstError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                  ),
                                ),
                              ),
                            ),
                            controller.firstError == ""
                                ? const SizedBox(height: 20)
                                : Container(
                                    margin: const EdgeInsets.all(10),
                                    width: 339,
                                    height: 28,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: ColorRes.invalidColor),
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Image(
                                            image: AssetImage(
                                              AssetRes.invalid,
                                            ),
                                            height: 14,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(controller.firstError,
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 9,
                                                  color: ColorRes.starColor))
                                        ]),
                                  ),
                          ],
                        ),
                      ),
                      SizedBox(height: Get.height * 0.0005),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 10),
                        child: Row(
                          children: [
                            Text('Last Name',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: ColorRes.black.withOpacity(0.6))),
                            const Text(
                              '*',
                              style: TextStyle(
                                  fontSize: 15, color: ColorRes.starColor),
                            ),
                          ],
                        ),
                      ),
                      GetBuilder<SignUpController>(
                        id: "showLastname",
                        builder: (controller) => Column(
                          children: [
                            Container(
                              height: 51,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(6, 6),
                                      color: ColorRes.containerColor
                                          .withOpacity(0.10),
                                      spreadRadius: 0,
                                      blurRadius: 35),
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Material(
                                shadowColor: ColorRes.containerColor,
                                borderRadius: BorderRadius.circular(12),
                                child: TextFormField(
                                  controller: controller.lastnameController,
                                  decoration: InputDecoration(
                                    hintText: 'Last Name',
                                    fillColor: ColorRes.white,
                                    filled: true,
                                    hintStyle: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            ColorRes.black.withOpacity(0.15)),
                                    border: controller.lastnameController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.lastError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    focusedBorder: controller
                                            .lastnameController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.lastError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    disabledBorder: controller
                                            .lastnameController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.lastError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    enabledBorder: controller
                                            .lastnameController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.lastError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    errorBorder: controller
                                            .lastnameController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.lastError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    focusedErrorBorder: controller
                                            .lastnameController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.lastError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                  ),
                                ),
                              ),
                            ),
                            controller.lastError == ""
                                ? const SizedBox(height: 20)
                                : Container(
                                    margin: const EdgeInsets.all(10),
                                    width: 339,
                                    height: 28,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: ColorRes.invalidColor),
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Image(
                                            image: AssetImage(
                                              AssetRes.invalid,
                                            ),
                                            height: 14,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(controller.lastError,
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 9,
                                                  color: ColorRes.starColor))
                                        ]),
                                  ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 10),
                        child: Row(
                          children: [
                            Text('Email',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: ColorRes.black.withOpacity(0.6))),
                            const Text(
                              '*',
                              style: TextStyle(
                                  fontSize: 15, color: ColorRes.starColor),
                            ),
                          ],
                        ),
                      ),
                      GetBuilder<SignUpController>(
                        id: "showEmail",
                        builder: (controller) => Column(
                          children: [
                            Container(
                              height: 51,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(6, 6),
                                      color: ColorRes.containerColor
                                          .withOpacity(0.10),
                                      spreadRadius: 0,
                                      blurRadius: 35),
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Material(
                                shadowColor: ColorRes.containerColor,
                                borderRadius: BorderRadius.circular(12),
                                child: TextFormField(
                                  controller: controller.emailController,
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    fillColor: ColorRes.white,
                                    filled: true,
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: ColorRes.black.withOpacity(0.15),
                                    ),
                                    border: controller.emailController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.emailError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    focusedBorder: controller
                                            .emailController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.emailError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    disabledBorder: controller
                                            .emailController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.emailError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    enabledBorder: controller
                                            .emailController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.emailError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    errorBorder: controller.emailController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.emailError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    focusedErrorBorder: controller
                                            .emailController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.emailError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                  ),
                                ),
                              ),
                            ),
                            controller.emailError == ""
                                ? const SizedBox(height: 20)
                                : Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 28,
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: ColorRes.invalidColor),
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Image(
                                            image: AssetImage(
                                              AssetRes.invalid,
                                            ),
                                            height: 14,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(controller.emailError,
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 9,
                                                  color: ColorRes.starColor))
                                        ]),
                                  ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 10),
                        child: Row(
                          children: [
                            Text('Phone number',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: ColorRes.black.withOpacity(0.6))),
                            const Text(
                              '*',
                              style: TextStyle(
                                  fontSize: 15, color: ColorRes.starColor),
                            ),
                          ],
                        ),
                      ),
                      GetBuilder<SignUpController>(
                        id: "showPhoneNumber",
                        builder: (controller) => Column(
                          children: [
                            Container(
                              width: Get.width,
                              height: 51,
                              decoration: BoxDecoration(
                                color: ColorRes.white,
                                border: Border.all(
                                    color: controller.phoneController.text
                                            .trim()
                                            .isEmpty
                                        ? Colors.transparent
                                        : controller.phoneError == ""
                                            ? ColorRes.containerColor
                                            : ColorRes.starColor),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(6, 6),
                                      color: ColorRes.containerColor
                                          .withOpacity(0.10),
                                      spreadRadius: 0,
                                      blurRadius: 35),
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  countryCodePicker(context),
                                  SizedBox(
                                    width: Get.width / 2,
                                    child: Material(
                                      shadowColor: ColorRes.containerColor,
                                      borderRadius: BorderRadius.circular(12),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: controller.phoneController,
                                        decoration: InputDecoration(
                                            // prefix:countryCodePicker(context) ,
                                            hintText: 'Phone number',
                                            fillColor: ColorRes.white,
                                            filled: true,
                                            hintStyle: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: ColorRes.black
                                                    .withOpacity(0.15)),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            controller.phoneError == ""
                                ? SizedBox(height: Get.height * 0.0197)
                                : Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 28,
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: ColorRes.invalidColor),
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Image(
                                            image: AssetImage(
                                              AssetRes.invalid,
                                            ),
                                            height: 14,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            controller.phoneError,
                                            style: GoogleFonts.poppins(
                                                fontSize: 9,
                                                fontWeight: FontWeight.w400,
                                                color: ColorRes.starColor),
                                          )
                                        ]),
                                  ),
                            // Text(controller.phoneError)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 10),
                        child: Row(
                          children: [
                            Text('Password',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: ColorRes.black.withOpacity(0.6))),
                            const Text(
                              '*',
                              style: TextStyle(
                                  fontSize: 15, color: ColorRes.starColor),
                            ),
                          ],
                        ),
                      ),
                      GetBuilder<SignUpController>(
                        id: "showPassword",
                        builder: (controller) => Column(
                          children: [
                            Container(
                              height: 51,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(6, 6),
                                      color: ColorRes.containerColor
                                          .withOpacity(0.10),
                                      spreadRadius: 0,
                                      blurRadius: 35),
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Material(
                                shadowColor: ColorRes.containerColor,
                                borderRadius: BorderRadius.circular(12),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: controller.passwordController,
                                  obscureText: controller.show,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    fillColor: ColorRes.white,
                                    suffixIcon: IconButton(
                                      icon: controller.show
                                          ? Icon(
                                              Icons.visibility_off,
                                              color: ColorRes.black
                                                  .withOpacity(0.15),
                                            )
                                          : Icon(Icons.visibility,
                                              color: ColorRes.black
                                                  .withOpacity(0.15)),
                                      onPressed: controller.chang,
                                    ),
                                    filled: true,
                                    hintStyle: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color:
                                            ColorRes.black.withOpacity(0.15)),
                                    border: controller.passwordController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.pwdError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    focusedBorder: controller
                                            .passwordController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.pwdError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    disabledBorder: controller
                                            .passwordController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.pwdError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    enabledBorder: controller
                                            .passwordController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.pwdError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    errorBorder: controller
                                            .passwordController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.pwdError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    focusedErrorBorder: controller
                                            .passwordController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.pwdError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                  ),
                                ),
                              ),
                            ),
                            controller.pwdError == ""
                                ? const SizedBox(height: 20)
                                : Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 28,
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: ColorRes.invalidColor),
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Image(
                                            image: AssetImage(
                                              AssetRes.invalid,
                                            ),
                                            height: 14,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            controller.pwdError,
                                            style: GoogleFonts.poppins(
                                                fontSize: 9,
                                                fontWeight: FontWeight.w400,
                                                color: ColorRes.starColor),
                                          )
                                        ]),
                                  )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 10),
                        child: Row(
                          children: [
                            Text('City',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: ColorRes.black.withOpacity(0.6))),
                            const Text(
                              '*',
                              style: TextStyle(
                                  fontSize: 15, color: ColorRes.starColor),
                            ),
                          ],
                        ),
                      ),
                      GetBuilder<SignUpController>(
                        id: "showCity",
                        builder: (controller) => Column(
                          children: [
                            Container(
                              height: 51,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(6, 6),
                                      color: ColorRes.containerColor
                                          .withOpacity(0.10),
                                      spreadRadius: 0,
                                      blurRadius: 35),
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Material(
                                shadowColor: Colors.purple.shade700,
                                borderRadius: BorderRadius.circular(12),
                                child: TextFormField(
                                  controller: controller.cityController,
                                  decoration: InputDecoration(
                                    hintText: 'City',
                                    fillColor: ColorRes.white,
                                    filled: true,
                                    hintStyle: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            ColorRes.black.withOpacity(0.15)),
                                    border: controller.cityController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.cityError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    focusedBorder: controller
                                            .cityController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.cityError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    disabledBorder: controller
                                            .cityController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.cityError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    enabledBorder: controller
                                            .cityController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.cityError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    errorBorder: controller.cityController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.cityError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    focusedErrorBorder: controller
                                            .cityController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.cityError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                  ),
                                ),
                              ),
                            ),
                            controller.cityError == ""
                                ? const SizedBox(height: 20)
                                : Container(
                                    margin: const EdgeInsets.all(10),
                                    width: 339,
                                    height: 28,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: ColorRes.invalidColor),
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Image(
                                            image: AssetImage(
                                              AssetRes.invalid,
                                            ),
                                            height: 14,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(controller.cityError,
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 9,
                                                  color: ColorRes.starColor))
                                        ]),
                                  ),
                          ],
                        ),
                      ),
                      // SizedBox(height: Get.height * 0.0197),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 10),
                        child: Row(
                          children: [
                            Text('State',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: ColorRes.black.withOpacity(0.6))),
                            const Text(
                              '*',
                              style: TextStyle(
                                  fontSize: 15, color: ColorRes.starColor),
                            ),
                          ],
                        ),
                      ),
                      GetBuilder<SignUpController>(
                        id: "showState",
                        builder: (controller) => Column(
                          children: [
                            Container(
                              height: 51,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(6, 6),
                                      color: ColorRes.containerColor
                                          .withOpacity(0.10),
                                      spreadRadius: 0,
                                      blurRadius: 35),
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Material(
                                shadowColor: Colors.purple.shade700,
                                borderRadius: BorderRadius.circular(12),
                                child: TextFormField(
                                  controller: controller.stateController,
                                  decoration: InputDecoration(
                                    hintText: 'State',
                                    fillColor: ColorRes.white,
                                    filled: true,
                                    hintStyle: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            ColorRes.black.withOpacity(0.15)),
                                    border: controller.stateController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.stateError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    focusedBorder: controller
                                            .stateController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.stateError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    disabledBorder: controller
                                            .stateController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.stateError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    enabledBorder: controller
                                            .stateController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.stateError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    errorBorder: controller.stateController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.stateError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    focusedErrorBorder: controller
                                            .stateController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.stateError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                  ),
                                ),
                              ),
                            ),
                            controller.stateError == ""
                                ? const SizedBox(height: 20)
                                : Container(
                                    margin: const EdgeInsets.all(10),
                                    width: 339,
                                    height: 28,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: ColorRes.invalidColor),
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Image(
                                            image: AssetImage(
                                              AssetRes.invalid,
                                            ),
                                            height: 14,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(controller.stateError,
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 9,
                                                  color: ColorRes.starColor))
                                        ]),
                                  ),
                          ],
                        ),
                      ),
                      // SizedBox(height: Get.height * 0.0197),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 10),
                        child: Row(
                          children: [
                            Text('Country',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: ColorRes.black.withOpacity(0.6))),
                            const Text(
                              '*',
                              style: TextStyle(
                                  fontSize: 15, color: ColorRes.starColor),
                            ),
                          ],
                        ),
                      ),
                      GetBuilder<SignUpController>(
                        id: "showCountry",
                        builder: (controller) => Column(
                          children: [
                            Container(
                              height: 51,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(6, 6),
                                      color: ColorRes.containerColor
                                          .withOpacity(0.10),
                                      spreadRadius: 0,
                                      blurRadius: 35),
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Material(
                                shadowColor: ColorRes.containerColor,
                                borderRadius: BorderRadius.circular(12),
                                child: TextFormField(
                                  controller: controller.countryController,
                                  decoration: InputDecoration(
                                    hintText: 'Country',
                                    fillColor: ColorRes.white,
                                    filled: true,
                                    hintStyle: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            ColorRes.black.withOpacity(0.15)),
                                    border: controller.countryController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.countryError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    focusedBorder: controller
                                            .countryController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.countryError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    disabledBorder: controller
                                            .countryController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.countryError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    enabledBorder: controller
                                            .countryController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.countryError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    errorBorder: controller
                                            .countryController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.countryError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                    focusedErrorBorder: controller
                                            .countryController.text
                                            .trim()
                                            .isEmpty
                                        ? InputBorder.none
                                        : controller.countryError.isNotEmpty
                                            ? errorBorder()
                                            : enableBorder(),
                                  ),
                                ),
                              ),
                            ),
                            controller.countryError == ""
                                ? const SizedBox(height: 20)
                                : Container(
                                    margin: const EdgeInsets.all(10),
                                    width: 339,
                                    height: 28,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: ColorRes.invalidColor),
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Image(
                                            image: AssetImage(
                                              AssetRes.invalid,
                                            ),
                                            height: 14,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(controller.countryError,
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 9,
                                                  color: ColorRes.starColor))
                                        ]),
                                  ),
                          ],
                        ),
                      ),
                      SizedBox(height: Get.height * 0.01),
                      Row(
                        children: [
                          GetBuilder<SignUpController>(
                              id: "remember_me",
                              builder: (controller) {
                                return Checkbox(
                                  activeColor: ColorRes.containerColor,
                                  checkColor: ColorRes.white,
                                  side: const BorderSide(
                                      width: 1, color: ColorRes.containerColor),
                                  value: controller.rememberMe,
                                  onChanged: controller.onRememberMeChange,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                );
                              }),
                          Text('Remember me',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: ColorRes.black))
                        ],
                      ),
                      SizedBox(height: Get.height * 0.0246),
                      GetBuilder<SignUpController>(
                          id: "dark",
                          builder: (controller) {
                            return (controller.firstnameController.text == '' ||
                                    controller.lastnameController.text == '' ||
                                    controller.emailController.text == '' ||
                                    controller.phoneController.text == '' ||
                                    controller.passwordController.text == '' ||
                                    controller.cityController.text == '' ||
                                    controller.stateController.text == '' ||
                                    controller.countryController.text == '')
                                ? Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(colors: [
                                        ColorRes.gradientColor.withOpacity(0.2),
                                        ColorRes.containerColor.withOpacity(0.4)
                                      ]),
                                    ),
                                    child: Text("Sign up",
                                        style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: ColorRes.white)),
                                  )
                                : InkWell(
                                    // dashboard write
                                    onTap: controller.onLoginBtnTap,
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
                                      child: Text("Sign up",
                                          style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: ColorRes.white)),
                                    ),
                                  );
                          }),
                      const SizedBox(height: 15),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (con) => ForgotPasswordScreen()));
                          },
                          child: Text('Forgot the password?',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: ColorRes.containerColor)),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: InkWell(
                          onTap: () {},
                          child: Text('or continue with',
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: ColorRes.black)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 51,
                            width: 154,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(6, 6),
                                      color: ColorRes.containerColor
                                          .withOpacity(0.08),
                                      spreadRadius: 0,
                                      blurRadius: 35),
                                ],
                                borderRadius: BorderRadius.circular(10),
                                color: ColorRes.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Image(
                                  image: AssetImage(
                                    AssetRes.facebook_image,
                                  ),
                                  height: 27,
                                ),
                                const SizedBox(width: 20),
                                Text('Facebook',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: ColorRes.black))
                              ],
                            ),
                          ),
                          Container(
                            height: 51,
                            width: 154,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(6, 6),
                                      color: ColorRes.containerColor
                                          .withOpacity(0.08),
                                      spreadRadius: 0,
                                      blurRadius: 35),
                                ],
                                borderRadius: BorderRadius.circular(10),
                                color: ColorRes.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Image(
                                  image: AssetImage(
                                    AssetRes.Google_logo,
                                  ),
                                  height: 27,
                                ),
                                const SizedBox(width: 20),
                                Text('Google',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: ColorRes.black))
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have account?",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: ColorRes.black),
                          ),
                          GetBuilder<SignUpController>(
                            builder: (controller) => TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (con) => SigninScreen()));
                              },
                              child: Text(
                                'Sign In',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: ColorRes.containerColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              )),
              controller.loading.isTrue
                  ? const Center(child: CircularProgressIndicator())
                  : const SizedBox(),
            ],
          );
        }),
      ),
    );
  }
}

OutlineInputBorder enableBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(color: ColorRes.containerColor),
    // borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(10),
  );
}

OutlineInputBorder errorBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(color: ColorRes.starColor),
    // borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(10),
  );
}
