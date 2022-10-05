import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/create_vacancies/create_vacancies_screen.dart';

class UpdateVacanciesRequirementController extends GetxController {
  RxBool isJobDetails = true.obs;
  ontap() {
    isJobDetails.value = false;
    update();
  }

  RxBool text = false.obs;
  RxBool add = true.obs;

  TextEditingController positionController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  RxBool isPositionValidate = false.obs;
  RxBool isSalaryValidate = false.obs;
  RxBool isLocationValidate = false.obs;
  RxBool isTypeValidate = false.obs;
  RxBool isStatusValidate = false.obs;
  onLoginBtnTap() {
    validate();
    if (isPositionValidate.value == false &&
        isSalaryValidate.value == false &&
        isLocationValidate.value == false &&
        isTypeValidate.value == false &&
        isStatusValidate.value == false) {
      print("GO TO HOME PAGE");
      Get.to(const CreateVacanciesScreen());
    }
  }

  validate() {
    if (positionController.text.isEmpty) {
      isPositionValidate.value = true;
    } else {
      isPositionValidate.value = false;
    }
    if (salaryController.text.isEmpty) {
      isSalaryValidate.value = true;
    } else {
      isSalaryValidate.value = false;
    }
    if (locationController.text.isEmpty) {
      isLocationValidate.value = true;
    } else {
      isLocationValidate.value = false;
    }
    //  if (dropDownValueLocation.value.isEmpty ||
    //      dropDownValueLocation.value == "")
    // {
    //   isLocationValidate.value = true;
    // } else {
    //   isLocationValidate.value = false;
    // }
    if (typeController.text.isEmpty) {
      isTypeValidate.value = true;
    } else {
      isTypeValidate.value = false;
    }
    if (statusController.text.isEmpty) {
      isStatusValidate.value = true;
    } else {
      isStatusValidate.value = false;
    }
  }

  RxString dropDownValueLocation = "".obs;

  onChangeLocation(String val) {
    dropDownValueLocation.value = val;
  }

  var items = [
    'India',
    'United States',
    'Europe',
    'china',
    'United Kingdom',
  ];
  String? dropDownValueType;

  var items1 = [
    'Part Time',
    'Full Time',
  ];
  String? dropDownValueStatus;
  var items2 = [
    'Active',
    "full",
    'Away',
  ];
}
