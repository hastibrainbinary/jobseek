import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/create_vacancies_2/create_vacancies_2_screen.dart';
import 'package:jobseek/service/pref_services.dart';
import 'package:jobseek/utils/pref_keys.dart';

class CreateVacanciesController extends GetxController implements GetxService {
  TextEditingController positionController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  RxBool isPositionValidate = false.obs;
  RxBool isSalaryValidate = false.obs;
  RxBool isLocationValidate = false.obs;
  RxBool isTypeValidate = false.obs;
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;

  onTapNextBut(){
    Get.to(CreateVacancies2Screen());
  }

  onTapNext() async {
    String uid = PrefService.getString(PrefKeys.userId);
    int totalPost = PrefService.getInt(PrefKeys.totalPost);
    String pUid = "$uid*${totalPost + 1}";
    if (kDebugMode) {
      print("**************$totalPost");
    }
    Map<String, dynamic> map = {
      "Position": positionController.text.trim(),
      "salary": salaryController.text.trim(),
      "location": locationController.text.trim(),
      "type": typeController.text.trim(),
      "Status": "Active",
    };
    validate();
    if (isPositionValidate.value == false &&
        isSalaryValidate.value == false &&
        isLocationValidate.value == false &&
        isTypeValidate.value == false) {
      await fireStore
          .collection('allPost')
          .doc(pUid)
          .set(map)
          .then((value) async {
        fireStore
            .collection("Auth")
            .doc("Manager")
            .collection("register")
            .doc(uid)
            .collection("post")
            .doc(pUid);

        await fireStore
            .collection("Auth")
            .doc("Manager")
            .collection("register")
            .doc(uid)
            .update({"TotalPost": totalPost});

        PrefService.setValue(PrefKeys.totalPost, totalPost + 1);

      });
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

  changeDropwon({required String val}) {
    dropDownValueLocation = val;
    locationController.text = dropDownValueLocation!;

    update(["Location"]);
  }

  changetype({required String val}) {
    dropDownValueType = val;
    typeController.text = dropDownValueType!;
    update(["type"]);
  }

  String? dropDownValueLocation;

  var items = [
    'India',
    'United States',
    'Europe',
    'china',
    'United Kingdom',
  ];

  String? dropDownValueType;

  var items1 = [
    'Part time',
    'Full time',
  ];
}
