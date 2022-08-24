import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/frist_page/frist_Screen.dart';

import 'package:jobseek/screen/splashScreen/splash_Screen.dart';

class SigninScreenController extends GetxController {
  RxBool loading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String emailError = "";
  String pwdError = "";

  emailValidation() {
    if (emailController.text.trim() == "") {
      emailError= 'Please Enter email';
      // emailError = "Enter email";
    } else {
      if (RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(emailController.text)) {
        // return 'Enter  valid Email';
         emailError = '';
      } else {
        emailError = "Enter valid email";
      }
    }
  }

  passwordValidation() {
    if (passwordController.text.trim() == "") {
      pwdError= 'Please Enter Password';
      // pwdError = "Enter Password";
    } else {
      if (passwordController.text.trim().length >= 8) {
        pwdError = '';
      } else {
        pwdError = "Enter valid password";
      }
    }
  }

  bool validator() {

    emailValidation();
    passwordValidation();
    if (emailError == "" && pwdError == "") {
      return true;
    } else {
      return false;
    }
  }

  onLoginBtnTap() {
    if (validator()) {
      print("GO TO HOME PAGE");
      Get.to(FirstScreen());
    }
    update(["loginForm","showEmail","pwdError"]);
  }

  bool show = false;

  chang() {

    debugPrint("SHOW $show");
    show = !show;
    update(['showPassword']);
  }

  bool rememberMe = false;

  void onRememberMeChange(bool? value) {
    if (value != null) {
      rememberMe = value;
      update(['remember_me']);
    }
  }

  bool buttonColor = false;

  button() {
    if (emailController.text != '' && passwordController.text != '') {
      buttonColor = true;
      update(['color']);
    } else {
      buttonColor = false;
      update(['color']);
    }
    update();
  }
}
