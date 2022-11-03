import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManagerApplicationScreenController extends GetxController
    implements GetxService {
  TextEditingController searchController = TextEditingController();
  RxString searchText = ''.obs;


  RxInt selectedJobs2 = 0.obs;
  RxList jobs2 = [
    "All Vacancies",
    "Active",
    "Inactive",
  ].obs;

  onTapJobs2(int index) {
    selectedJobs2.value = index;
    update(["status"]);
  }
}
