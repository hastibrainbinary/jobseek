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
  RxBool isPositionValidate = false.obs;
  RxBool isSalaryValidate = false.obs;
  RxBool isLocationValidate = false.obs;
  RxBool isTypeValidate = false.obs;
  String companyName = "";
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;
  List<TextEditingController> addRequirementsList = [];


  onTapNextBut(){
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

  void onTapBack(String value){
    if(value == "require"){
      addRequirementsList = [];
    }else if(value == "vacancies"){
      positionController.clear();
      salaryController.clear();
      locationController.clear();
      typeController.clear();
      isPositionValidate.value = false;
      isSalaryValidate.value = false;
      isLocationValidate.value = false;
      isTypeValidate.value = false;
      companyName = "";
    }else{
      positionController.clear();
      salaryController.clear();
      locationController.clear();
      typeController.clear();
      isPositionValidate.value = false;
      isSalaryValidate.value = false;
      isLocationValidate.value = false;
      isTypeValidate.value = false;
      companyName = "";
      addRequirementsList = [];
    }
    update();
  }

  onTapAddRequirements(){
    addRequirementsList.add(TextEditingController());
    update(["requirement"]);
  }
  void onChanged(String value){
    update(["colorChange"]);
  }
  onTapNext() async {
    String uid = PrefService.getString(PrefKeys.userId);
    int totalPost = PrefService.getInt(PrefKeys.totalPost);
    String pUid = "$uid*${totalPost + 1}";
    List<String> requirementsList = List.generate(addRequirementsList.length, (index) => addRequirementsList[index].text);
    print(requirementsList);
    if (kDebugMode) {
      print("**************$totalPost");
    }
    Map<String, dynamic> map = {
      "Position": positionController.text.trim(),
      "salary": salaryController.text.trim(),
      "location": locationController.text.trim(),
      "type": typeController.text.trim(),
      "Status": "Active",
      "CompanyName": companyName,
      "RequirementsList": requirementsList,
    };
    validate();
    if (isPositionValidate.value == false &&
        isSalaryValidate.value == false &&
        isLocationValidate.value == false &&
        isTypeValidate.value == false) {
      await fireStore.collection('allPost').doc(pUid).set(map).then((value) async {
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
            .update({"TotalPost": totalPost+1});
        PrefService.setValue(PrefKeys.totalPost, totalPost + 1);
        onTapBack("");
        Get.off(()=>JobDetailsScreen(isError: true,));
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
