import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/service/pref_services.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/pref_keys.dart';

class HomeController extends GetxController implements GetxService {
  TextEditingController searchController = TextEditingController();


  RxList jobTypes = [
    "UI/UX Designer",
    "Financial planner",
    "UI/UX Designer",
    "Financial planner",
    "UI/UX Designer"
  ].obs;
  RxList jobTypesSaved = [true, false, false, true, false].obs;
  RxList jobTypesLogo = [
    AssetRes.airBnbLogo,
    AssetRes.twitterLogo,
    AssetRes.airBnbLogo,
    AssetRes.twitterLogo,
    AssetRes.airBnbLogo
  ].obs;



  onTapSave(index) {
    if (jobTypesSaved[index] == true) {
      jobTypesSaved.removeAt(index);
      jobTypesSaved.insert(index, false);
    } else {
      jobTypesSaved.removeAt(index);
      jobTypesSaved.insert(index, true);
    }
  }

  RxList allJob = [].obs;

  // RxInt selectedJobs = 0.obs;
  // RxList jobs = ["All Job", "Writer", "Design", "Finance"].obs;
  // onTapJobs(int index){
  //   debugPrint("OnTAP $index");
  //   selectedJobs.value = index;
  // }

  RxInt selectedJobs2 = 0.obs;
  RxList jobs2 = ["All Job", "Writer", "Design", "Finance"].obs;

  onTapJobs2(int index) {
    selectedJobs2.value = index;
    //update(["hList"]);
  }
  String?  firstNAme;
  @override
  void onInit() {
    getfirstName();
    super.onInit();
  }
  getfirstName()async{
    firstNAme = await PrefService.getString(PrefKeys.firstnameu);
  }
}
