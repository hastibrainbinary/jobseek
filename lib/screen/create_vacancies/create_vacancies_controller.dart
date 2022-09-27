import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/add_requirements/add_requirements_screen.dart';

class CreateVacanciesController extends GetxController implements GetxService {
  TextEditingController positionController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  RxBool isPositionValidate = false.obs;
  RxBool isSalaryValidate = false.obs;
  RxBool isLocationValidate = false.obs;
  RxBool isTypeValidate = false.obs;
  onLoginBtnTap() {
    validate();
    if (isPositionValidate.value == false &&
        isSalaryValidate.value == false &&
        isLocationValidate.value == false &&
        isTypeValidate.value == false) {
      print("GO TO HOME PAGE");
      Get.to(RequirementsScreen());
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
    if (typeController.text.isEmpty) {
      isTypeValidate.value = true;
    } else {
      isTypeValidate.value = false;
    }
  }
}
