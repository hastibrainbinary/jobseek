import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/manager_section/auth_manager/Otp_Page/otp_screen.dart';

class ForgotPasswordControllerM extends GetxController {
  GlobalKey<FormState> forgotFormKey = GlobalKey();

  TextEditingController forgotEmailController = TextEditingController();
  String emailError = "";

  static FirebaseFirestore fireStore = FirebaseFirestore.instance;


  // var acs = ActionCodeSettings(
  //     // URL you want to redirect back to. The domain (www.example.com) for this
  //     // URL must be whitelisted in the Firebase Console.
  //
  //     url: 'https://jobseek.page.link/6SuK',
  //     // This must be true
  //     handleCodeInApp: true,
  //     iOSBundleId: 'com.example.ios',
  //     androidPackageName: 'com.example.android',
  //     // installIfNotAvailable
  //     androidInstallApp: true,
  //     // minimumVersion
  //     androidMinimumVersion: '12');

  // FirebaseAuth.instance.sendSignInLinkToEmail(
  // email: emailAuth, actionCodeSettings: acs)
  //     .catchError((onError) => print('Error sending email verification $onError'))
  //     .then((value) => print('Successfully sent email verification'));

  // Future verificationEmail(email) async {
  //   try {
  //     FirebaseAuth.instance
  //         .sendSignInLinkToEmail(email: email, actionCodeSettings: acs);
  //   } catch (err) {
  //     if (kDebugMode) {
  //       print(err);
  //     }
  //   }
  // }

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
