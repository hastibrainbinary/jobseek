import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/manager_section/dashboard/manager_dashboard_screen.dart';
import 'package:jobseek/utils/pref_keys.dart';
import 'package:jobseek/utils/shared_preferences.dart';

class GoogleSignUpControllerM extends GetxController {
  final String email;
  final String firstname;
  final String lastname;
  GoogleSignUpControllerM({
    required this.email,
    required this.firstname,
    required this.lastname,
  });
  @override
  void onInit() {
    print("********************************");
    emailController.text = email;
    firstnameController.text = firstname;
    lastnameController.text = lastname;
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
  bool show = true;
  bool rememberMe = false;
  void onRememberMeChange(bool? value) {
    if (value != null) {
      rememberMe = value;
      update(['remember_me']);
    }
  }

  chang() {
    debugPrint("SHOW $show");
    show = !show;
    update(['showPassword']);
  }

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

  addDataInFirebase(
      {required String userUid, required Map<String, dynamic> map}) async {
    await fireStore
        .collection("Auth")
        .doc("Manager")
        .collection("register")
        .doc(userUid)
        .set(map)
        .catchError((e) {
      if (kDebugMode) {
        print('...error...' + e);
      }
    });
  }

  onSignUpBtnTap() async {
    String uid = await SharePref.getString(PrefKeys.userId) ?? "";
    Map<String, dynamic> map2 = {
      "fullName": "${firstnameController.text} ${lastnameController.text}",
      "Email": emailController.text,
      "Phone": phoneController.text,
      "Occupation": occupationController.text,
      "City": cityController.text,
      "State": stateController.text,
      "Country": countryController.text,
    };

    // singUp(emailController.text, passwordController.text);
    if (kDebugMode) {
      print("GO TO HOME PAGE");
    }
    await addDataInFirebase(userUid: uid, map: map2);
    Get.offAll(() => ManagerDashBoardScreen());
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
}
