import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/auth/Forgot_Password/ForgotPassword_Screen.dart';
import 'package:jobseek/screen/auth/OtpPage/OtpScreen.dart';
import 'package:jobseek/screen/auth/ResetPasswordPage/ResetPasswordController.dart';
import 'package:jobseek/screen/auth/ResetPasswordPage/ResetPasswordScreen.dart';
import 'package:jobseek/screen/auth/congratsPage/congrastsScreen.dart';
import 'package:jobseek/screen/auth/sign_up/sign_upScreen.dart';
import 'package:jobseek/screen/frist_page/frist_Screen.dart';
import 'package:jobseek/screen/sign_inScreen/Signin_Screen.dart';
import 'package:jobseek/screen/splashScreen/splash_Screen.dart';

void main() {
  runApp( GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirstScreen(
    ),
  ));
}
