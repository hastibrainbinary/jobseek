import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobseek/screen/manager_section/dashboard/manager_dashboard_screen.dart';
import 'package:jobseek/screen/organization_profile_screen/services.dart';

class OrganizationProfileScreenController extends GetxController
    implements GetxService {
  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyEmailController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  RxBool isNameValidate = false.obs;
  RxBool isEmailValidate = false.obs;
  RxBool isAddressValidate = false.obs;
  RxBool isCountryValidate = false.obs;
  RxBool isDateValidate = false.obs;
  RxBool isPositionValidate = false.obs;
  RxBool isSalaryValidate = false.obs;
  RxBool isLocationValidate = false.obs;
  RxBool isTypeValidate = false.obs;
  RxBool isStatusValidate = false.obs;
  DateTime? startTime;
  ImagePicker picker = ImagePicker();
  File? image;
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;
  // addDataInFirebase(email, name, date, country, address) async {
  //    print(userCredential.user?.uid);
  //   await fireStore.collection('users').doc("user").set({
  //     "email": email,
  //     "name": name,
  //     "date": date,
  //     "country": country,
  //     "address": address,
  //   }).catchError((e) {
  //     print('======Error======== ' + e);
  //   });
  // }
  Future<void> uploadingData(String name, String email, String date,
      String country, String address) async {
    await fireStore.collection("user").doc("DnCMBWSEhmT3WoNjx3wuY5cRdMa2").set({
      "email": email,
      "name": name,
      "date": date,
      "country": country,
      "address": address,
    }).catchError((e) {
      if (kDebugMode) {
        print('======Error======== ' + e);
      }
    });
  }

  Confirm(email, password, name, date, country, address) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseServices.createData(
        name: "name",
        email: "email",
        date: "date",
        country: "country",
        address: "address",
      );

      Get.to(() => const Company());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
      } else if (e.code == 'email-already-in-use') {
        if (kDebugMode) {
          print('The account already exists for that email.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  onLoginBtnTap({
    // required addData(),

    required String email,
    required String name,
    required String date,
    required String country,
    required String address,
  }) {
    fireStore.collection('user').add({
      "email": companyEmailController.text.trim(),
      "name": companyNameController.text.trim(),
      "date": dateController.text.trim(),
      "country": countryController.text.trim(),
      "address": companyAddressController.text.trim(),
    });
    validate();
    if (isNameValidate.value == false &&
        isEmailValidate.value == false &&
        isAddressValidate.value == false &&
        isCountryValidate.value == false &&
        isDateValidate.value == false) {
      if (kDebugMode) {
        print("GO TO HOME PAGE");
      }
      uploadingData(name, email, date, country, address);

      Get.to(ManagerDashBoardScreen());
    }
  }

  validate() {
    if (companyNameController.text.isEmpty) {
      isNameValidate.value = true;
    } else {
      isNameValidate.value = false;
    }
    if (companyEmailController.text.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(companyEmailController.text)) {
      isEmailValidate.value = true;
    } else {
      isEmailValidate.value = false;
    }
    if (companyAddressController.text.isEmpty) {
      isAddressValidate.value = true;
    } else {
      isAddressValidate.value = false;
    }
    if (countryController.text.isEmpty) {
      isCountryValidate.value = true;
    } else {
      isCountryValidate.value = false;
    }
    if (dateController.text.isEmpty) {
      isDateValidate.value = true;
    } else {
      isDateValidate.value = false;
    }
  }

  Future<void> onDatePickerTap(context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            primarySwatch: Colors.blue,
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      startTime = picked;
      if (kDebugMode) {
        print("START TIME : $startTime");
      }
      dateController.text =
          "${picked.toLocal().month}/${picked.toLocal().day}/${picked.toLocal().year}";
      update();
    }
  }

  String? dropDownValue;

  var items = [
    'India',
    'United States',
    'Europe',
    'china',
    'United Kingdom',
  ];

  ontapGallery1() async {
    //filepath.value = file.name.toString();
    XFile? gallery = await picker.pickImage(source: ImageSource.gallery);
    String path = gallery!.path;
    image = File(path);
    imagePicker();
  }

  imagePicker() {
    update(['image']);
    update();
  }
}
