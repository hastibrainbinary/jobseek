import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jobseek/service/pref_services.dart';
import 'package:jobseek/utils/pref_keys.dart';

class ChatBoxUserController extends GetxController implements GetxService {
  TextEditingController searchController = TextEditingController();
  RxInt selectedJobs = 0.obs;
  RxList jobs = [
    "All chat",
    "Unread",
    "Archived",
  ].obs;
  onTapJobs(int index) {
    selectedJobs.value = index;
    //update(["hList"]);
  }

  RxList jobs2 = [
    "UI/UX Designer",
    "UI/UX Designer",
    "UI/UX Designer",
    "UI/UX Designer",
    "UI/UX Designer",
    "UI/UX Designer",
    "UI/UX Designer",
    "UI/UX Designer",
    "UI/UX Designer",
    "UI/UX Designer",
    "UI/UX Designer",
    "UI/UX Designer",
    "UI/UX Designer",
    "UI/UX Designer",
  ].obs;
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
      Get.put(ChatBoxUserController());
      // messageController.init();
    } else {
      debugPrint("INDEX IS 3");
      // profileController.init();
    }
    update(['bottom_bar']);
  }


  String? userUid;
  getUid() async {
    userUid = PrefService.getString(PrefKeys.userId).toString();

    update(["message"]);
  }
}