import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/job_recommendation_screen/job_recommendation_controller.dart';
import 'package:jobseek/service/pref_services.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/pref_keys.dart';

  JobRecommendationController jcon = Get.put(JobRecommendationController());
class HomeController extends GetxController implements GetxService {
  TextEditingController searchController = TextEditingController();

  RxList jobTypes = [
    "UI/UX Designer",
    "Financial planner",
    "UI/UX Designer",
    "Financial planner",
    "UI/UX Designer"
  ].obs;
  RxList jobTypesSaved = List.generate(2, (index) => false).obs;


  RxList jobTypesLogo = [
    AssetRes.airBnbLogo,
    AssetRes.twitterLogo,
    AssetRes.airBnbLogo,
    AssetRes.twitterLogo,
    AssetRes.airBnbLogo
  ].obs;

  @override
  void onInit() {
    super.onInit();
    getfirstName();
    jobTypesSaved = List.generate(jcon.documents.length, (index) => false).obs;
  }

  onTapSave(index,field,docId) {
    if (jobTypesSaved[index] == true) {
   //   jobTypesSaved[index] = false;

    //  FirebaseFirestore.instance.collection("BookMark").doc(docId).delete();
    } else {
      jobTypesSaved[index] = true;

      Map<String, dynamic> map = {
        "Position": field['Position'],
        "CompanyName": field['CompanyName'],
        "salary": field['salary'],
        "location": field['location'],
        "type": field['type'],
      };
      FirebaseFirestore.instance.collection('BookMark').doc().set(
       map
      );
    }
    }


  RxInt selectedJobs2 = 0.obs;
  RxList jobs2 = ["All Job", "Writer", "Design", "Finance"].obs;

  onTapJobs2(int index) {
    selectedJobs2.value = index;
    //update(["hList"]);
  }

  String? firstNAme;


  getfirstName() async {
    firstNAme = await PrefService.getString(PrefKeys.firstnameu);
  }
}
