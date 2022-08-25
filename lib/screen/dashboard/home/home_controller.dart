import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();


  // RxInt selectedJobs = 0.obs;
  // RxList jobs = ["All Job", "Writer", "Design", "Finance"].obs;
  // onTapJobs(int index){
  //   debugPrint("OnTAP $index");
  //   selectedJobs.value = index;
  // }


  int selectedJobs2 = 0;
  List jobs2 = ["All Job", "Writer", "Design", "Finance"];

   onTapJobs2(int index){
    debugPrint("OnTAP");
    selectedJobs2 = index;
    update(["hList"]);
  }
}
