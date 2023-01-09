import 'package:get/get.dart';
import 'package:jobseek/localization/localization_file.dart';
import 'package:jobseek/screen/manager_section/dashboard/manager_dashboard_screen.dart';

class LocalizationControllerM extends GetxController implements GetxService {
  RxList<RxString> language =
      ["English".obs, "Spanish".obs, "hindi".obs, "arabic".obs].obs;
  RxList<RxBool> selectedLanguage =
      [false.obs, true.obs, false.obs, true.obs].obs;

  void onSelectLang(int index) {
    if (index == 0) {
      selectedLanguage.value = [];
      for (int i = 0; i <= language.length; i++) {
        if (i == index) {
          selectedLanguage.add(false.obs);
        } else {
          selectedLanguage.add(true.obs);
        }
      }

      LocalizationService().changeLocale("English");
      Get.offAll(ManagerDashBoardScreen());
    } else if (index == 1) {
      selectedLanguage.value = [];
      for (int i = 0; i <= language.length; i++) {
        if (i == index) {
          selectedLanguage.add(false.obs);
        } else {
          selectedLanguage.add(true.obs);
        }
      }

      LocalizationService().changeLocale("Spanish");
      Get.offAll(ManagerDashBoardScreen());
    } else if (index == 2) {
      selectedLanguage.value = [];
      for (int i = 0; i <= language.length; i++) {
        if (i == index) {
          selectedLanguage.add(false.obs);
        } else {
          selectedLanguage.add(true.obs);
        }
      }

      LocalizationService().changeLocale("hindi");
      Get.offAll(ManagerDashBoardScreen());
    } else if (index == 3) {
      selectedLanguage.value = [];
      for (int i = 0; i <= language.length; i++) {
        if (i == index) {
          selectedLanguage.add(false.obs);
        } else {
          selectedLanguage.add(true.obs);
        }
      }

      LocalizationService().changeLocale("arabic");
      Get.offAll(ManagerDashBoardScreen());
    }
  }
}
