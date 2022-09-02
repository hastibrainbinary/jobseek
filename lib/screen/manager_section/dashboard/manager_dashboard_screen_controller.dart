import 'package:flutter/foundation.dart';
import 'package:get/get.dart';


class ManagerDashBoardScreenController extends GetxController implements GetxService{
  RxInt currentTab = 0.obs;
  void onBottomBarChange(int index) {
    currentTab.value = index;
    if (index == 0) {
      debugPrint("INDEX IS 0");
     /* Get.put(ManagerHomeScreen());*/
      // homeController.init();
    } else if (index == 1) {
      debugPrint("INDEX IS 1");
      // searchController.init();
    } else if (index == 2) {
      debugPrint("INDEX IS 2");
      // messageController.init();
    } else {
      debugPrint("INDEX IS 3");
      // profileController.init();
    }
    update(['bottom_bar']);
  }
}