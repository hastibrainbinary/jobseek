import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/manager_section/dashboard/manager_dashboard_screen.dart';
import 'package:jobseek/screen/organization_profile_screen/organization_profile_screen.dart';

class SignInScreenControllerM extends GetxController {
  RxBool loading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String emailError = "";
  String pwdError = "";

  emailValidation() {
    if (emailController.text.trim() == "") {
      emailError = 'Please Enter email';
      // emailError = "Enter email";
    } else {
      if (RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(emailController.text)) {
        // return 'Enter  valid Email';
        emailError = '';
      } else {
        emailError = "Invalid email";
      }
    }
  }

  passwordValidation() {
    if (passwordController.text.trim() == "") {
      pwdError = 'Please Enter Password';
      // pwdError = "Enter Password";
    } else {
      if (passwordController.text.trim().length >= 8) {
        pwdError = '';
      } else {
        pwdError = "At Least 8 Character";
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
      if (kDebugMode) {
        print("GO TO HOME PAGE");
      }
      Get.to( OrganizationProfileScreen());
    }
    update(["loginForm", "showEmail", "pwdError"]);
  }

  bool show = true;

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