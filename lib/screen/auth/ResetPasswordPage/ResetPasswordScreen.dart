import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobseek/common/widgets/backButton.dart';
import 'package:jobseek/screen/auth/congratsPage/congrastsScreen.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

import 'ResetPasswordController.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);
  ResetPasswordController controller = Get.put(ResetPasswordController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backgroungColor,
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 40),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: backButton(),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                'Reset Password',
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w500, height: 1),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 170),
            child: Text(
              'Create a new password',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: ColorRes.black),
            ),
          ),
          const SizedBox(height: 20),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        'New Password',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ColorRes.black.withOpacity(0.6)),
                      ),
                      const Text(
                        '*',
                        style:
                            TextStyle(fontSize: 15, color: ColorRes.starColor),
                      ),
                    ],
                  ),
                ),
                GetBuilder<ResetPasswordController>(
                  id: "NewPassword",
                  builder: (controller) => Container(
                    width: 339,
                    height: 51,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(6, 6),
                            color: ColorRes.containerColor.withOpacity(0.05),
                            spreadRadius: 0,
                            blurRadius: 35),
                      ],
                      border: Border.all(color: ColorRes.containerColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Material(
                      shadowColor: ColorRes.containerColor,
                      borderRadius: BorderRadius.circular(12),
                      child: TextFormField(
                        controller: controller.passwordController,
                        obscureText: controller.show,
                        decoration: InputDecoration(
                          hintText: 'New Password',
                          fillColor: ColorRes.white,
                          suffixIcon: IconButton(
                            icon: controller.show
                                ? Icon(Icons.visibility_off,
                                    color: ColorRes.black.withOpacity(0.15))
                                : Icon(Icons.visibility,
                                    color: ColorRes.black.withOpacity(0.15)),
                            onPressed: controller.chang,
                          ),
                          filled: true,
                          hintStyle: TextStyle(
                              color: ColorRes.black.withOpacity(
                                0.15,
                              ),
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        'Confirm New Password',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ColorRes.black.withOpacity(0.6)),
                      ),
                      const Text(
                        '*',
                        style:
                            TextStyle(fontSize: 15, color: ColorRes.starColor),
                      ),
                    ],
                  ),
                ),
                GetBuilder<ResetPasswordController>(
                  id: "ConfirmPassword",
                  builder: (controller) => Container(
                    width: 339,
                    height: 51,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(6, 6),
                            color: ColorRes.containerColor.withOpacity(0.05),
                            spreadRadius: 0,
                            blurRadius: 35),
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Material(
                      shadowColor: ColorRes.containerColor,
                      borderRadius: BorderRadius.circular(12),
                      child: TextFormField(
                        controller: controller.ConfrimPassword,
                        // validator: MultiValidator([
                        //   RequiredValidator(errorText: "* Required"),
                        //   MinLengthValidator(6,
                        //       errorText: "Password should be at least 6 characters"),
                        //   MaxLengthValidator(15,
                        //       errorText:
                        //       "Password should not be greater than 15 characters"),
                        // ]),

                        obscureText: controller.Confirm,
                        decoration: InputDecoration(
                          hintText: 'Confirm New Password',
                          fillColor: ColorRes.white,
                          suffixIcon: IconButton(
                            icon: controller.Confirm
                                ? Icon(Icons.visibility_off,
                                    color: ColorRes.black.withOpacity(0.15))
                                : Icon(Icons.visibility,
                                    color: ColorRes.black.withOpacity(0.15)),
                            onPressed: controller.Rechange,
                          ),
                          filled: true,
                          hintStyle: TextStyle(
                              color: ColorRes.black.withOpacity(
                                0.15,
                              ),
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          controller.newpwdErroe == ""
              ? const SizedBox(height: 20)
              : Container(
                  width: 339,
                  height: 28,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: ColorRes.invalidColor),
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Image(
                          image: AssetImage(
                            AssetRes.invalid,
                          ),
                          height: 14,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Password does not match',
                          style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w400,
                              color: ColorRes.starColor),
                        )
                      ]),
                ),
          Row(
            children: [
              GetBuilder<ResetPasswordController>(
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
              const Text(
                'Remember me',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: ColorRes.black),
              )
            ],
          ),
          const SizedBox(height: 290),
          Container(
            height: 50,
            width: 339,
            //width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [
                ColorRes.gradientColor.withOpacity(0.4),
                ColorRes.containerColor.withOpacity(0.4),
              ]),
            ),
            child: InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (con) => CongratsScreen()));
                }
              },
              child: Text(
                "Save",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: ColorRes.white),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
