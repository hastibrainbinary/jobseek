import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController implements GetxService{
  TextEditingController searchController = TextEditingController();


  // RxInt selectedJobs = 0.obs;
  // RxList jobs = ["All Job", "Writer", "Design", "Finance"].obs;
  // onTapJobs(int index){
  //   debugPrint("OnTAP $index");
  //   selectedJobs.value = index;
  // }


  RxInt selectedJobs2 = 0.obs;
  RxList jobs2 = ["All Job", "Writer", "Design", "Finance"].obs;

   onTapJobs2(int index){
     selectedJobs2.value = index;
    //update(["hList"]);
  }
}
