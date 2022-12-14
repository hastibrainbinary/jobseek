import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobseek/screen/auth/Forgot_Password/ForgotPassword_Screen.dart';
import 'package:jobseek/screen/auth/sign_up/sign_upScreen.dart';
import 'package:jobseek/screen/sign_inScreen/Signin_controller.dart';
import 'package:jobseek/utils/color_res.dart';

import '../../utils/asset_res.dart';

class Signin_Screen extends StatelessWidget {
  Signin_Screen({Key? key}) : super(key: key);

  SigninScreenController controller = Get.put(SigninScreenController());

  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorRes.white,
            body: Obx(() {
              return Stack(children: [
                controller.loading.isTrue
                    ? CircularProgressIndicator()
                    : SizedBox(),
                SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: Get.height * 0.0763),
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
                            child: Text('Sign in to your account',
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: ColorRes.black)),
                          ),
                          SizedBox(height: Get.height * 0.0221),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15, bottom: 10),
                            child: Form(
                              key: formGlobalKey,
                              child: Row(
                                children: [
                                  Text('Email',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color:
                                              ColorRes.black.withOpacity(0.6))),
                                  const Text(
                                    '*',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: ColorRes.starColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GetBuilder<SigninScreenController>(
                            id: "showEmail",
                            builder: (controller) => Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(6, 6),
                                          color: ColorRes.containerColor
                                              .withOpacity(0.07),
                                          spreadRadius: 0,
                                          blurRadius: 35),
                                    ],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Material(
                                    shadowColor: ColorRes.containerColor,
                                    borderRadius: BorderRadius.circular(10),
                                    child: TextFormField(
                                      controller: controller.emailController,
                                      // validator: MultiValidator([
                                      //
                                      //   EmailValidator(errorText: "Enter valid email id"),
                                      // ]),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        hintText: 'Email',
                                        fillColor: ColorRes.white,
                                        filled: true,
                                        hintStyle: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: ColorRes.black
                                                .withOpacity(0.15)),
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
                                        errorBorder: controller
                                                .emailController.text
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
                                        margin: const EdgeInsets.all(10),
                                        width: 339,
                                        height: 28,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: ColorRes.invalidColor),
                                        padding:
                                            const EdgeInsets.only(left: 15),
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
                                              SizedBox(width: 10),
                                              Text('Invalid email',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 9,
                                                      color:
                                                          ColorRes.starColor))
                                            ]),
                                      ),
                              ],
                            ),
                          ),
                          SizedBox(height: Get.height * 0.0197),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15, bottom: 10),
                            child: Row(
                              children: [
                                Text('Password',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            ColorRes.black.withOpacity(0.6))),
                                const Text(
                                  '*',
                                  style: TextStyle(
                                      fontSize: 15, color: ColorRes.starColor),
                                ),
                              ],
                            ),
                          ),
                          GetBuilder<SigninScreenController>(
                            id: "showPassword",
                            builder: (controller) => Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(6, 6),
                                      color: ColorRes.containerColor
                                          .withOpacity(0.05),
                                      spreadRadius: 0,
                                      blurRadius: 35),
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Material(
                                shadowColor: ColorRes.containerColor,
                                borderRadius: BorderRadius.circular(12),
                                child: TextFormField(
                                  controller: controller.passwordController,
                                  obscureText: controller.show,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    hintText: 'Password',
                                    // focusedBorder: OutlineInputBorder(
                                    //   borderRadius: BorderRadius.circular(10),
                                    //   borderSide: BorderSide(
                                    //       color: ColorRes.containerColor),
                                    // ),
                                    // enabledBorder: OutlineInputBorder(
                                    //     borderSide:
                                    //     BorderSide(color: ColorRes.starColor),
                                    //     borderRadius: BorderRadius.circular(10)),
                                    fillColor: ColorRes.white,
                                    suffixIcon: IconButton(
                                      icon: controller.show
                                          ? Icon(Icons.visibility_off,
                                              color: ColorRes.black
                                                  .withOpacity(0.15))
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
                                    // border: OutlineInputBorder(
                                    //   borderSide: BorderSide.none,
                                    //   borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          controller.pwdError == ""
                              ? const SizedBox(height: 20)
                              : Container(
                                  width: 339,
                                  height: 28,
                                  margin: EdgeInsets.all(10),
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
                                          'Password does not match email',
                                          style: GoogleFonts.poppins(
                                              fontSize: 9,
                                              fontWeight: FontWeight.w400,
                                              color: ColorRes.starColor),
                                        ),
                                      ]),
                                ),
                          Row(
                            children: [
                              GetBuilder<SigninScreenController>(
                                  id: "remember_me",
                                  builder: (controller) {
                                    return Checkbox(
                                      activeColor: ColorRes.containerColor,
                                      checkColor: ColorRes.white,
                                      side: const BorderSide(
                                          width: 1,
                                          color: ColorRes.containerColor),
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
                          SizedBox(height: Get.height * 0.02),
                          InkWell(
                            onTap: controller.onLoginBtnTap,
                            child: Container(
                              height: 50,
                              //width: 339,

                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  ColorRes.gradientColor.withOpacity(0.2),
                                  ColorRes.containerColor.withOpacity(0.4)
                                ]),
                              ),
                              child: Text("Sign In",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: ColorRes.white)),
                            ),
                          ),
                          SizedBox(height: Get.height * 0.0221),
                          Center(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (con) =>
                                            ForgotPasswordScreen()));
                              },
                              child: Text('Forgot the password?',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: ColorRes.containerColor)),
                            ),
                          ),
                          SizedBox(height: Get.height * 0.0344),
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
                          SizedBox(height: Get.height * 0.0344),
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
                              SizedBox(width: 12),
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
                                    Text(
                                      'Google',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: ColorRes.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Get.height * 0.0344),
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
                              GetBuilder<SigninScreenController>(
                                builder: (controller) => TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (con) => sign_upScreen()));
                                  },
                                  child: Text(
                                    'Sign up',
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
                  ),
                ),
              ]);
            })));
  }

  OutlineInputBorder enableBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: ColorRes.containerColor),
      // borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    );
  }

  OutlineInputBorder errorBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: ColorRes.starColor),
      // borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    );
  }
}
