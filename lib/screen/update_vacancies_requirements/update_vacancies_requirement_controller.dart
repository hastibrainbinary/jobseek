import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/create_vacancies/create_vacancies_screen.dart';

class UpdateVacanciesRequirementController extends GetxController {

  final args = Get.arguments;

  List requirments=[];
  RxBool isJobDetails = true.obs;
  ontap() {
    isJobDetails.value = false;
    update();
  }

  RxBool text = false.obs;
  RxBool add = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initState(args);
  }

  TextEditingController positionController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  List requirmentList=[];
  RxBool isPositionValidate = false.obs;
  RxBool isSalaryValidate = false.obs;
  RxBool isLocationValidate = false.obs;
  RxBool isTypeValidate = false.obs;
  RxBool isStatusValidate = false.obs;
  onLoginBtnTap() async{
    validate();
    if (isPositionValidate.value == false &&
        isSalaryValidate.value == false &&
        isLocationValidate.value == false &&
        isTypeValidate.value == false &&
        isStatusValidate.value == false) {
      if (kDebugMode) {
        print("GO TO HOME PAGE");
      }


      Map<String, dynamic> map = {
        "Position": positionController.text.trim(),
        "salary": salaryController.text.trim(),
        "location": locationController.text.trim(),
        "type": typeController.text.trim(),
        "Status": statusController.text.trim(),
        "BookMarkUserId":[],
      };

      FirebaseFirestore.instance.collection("allPost").doc(args['docs'].id.toString()).update(
        map
      );

      Get.back();

    }
  }



  initState(dynamic data)async{
    positionController.text = data['docs']["Position"];
    salaryController.text =data['docs']["salary"];
    locationController.text =data['docs']["location"];
    typeController.text =data['docs']["type"];
    statusController.text =data['docs']["Status"];
    requirmentList = data['docs']['RequirementsList'];
    DocumentSnapshot document = await FirebaseFirestore.instance.collection("allPost").doc(args['docs'].id.toString()).get();
    var ref = document.data();
    print(ref);
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

  changeDropdwon({required String val}) {
    dropDownValue = val;
    locationController.text = dropDownValue;

    update(["dropdown"]);
  }
  String dropDownValue = 'India';
  var items1 = [
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
  changeDropwonType({required String val}) {
    dropDownValueType = val;
    typeController.text = dropDownValueType;

    update(["dropdown"]);
  }
  String dropDownValueType = 'part Time';

  var items = [
    'Part Time',
    'Full Time',
  ];



  changeDropdwonStatus({required String val}) {
    dropDownValueStatus = val;
    statusController.text = dropDownValueStatus;

    update(["dropdown"]);
  }
  String dropDownValueStatus = 'Active';
  var items2 = [
    'Active',
    'Away',
  ];



}
