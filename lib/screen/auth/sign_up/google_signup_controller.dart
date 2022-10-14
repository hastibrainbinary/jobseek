import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoogleSignupController extends GetxController {
  final String email;
  final String firstname;
  final String lastname;
  GoogleSignupController( {required this.email,required this.firstname, required this.lastname,});
  @override
  void onInit() {
    print("********************************");
   emailController.text = email;
   firstnameController.text= firstname;
   lastnameController .text= lastname;
    super.onInit();
  }

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController occupationController = TextEditingController();

  RxBool loading = false.obs;
  String emailError = "";
  String pwdError = "";
  String phoneError = "";
  String firstError = "";
  String lastError = "";
  String cityError = "";
  String stateError = "";
  String countryError = "";
  String occupationError = "";
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;

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
  }

  firstNameValidation() {
    if (firstnameController.text.trim() == "") {
      firstError = 'Please Enter Firstname';
    } else {
      firstError = "";
    }
  }

  lastNameValidation() {
    if (lastnameController.text.trim() == "") {
      lastError = 'Please Enter Lastname';
    } else {
      lastError = "";
    }
  }

  cityNameValidation() {
    if (cityController.text.trim() == "") {
      cityError = 'Please Enter city';
    } else {
      cityError = "";
    }
  }

  stateNameValidation() {
    if (stateController.text.trim() == "") {
      stateError = 'Please Enter State';
    } else {
      stateError = "";
    }
  }

  countryNameValidation() {
    if (cityController.text.trim() == "") {
      countryError = 'Please Enter Country';
    } else {
      countryError = "";
    }
  }

  occupationNameValidation() {
    if (occupationController.text.trim() == "") {
      occupationError = 'Please Enter Country';
    } else {
      occupationError = "";
    }
  }

  phoneValidation() {
    if (phoneController.text.trim() == "") {
      phoneError = 'Please Enter phoneNumber';
    } else {
      if (phoneController.text.length == 10) {
        phoneError = "";
      } else {
        phoneError = "Invalid Phone Number";
      }
      // if (RegExp(r"^\+?0[0-9]{10}$").hasMatch(phoneController.text)) {
      //     phoneError = "";
      // } else {
      //   phoneError = "Invalid PhoneNumber";
      // }
    }
    update(["showPhoneNumber"]);
  }

  passwordValidation() {
    if (passwordController.text.trim() == "") {
      pwdError = 'Please Enter Password';
    } else {
      if (passwordController.text
          .trim()
          .length >= 8) {
        pwdError = '';
      } else {
        pwdError = "At Least 8 Character";
      }
    }
  }

  bool validator() {
    emailValidation();
    passwordValidation();
    phoneValidation();
    firstNameValidation();
    lastNameValidation();
    cityNameValidation();
    stateNameValidation();
    countryNameValidation();
    occupationNameValidation();
    if (emailError == "" &&
        pwdError == "" &&
        phoneError == "" &&
        firstError == "" &&
        lastError == "" &&
        cityError == "" &&
        stateError == "" &&
        countryError == "" &&
        occupationError == "") {
      return true;
    } else {
      return false;
    }
  }



  onSignUpBtnTap() {
    if (validator()) {
      // singUp(emailController.text, passwordController.text);
      if (kDebugMode) {
        print("GO TO HOME PAGE");
      }
    }
    update(["showEmail"]);
    update(["showLastname"]);
    update(["showFirstname"]);
    update(["showPhoneNumber"]);
    update(["loginForm"]);
    update(["showPassword"]);
    update(["showOccupation"]);
    update(["showCity"]);
    update(["showState"]);
    update(["showCountry"]);
    update(['dark']);
  }

  // singUp(email, password) async {
  //   try {
  //     loading.value = true;
  //     UserCredential userCredential =
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     if (userCredential.user?.uid != null) {
  //       PrefService.setValue(
  //           PrefKeys.userId, userCredential.user?.uid.toString());
  //       PrefService.setValue(PrefKeys.rol, "User");
  //       Map<String, dynamic> map2 = {
  //         "fullName": "${firstnameController.text} ${lastnameController.text}",
  //         "Email": emailController.text,
  //         "Phone": phoneController.text,
  //         "Occupation": occupationController.text,
  //         "City": cityController.text,
  //         "State": stateController.text,
  //         "Country": countryController.text,
  //       };
  //       addDataInFirebase(userUid: userCredential.user?.uid ?? "", map: map2);
  //     }
  //     Get.to(DashBoardScreen());
  //     loading.value = false;
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       if (kDebugMode) {
  //         print('The password provided is too weak.');
  //       }
  //     } else if (e.code == 'email-already-in-use') {
  //       Get.snackbar("Error", e.message.toString(),
  //           colorText: const Color(0xffDA1414));
  //       loading.value = false;
  //       if (kDebugMode) {
  //         print('The account already exists for that email.');
  //       }
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //       loading.value = false;
  //     }
  //   }
  // }
  //
  // addDataInFirebase(
  //     {required String userUid, required Map<String, dynamic> map}) async {
  //   await fireStore
  //       .collection("Auth")
  //       .doc("User")
  //       .collection("register")
  //       .doc(userUid)
  //       .set(map)
  //       .catchError((e) {
  //     if (kDebugMode) {
  //       print('...error...' + e);
  //     }
  //   });
  //   if (kDebugMode) {
  //     print("*************************** Success");
  //   }
  // }

  bool show = true;
  Country countryModel = Country.from(json: {
    "e164_cc": "1",
    "iso2_cc": "CA",
    "e164_sc": 0,
    "geographic": true,
    "level": 2,
    "name": "Canada",
    "example": "2042345678",
    "display_name": "Canada (CA) [+1]",
    "full_example_with_plus_sign": "+12042345678",
    "display_name_no_e164_cc": "Canada (CA)",
    "e164_key": "1-CA-0"
  });

  void countrySelect(context) {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        countryModel = country;
        update(['phone_filed']);
      },
    );
  }

  void onCountryTap(BuildContext context) {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        countryModel = country;
        update(['phone_filed']);
      },
    );
  }

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

