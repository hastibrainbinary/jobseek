import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/sign_inScreen/Signin_Screen.dart';

import '../../splashScreen/splash_Screen.dart';

class sign_upController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool loading = false.obs;
  String emailError = "";
  String pwdError = "";
  emailValidation() {
    if (emailController.text.trim() == "") {
      emailError = "Enter email";
    } else {
      if (RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(emailController.text)) {
        emailError = '';
      } else {
        emailError = "Enter valid email";
      }
    }
  }

  passwordValidation() {
    if (passwordController.text.trim() == "") {
      pwdError = "Enter Password";
    } else {
      if (passwordController.text.trim().length >= 8) {
        pwdError = '';
      } else {
        pwdError = "Enter  valid password";
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
      Get.to(Signin_Screen());
    }
    update(["loginForm"]);
  }

  bool show = false;

  chang() {
    // if(show == false){
    //   show = true;
    // }
    // else{
    //   show = false;
    // }
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
