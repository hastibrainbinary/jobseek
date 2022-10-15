import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobseek/screen/manager_section/dashboard/manager_dashboard_screen.dart';
import 'package:jobseek/service/pref_services.dart';
import 'package:jobseek/utils/pref_keys.dart';

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

  void onChanged(String value){
    update(["colorChange"]);
  }


  onLoginBtnTap() async {
    String uid = PrefService.getString(PrefKeys.userId);
    Map<String, dynamic> map = {
      "email": companyEmailController.text.trim(),
      "name": companyNameController.text.trim(),
      "date": dateController.text.trim(),
      "country": countryController.text.trim(),
      "address": companyAddressController.text.trim(),
    };
    validate();
    if (isNameValidate.value == false &&
        isEmailValidate.value == false &&
        isAddressValidate.value == false &&
        isCountryValidate.value == false &&
        isDateValidate.value == false) {
      await fireStore
          .collection("Auth")
          .doc("Manager")
          .collection("register")
          .doc(uid)
          .update({
        "company": true,
      });
      PrefService.setValue(PrefKeys.company, true);
      await fireStore
          .collection("Auth")
          .doc("Manager")
          .collection("register")
          .doc(uid)
          .collection("company")
          .doc("details")
          .set(map)
          .then((value) {
        Get.off(ManagerDashBoardScreen());
      });
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
      startTime = picked;
      if (kDebugMode) {
        print("START TIME : $startTime");
      }
      dateController.text =
          "${picked.toLocal().month}/${picked.toLocal().day}/${picked.toLocal().year}";
      update();
    }
  }

  changeDropdwon({required String val}) {
    dropDownValue = val;
    countryController.text = dropDownValue;

    update(["dropdown"]);
  }

  String dropDownValue = 'India';

  var items = [
    'India',
    'United States',
    'Europe',
    'china',
    'United Kingdom',
    " Cuba",
    "	Havana",
    "Cyprus",
    "Nicosia",
    "Czech ",
    "Republic",
    "Prague",
  ];

  onTapGallery1() async {
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
