import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/utils/asset_res.dart';

class HomeController extends GetxController implements GetxService {
  TextEditingController searchController = TextEditingController();

  RxList jobTypes =
      ["UI/UX Designer", "Financial Olanner", "UI/UX Designer"].obs;
  RxList jobTypesSaved = [true, false, false].obs;
  RxList jobTypesLogo =
      [AssetRes.airBnbLogo, AssetRes.twitterLogo, AssetRes.airBnbLogo].obs;

  onTapSave(index) {
    if (jobTypesSaved[index] == true) {
      jobTypesSaved.removeAt(index);
      jobTypesSaved.insert(index, false);
    } else {
      jobTypesSaved.removeAt(index);
      jobTypesSaved.insert(index, true);
    }
  }

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
}
