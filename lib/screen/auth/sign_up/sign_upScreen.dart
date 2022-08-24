import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobseek/screen/auth/Forgot_Password/ForgotPassword_Screen.dart';
import 'package:jobseek/screen/auth/sign_up/sign_upController.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class sign_upScreen extends StatelessWidget {
  sign_upScreen({Key? key}) : super(key: key);

  sign_upController controller = Get.put(sign_upController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.white,
        body: Obx(() {
          return Stack(
            children: [
              controller.loading.isTrue
                  ? CircularProgressIndicator()
                  : SizedBox(),
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
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: Text(
                          'Sign up for free',
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: ColorRes.black),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
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
                      GetBuilder<sign_upController>(
                        id: "showEmail",
                        builder: (controller) => Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(6, 6),
                                  color:
                                      ColorRes.containerColor.withOpacity(0.05),
                                  spreadRadius: 0,
                                  blurRadius: 35),
                            ],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Material(
                            shadowColor: Colors.purple.shade700,
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
                                    color: ColorRes.black.withOpacity(0.15)),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      controller.emailError == ""
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Image(
                                      image: AssetImage(
                                        AssetRes.invalid,
                                      ),
                                      height: 14,
                                    ),
                                    const SizedBox(width: 10),
                                    Text('Invalid email',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 9,
                                            color: ColorRes.starColor))
                                  ]),
                            ),
                      const SizedBox(height: 20),
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
                      GetBuilder<sign_upController>(
                        id: "showPassword",
                        builder: (controller) => Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(6, 6),
                                  color:
                                      ColorRes.containerColor.withOpacity(0.05),
                                  spreadRadius: 0,
                                  blurRadius: 35),
                            ],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Material(
                            shadowColor: Colors.purple.shade700,
                            borderRadius: BorderRadius.circular(12),
                            child: TextFormField(
                              controller: controller.passwordController,
                              obscureText: controller.show,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                fillColor: ColorRes.white,
                                suffixIcon: IconButton(
                                  icon: controller.show
                                      ? Icon(Icons.visibility_off,
                                          color:
                                              ColorRes.black.withOpacity(0.15))
                                      : Icon(Icons.visibility,
                                          color:
                                              ColorRes.black.withOpacity(0.15)),
                                  onPressed: controller.chang,
                                ),
                                filled: true,
                                hintStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: ColorRes.black.withOpacity(0.15)),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(12),
                                ),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                    )
                                  ]),
                            ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          GetBuilder<sign_upController>(
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
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: controller.onLoginBtnTap,
                        child: Container(
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
                        ),
                      ),
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
                          GetBuilder<sign_upController>(
                            builder: (controller) => TextButton(
                              onPressed: () {},
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
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
