import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobseek/screen/dashboard/dashboard_screen.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:jobseek/service/pref_services.dart';
import 'package:jobseek/utils/pref_keys.dart';

class SignInScreenController extends GetxController {
  RxBool loading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String emailError = "";
  String pwdError = "";

  emailValidation() {
    if (emailController.text.trim() == "") {
      emailError = 'Please Enter email';
    } else {
      if (RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(emailController.text)) {
        emailError = '';
      } else {
        emailError = "Invalid email";
      }
    }
    update(["showEmail"]);
  }

  passwordValidation() {
    if (passwordController.text.trim() == "") {
      pwdError = 'Please Enter Password';
    } else {
      if (passwordController.text.trim().length >= 8) {
        pwdError = '';
      } else {
        pwdError = "At Least 8 Character";
      }
    }
    update(["showPassword"]);
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

  // Future<String> signInWithEmailAndPassword(
  //     {required String email, required String password}) async {
  //   try {
  //     loading.value = true;
  //     UserCredential credential = await auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //     loading.value = false;
  //
  //     if (kDebugMode) {
  //       print(credential);
  //     }
  //
  //     if (credential.user!.email.toString() == email) {
  //       final DashBoardController controller = Get.put(DashBoardController());
  //       controller.currentTab = 0;
  //       Get.offAll(DashBoardScreen());
  //     }
  //
  //     return credential.user!.uid;
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       Get.snackbar("Error", "Wrong user", colorText: const Color(0xffDA1414));
  //       loading.value = true;
  //
  //       if (kDebugMode) {
  //         print('No user found for that email.');
  //       }
  //     } else if (e.code == 'wrong-password') {
  //       Get.snackbar("Error", "Wrong Password",
  //           colorText: const Color(0xffDA1414));
  //
  //       loading.value = false;
  //
  //       if (kDebugMode) {
  //         print('Wrong password provided for that user.');
  //       }
  //     }
  //     if (kDebugMode) {
  //       print(e.code);
  //     }
  //     return e.code;
  //   }
  // }
  Future<String> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      loading.value = true;
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      loading.value = false;

      if (kDebugMode) {
        print(credential);
      }

      if (credential.user!.email.toString() == email) {
        Get.to(() => DashBoardScreen());
      }

      return credential.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("Error", "Wrong user", colorText: const Color(0xffDA1414));
        loading.value = false;

        if (kDebugMode) {
          print('No user found for that email.');
        }
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Error", "Wrong Password",
            colorText: const Color(0xffDA1414));

        loading.value = false;

        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
      }
      if (kDebugMode) {
        print(e.code);
      }
      return e.code;
    }
  }

  onLoginBtnTap({String? email, String? password}) {
    if (validator()) {
      loading.value = true;
      signInWithEmailAndPassword(password: password!, email: email!);
      loading.value = true;
      if (kDebugMode) {
        print("GO TO HOME PAGE");
      }
    }
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

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  void signWithGoogle() async {
    loading.value = true;
    if (await googleSignIn.isSignedIn()) {
      await googleSignIn.signOut();
    }
    final GoogleSignInAccount? account = await googleSignIn.signIn();
    final GoogleSignInAuthentication authentication =
        await account!.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      idToken: authentication.idToken,
      accessToken: authentication.accessToken,
    );

    final UserCredential authResult =
        await auth.signInWithCredential(credential);
    final User? user = authResult.user;
    if (kDebugMode) {
      print(user!.email);
    }
    if (kDebugMode) {
      print(user?.uid);
    }
    if (kDebugMode) {
      print(user?.displayName);
    }

    if (user?.uid != null && user?.uid != "") {
      PrefService.setValue(PrefKeys.accessToken, user!.uid);
      Get.offAll(() => DashBoardScreen());
      loading.value == false;
    } else {
      loading.value == false;
    }

    loading.value == false;
    //flutterToast(Strings.googleSignInSuccess);
  }

  void faceBookSignIn() async {
    try {
      loading.value = true;
      final LoginResult loginResult = await FacebookAuth.instance
          .login(permissions: ["email", "public_profile"]);
      if (kDebugMode) {
        print(loginResult);
      }
      await FacebookAuth.instance.getUserData().then((userData) {
        if (kDebugMode) {
          print(userData);
        }
      });
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(
        loginResult.accessToken!.token,
      );
      if (kDebugMode) {
        print(facebookAuthCredential);
      }
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      if (kDebugMode) {
        print(userCredential);
      }
      if (userCredential.user?.uid != null && userCredential.user?.uid != "") {
        Get.offAll(() => DashBoardScreen());
        loading.value == false;
        // loder false
      } else {
        loading.value == false;
      }

      loading.value = false;
      //flutterToast(Strings.faceBookSignInSuccess);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      loading.value = false;
    }
  }
}
