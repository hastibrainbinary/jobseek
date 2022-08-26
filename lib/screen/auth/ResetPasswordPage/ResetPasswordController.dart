import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/auth/congratsPage/congrastsScreen.dart';

class ResetPasswordController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController  confirmPasswordController = TextEditingController();

  String pwdError = "";
  String newpwdErroe = "";


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

  newpasswordValidation() {
    if (confirmPasswordController.text.trim() == "") {
      newpwdErroe = "Enter Password";
    } else {
      if (passwordController.text.trim() == confirmPasswordController.text.trim()) {
        newpwdErroe = '';
      } else {
        newpwdErroe = "Enter valid password";
      }
    }
  }
  bool validator() {
    passwordValidation();
    newpasswordValidation();
    if (pwdError == ""&&newpwdErroe=="" ) {
      return true;
    } else {
      return false;
    }
  }

  bool show = false;
  bool confirm = false;

  chang() {
    debugPrint("SHOW $show");
    show = !show;
    update(['NewPassword']);
  }

  Rechange() {
    debugPrint("Confirm $confirm");
    confirm = !confirm;
    update(['ConfirmPassword']);
  }



  bool rememberMe = false;

  void onRememberMeChange(bool? value) {
    if (value != null) {
      rememberMe = value;
      update(['remember_me']);
    }
  }

  // bool buttonColor = false;

  // button() {
  //   if (passwordController.text != '' && confirmPasswordController.text != '') {
  //     buttonColor = true;
  //     update(['color']);
  //   } else {
  //     buttonColor = false;
  //
  //     update(['color']);
  //   }
  //   update();
  // }
  onLoginBtnTap() {
    if (validator()) {
      print("GO TO HOME PAGE");
      Get.to(const CongratsScreen());
    }
    update(["NewPassword"]);
    update(["ConfirmPassword"]);
  }
  bool validation() {
    // if (newPasswordController.text.isEmpty) {
    //   errorToast(Strings.newPasswordError);
    //   return false;
    // } else if (validatePassword(newPasswordController.text) == false) {
    //   errorToast(Strings.confirmShortPassword);
    //   return false;
    // } else if (confirmPasswordController.text.isEmpty) {
    //   errorToast(Strings.coPasswordEmpty);
    //   return false;
    // } else if (validatePassword(confirmPasswordController.text) == false) {
    //   errorToast(Strings.confirmShortPassword);
    //   return false;
    // } else if (confirmPasswordController.text != newPasswordController.text) {
    //   errorToast(Strings.confirmPasswordMismatch);
    //   return false;
    // }
    return true;
  }

}
