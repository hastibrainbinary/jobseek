import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobseek/screen/profile/Profile_screen.dart';
import 'package:jobseek/service/pref_services.dart';
import 'package:jobseek/utils/pref_keys.dart';

class ProfileUserController extends GetxController implements GetxService {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  RxBool isNameValidate = false.obs;
  RxBool isEmailValidate = false.obs;
  RxBool isAddressValidate = false.obs;
  RxBool isOccupationValidate = false.obs;
  RxBool isbirthValidate = false.obs;
  DateTime? startTime;
  ImagePicker picker = ImagePicker();
  File? image;
  RxBool isLod = false.obs;
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;

  void onChanged(String value) {
    update(["colorChange"]);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fullNameController.text = PrefService.getString(PrefKeys.fullName);
    emailController.text = PrefService.getString(PrefKeys.email);
    occupationController.text = PrefService.getString(PrefKeys.occupation);
    dateOfBirthController.text = PrefService.getString(PrefKeys.dateOfBirth);
    addressController.text = PrefService.getString(PrefKeys.address);
  }

  Future<void> onDatePickerTap(context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
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
      if (kDebugMode) {
        startTime = picked;
      }
      if (kDebugMode) {
        print("START TIME : $startTime");
      }
      dateOfBirthController.text =
          "${picked.toLocal().month}/${picked.toLocal().day}/${picked.toLocal().year}";
      update();
    }
  }

  init() {
    isLod.value = true;
    final docRef = fireStore
        .collection("Auth")
        .doc("User")
        .collection("register")
        .doc(PrefService.getString(PrefKeys.userId))
        .collection("company")
        .doc("details");
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        fullNameController.text = data["name"];
        emailController.text = data["email"];
        addressController.text = data["address"];
        occupationController.text = data["date"];
        dateOfBirthController.text = data["country"];
        update();
        isLod.value = false;
      },
      onError: (e) {
        Get.snackbar("Error getting document:", "$e",
            colorText: const Color(0xffDA1414));
        if (kDebugMode) {
          print("Error getting document: $e");
        }
      },
    );
  }

  // ignore: non_constant_identifier_names
  EditTap() {
    validate();
    if (isNameValidate.value == false &&
        isEmailValidate.value == false &&
        isAddressValidate.value == false &&
        isOccupationValidate.value == false &&
        isbirthValidate.value == false) {
      if (kDebugMode) {
        print("GO TO HOME PAGE");
      }

      Map<String, dynamic> map = {
        "City": PrefService.getString(PrefKeys.city),
        "Country": PrefService.getString(PrefKeys.country),
        "Email": PrefService.getString(PrefKeys.email),
        "Occupation": occupationController.text,
        "Phone": PrefService.getString(PrefKeys.phoneNumber),
        "State": PrefService.getString(PrefKeys.state),
        "fullName": fullNameController.text,
        "Dob": dateOfBirthController.text,
        "Address": addressController.text,
      };

      PrefService.setValue(
        PrefKeys.fullName,
        fullNameController.text,
      );
      PrefService.setValue(
        PrefKeys.occupation,
        occupationController.text,
      );
      PrefService.setValue(
        PrefKeys.address,
        addressController.text,
      );
      PrefService.setValue(
        PrefKeys.dateOfBirth,
        dateOfBirthController.text,
      );
      FirebaseFirestore.instance
          .collection("Auth")
          .doc("User")
          .collection("register")
          .doc(PrefService.getString(PrefKeys.userId))
          .update(map);
      if (kDebugMode) {
        print("GO TO HOME PAGE");
      }
      init();
      Get.back();

      Get.to(ProfileUserScreenU());
    }
  }

  validate() {
    if (fullNameController.text.isEmpty) {
      isNameValidate.value = true;
    } else {
      isNameValidate.value = false;
    }
    if (emailController.text.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(emailController.text)) {
      isEmailValidate.value = true;
    } else {
      isEmailValidate.value = false;
    }
    if (addressController.text.isEmpty) {
      isAddressValidate.value = true;
    } else {
      isAddressValidate.value = false;
    }
    if (occupationController.text.isEmpty) {
      isOccupationValidate.value = true;
    } else {
      isOccupationValidate.value = false;
    }
    if (dateOfBirthController.text.isEmpty) {
      isbirthValidate.value = true;
    } else {
      isbirthValidate.value = false;
    }
  }

  ontap() async {
    XFile? img = await picker.pickImage(source: ImageSource.camera);
    String path = img!.path;
    image = File(path);
    imagePicker();
    Get.back();
  }

  ontapGallery() async {
    XFile? gallery = await picker.pickImage(source: ImageSource.gallery);
    String path = gallery!.path;
    image = File(path);
    imagePicker();
    Get.back();
  }

  imagePicker() {
    update(['image']);
    update();
  }
}
