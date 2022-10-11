import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobseek/common/widgets/common_textField.dart';
import 'package:jobseek/screen/auth/forgot_password_new/forgot_password_new_screen.dart';
import 'package:jobseek/screen/auth/sign_inScreen/Signin_controller.dart';
import 'package:jobseek/screen/auth/sign_up/sign_upScreen.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({Key? key}) : super(key: key);

  SignInScreenController controller = Get.put(SignInScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorRes.white,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Obx(() {
            return Stack(children: [
              SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: Get.height * 0.061),
                        Center(
                          child: Container(
                            alignment: Alignment.center,
                            height: Get.height * 0.1,
                            width: Get.height * 0.1,
                            decoration: BoxDecoration(
                              color: ColorRes.logoColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              'Logo',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: ColorRes.containerColor),
                            ),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.022),
                        Center(
                          child: Text(
                            'Sign in to your account',
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: ColorRes.black),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.05),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15, bottom: Get.height * 0.012),
                          child: Row(
                            children: [
                              Text(
                                'Email',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: ColorRes.black.withOpacity(0.6),
                                ),
                              ),
                              const Text(
                                '*',
                                style: TextStyle(
                                    fontSize: 15, color: ColorRes.starColor),
                              ),
                            ],
                          ),
                        ),
                        GetBuilder<SignInScreenController>(
                          id: "showEmail",
                          builder: (controller) => Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 0),
                                      color: ColorRes.containerColor
                                          .withOpacity(0.15),
                                      spreadRadius: -8,
                                      blurRadius: 20,
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: commonTextFormField(
                                  controller: controller.emailController,
                                  textDecoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        left: 15,
                                        top: 10,
                                        bottom: 10,
                                        right: 15),
                                    hintText: 'Email',
                                    fillColor: Colors.transparent,
                                    filled: true,
                                    hintStyle: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            ColorRes.black.withOpacity(0.15)),
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
                              controller.emailError == ""
                                  ? const SizedBox()
                                  : Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      width: 339,
                                      height: 28,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
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
                        SizedBox(height: Get.height * 0.025),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15, bottom: Get.height * 0.012),
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
                        GetBuilder<SignInScreenController>(
                          id: "showPassword",
                          builder: (controller) => Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 0),
                                      color: ColorRes.containerColor
                                          .withOpacity(0.15),
                                      spreadRadius: -8,
                                      blurRadius: 20,
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: commonTextFormField(
                                  controller: controller.passwordController,
                                  obscureText: controller.show,
                                  textDecoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        left: 15,
                                        top: 10,
                                        bottom: 10,
                                        right: 15),
                                    hintText: 'Password',
                                    fillColor: Colors.transparent,
                                    suffixIcon: IconButton(
                                      icon: controller.show
                                          ? Icon(
                                              Icons.visibility_off,
                                              color: ColorRes.black
                                                  .withOpacity(0.15),
                                            )
                                          : Icon(
                                              Icons.visibility,
                                              color: ColorRes.black
                                                  .withOpacity(0.15),
                                            ),
                                      onPressed: controller.chang,
                                    ),
                                    filled: true,
                                    hintStyle: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: ColorRes.black.withOpacity(0.15),
                                    ),
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
                              controller.pwdError == ""
                                  ? const SizedBox()
                                  : Container(
                                      width: 339,
                                      height: 28,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
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
                                            ),
                                          ]),
                                    ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            GetBuilder<SignInScreenController>(
                                id: "remember_me",
                                builder: (controller) {
                                  return InkWell(
                                    onTap: () {
                                      controller.rememberMe =
                                          !controller.rememberMe;
                                      controller.update(["remember_me"]);
                                    },
                                    child: Row(
                                      children: [
                                        Checkbox(
                                          activeColor: ColorRes.containerColor,
                                          checkColor: ColorRes.white,
                                          side: const BorderSide(
                                              width: 1.2,
                                              color: ColorRes.containerColor),
                                          value: controller.rememberMe,
                                          onChanged:
                                              controller.onRememberMeChange,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        Text('Remember me',
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: ColorRes.black))
                                      ],
                                    ),
                                  );
                                }),
                          ],
                        ),
                        SizedBox(height: Get.height * 0.036),
                        GetBuilder<SignInScreenController>(
                            id: "colorChange",
                            builder: (controller) {
                              return (controller.emailController.text == '' ||
                                      controller.passwordController.text == '')
                                  ? Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: LinearGradient(colors: [
                                          ColorRes.gradientColor
                                              .withOpacity(0.2),
                                          ColorRes.containerColor
                                              .withOpacity(0.4)
                                        ]),
                                      ),
                                      child: Text("Sign In",
                                          style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: ColorRes.white)),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        controller.onLoginBtnTap(
                                            password: controller
                                                .passwordController.text,
                                            email: controller
                                                .emailController.text);
                                      },
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
                                        child: Text("Sign In",
                                            style: GoogleFonts.poppins(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: ColorRes.white)),
                                      ),
                                    );
                            }),
                        SizedBox(height: Get.height * 0.022),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (con) =>
                                          ForgotPasswordScreenU()));
                            },
                            child: Text(
                              'Forgot the password?',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: ColorRes.containerColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.035),
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
                        SizedBox(height: Get.height * 0.035),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.faceBookSignIn();
                              },
                              child: Container(
                                height: 50,
                                width: 145,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: ColorRes.borderColor),
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
                                    const SizedBox(width: 15),
                                    Text('Facebook',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: ColorRes.black)),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            InkWell(
                              onTap: () {
                                controller.signWithGoogle();
                              },
                              child: Container(
                                height: 50,
                                width: 145,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: ColorRes.borderColor),
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
                                    const SizedBox(width: 15),
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
                            ),
                          ],
                        ),
                        SizedBox(height: Get.height * 0.033),
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
                            GetBuilder<SignInScreenController>(
                              builder: (controller) => InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (con) => sign_upScreen()));
                                },
                                child: Text(
                                  ' Sign up',
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
              controller.loading.isTrue
                  ? Center(
                      child: Container(
                        padding: const EdgeInsets.all(35),
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                            color: ColorRes.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: const CircularProgressIndicator(
                          color: ColorRes.containerColor,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ]);
          }),
        ));
  }

  OutlineInputBorder enableBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: ColorRes.containerColor),
      borderRadius: BorderRadius.circular(12),
    );
  }

  OutlineInputBorder errorBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: ColorRes.starColor),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
