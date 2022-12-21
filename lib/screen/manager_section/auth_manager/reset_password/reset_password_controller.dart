import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/auth/congratsPage/congrastsScreen.dart';
import 'package:jobseek/screen/manager_section/auth_manager/congrats/congrats_screen.dart';

class ResetPasswordControllerM extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController  confirmPasswordController = TextEditingController();

  String newPassword = '';
  String confirmPassword = '';
  final _formKey = GlobalKey<FormState>();


  passwordValidation() {
    if (passwordController.text.trim() == "") {
      newPassword = "Enter Password";
    } else {
      if (passwordController.text.trim().length >= 8) {
        newPassword = '';
      } else {
        newPassword ='Password must be at least 8 characters in length';
      }
    }
  }

  newPasswordValidation() {
    if (confirmPasswordController.text.trim() == "") {
      confirmPassword  = "Enter Password";
    } else {
      if (passwordController.text.trim() == confirmPasswordController.text.trim()) {
        confirmPassword  = '';
      } else {
        confirmPassword  ='Confirmation password does not match the entered password';
      }
    }
  }
  bool validator() {
    passwordValidation();
    newPasswordValidation();
    if (newPassword == ""&&confirmPassword =="" ) {
      return true;
    } else {
      return false;
    }
  }

  bool show = true;
  bool confirm = true;

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
  onLoginBtnTap( context) {
    if (validator()) {
      print("GO TO HOME PAGE");
      Get.to(const CongratsScreen());
    }
    update(["NewPassword"]);
    update(["ConfirmPassword"]);

    if (_formKey.currentState!.validate()) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (con) => const CongratsScreenM()));
    }
  }

}


