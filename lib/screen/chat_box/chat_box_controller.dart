import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatBoxController extends GetxController implements GetxService {
  TextEditingController searchController = TextEditingController();
  RxInt selectedJobs = 0.obs;
  RxList jobs = ["All chat", "Unread", "Archived",].obs;
  onTapJobs(int index){
    selectedJobs.value = index;
    //update(["hList"]);
  }
  int currentTab = 0;
  void onBottomBarChange(int index) {
    currentTab = index;
    if (index == 0) {
      debugPrint("INDEX IS 0");

      // homeController.init();
    } else if (index == 1) {
      debugPrint("INDEX IS 1");
      // searchController.init();
    } else if (index == 2) {
      debugPrint("INDEX IS 2");
      Get.put(ChatBoxController());
      // messageController.init();
    } else {
      debugPrint("INDEX IS 3");
      // profileController.init();
    }
    update(['bottom_bar']);
  }

}