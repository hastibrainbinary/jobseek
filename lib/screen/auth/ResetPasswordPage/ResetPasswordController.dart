import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController ConfrimPassword = TextEditingController();

  String pwdError = "";
  String newpwdErroe = "";
  bool _autoValidate = false;

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
    if (ConfrimPassword.text.trim() == "") {
      newpwdErroe = "Enter Password";
    } else {
      if (passwordController.text.trim() == ConfrimPassword.text.trim()) {
        newpwdErroe = '';
      } else {
        newpwdErroe = "Enter valid password";
      }
    }
  }

  bool show = false;
  bool Confirm = false;

  chang() {
    debugPrint("SHOW $show");
    show = !show;
    update(['NewPassword']);
  }

  Rechange() {
    debugPrint("Confirm $Confirm");
    Confirm = !Confirm;
    update(['ConfirmPassword']);
  }

  bool validator() {
    passwordValidation();
    newpasswordValidation();
    if (pwdError == "") {
      return true;
    } else {
      return false;
    }
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
    if (passwordController.text != '' && ConfrimPassword.text != '') {
      buttonColor = true;
      update(['color']);
    } else {
      buttonColor = false;


      update(['color']);
    }
    update();
  }
}
