import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/add_requirements/add_requirements_screen.dart';
import 'package:jobseek/screen/manager_section/Jobdetails/Jobdetails_screen.dart';
import 'package:jobseek/service/pref_services.dart';
import 'package:jobseek/utils/pref_keys.dart';

class CreateVacanciesController extends GetxController implements GetxService {
  TextEditingController positionController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  RxBool isPositionValidate = false.obs;
  RxBool isSalaryValidate = false.obs;
  RxBool isLocationValidate = false.obs;
  RxBool isTypeValidate = false.obs;
  RxBool isCategoryValidate = false.obs;
  RxBool isStatusValidate = false.obs;
  String companyName = "";
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;
  List<TextEditingController> addRequirementsList = [];
RxBool loader = false.obs;
  onTapNextBut() {
    final docRef = fireStore
        .collection("Auth")
        .doc("Manager")
        .collection("register")
        .doc(PrefService.getString(PrefKeys.userId))
        .collection("company")
        .doc("details");
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        companyName = data["name"];
        // ...
      },
      onError: (e) => print("Error getting document: $e"),
    );

    Get.to(RequirementsScreen());
  }

  void onTapBack(String value) {
    if (value == "require") {
      addRequirementsList = [];
    } else if (value == "vacancies") {
      positionController.clear();
      salaryController.clear();
      locationController.clear();
      typeController.clear();
      categoryController.clear();
      statusController.clear();
      isPositionValidate.value = false;
      isSalaryValidate.value = false;
      isLocationValidate.value = false;
      isTypeValidate.value = false;
      isCategoryValidate.value = false;
      isStatusValidate.value = false;
      companyName = "";
    } else {
      positionController.clear();
      salaryController.clear();
      locationController.clear();
      typeController.clear();
      categoryController.clear();
      statusController.clear();
      isPositionValidate.value = false;
      isSalaryValidate.value = false;
      isLocationValidate.value = false;
      isTypeValidate.value = false;
      isCategoryValidate.value = false;
      isStatusValidate.value = false;

      companyName = "";
      addRequirementsList = [];
    }
    update();
  }

  onTapAddRequirements() {
    addRequirementsList.add(TextEditingController());
    update(["requirement"]);
  }

  void onChanged(String value) {
    update(["colorChange"]);
  }

  onTapNext() async {
    loader.value = true;
    String uid = PrefService.getString(PrefKeys.userId);
    int totalPost = PrefService.getInt(PrefKeys.totalPost);
    String pUid = "$uid*${totalPost + 1}";

    List<String> requirementsList = List.generate(
        addRequirementsList.length, (index) => addRequirementsList[index].text);
    print(requirementsList);

    if (kDebugMode) {
      print("**************$totalPost");
    }
    Map<String, dynamic> map = {
      "Position": positionController.text.trim(),
      "salary": salaryController.text.trim(),
      "location": locationController.text.trim(),
      "type": typeController.text.trim(),
      " Category": categoryController.text.trim(),
      "Status": statusController.text.trim(),
      "CompanyName": companyName,
      "RequirementsList": requirementsList,
      "BookMarkUserList":[],
    };
    validate();
    if (isPositionValidate.value == false &&
        isSalaryValidate.value == false &&
        isLocationValidate.value == false &&
        isTypeValidate.value == false &&
        isCategoryValidate.value == false &&
        isStatusValidate.value == false) {
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
            .update({"TotalPost": totalPost + 1});

        await fireStore
            .collection("category")
            .doc(categoryController.text.trim())
            .collection(categoryController.text.trim())
            .doc()
            .set(map);
        PrefService.setValue(PrefKeys.totalPost, totalPost + 1);
        onTapBack("");
        Get.off(() => JobDetailsScreen(
              isError: true,
            ));
      });
    }
    loader.value = false;

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
      if (categoryController.text.isEmpty) {
        isCategoryValidate.value = true;
      } else {
        isCategoryValidate.value = false;
      }
      if (statusController.text.isEmpty) {
        isStatusValidate.value = true;
      } else {
        isStatusValidate.value = false;
      }
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

  changeCategory({required String val}) {
    dropDownValueCategory = val;
    categoryController.text = dropDownValueCategory!;
    update(["Category"]);
  }

  String? dropDownValueStatus;
  changeStatus({required String val}) {
    dropDownValueStatus = val;
    statusController.text = dropDownValueStatus!;
    update(["Category"]);
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
  String? dropDownValueCategory;

  var itemsCategory = [
    'Writer',
    'Design',
    'Finance',
  ];
  var itemsStatus = [
    'Active',
    'Inactive',
  ];
}
