import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/manager_section/auth_manager/Otp_Page/otp_screen.dart';

class ForgotPasswordControllerU extends GetxController {
  GlobalKey<FormState> forgotFormKey = GlobalKey();

  TextEditingController forgotEmailController = TextEditingController();
  String emailError = "";
  emailValidation() {
    if (forgotEmailController.text.trim() == "") {
      emailError = 'Please Enter email';
    } else {
      if (RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(forgotEmailController.text)) {
        // return 'Enter  valid Email';
        emailError = '';
      } else {
        emailError = "Invalid email";
      }
    }
  }

  bool validator() {
    emailValidation();

    if (emailError == "") {
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
      Get.to(OtpScreenM());
    }
    update([
      "showEmail",
    ]);
  }

  RxBool isEmailValidate = false.obs;
}
