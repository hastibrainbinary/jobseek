import 'package:get/get.dart';
import 'package:jobseek/localization/localization_file.dart';

class LocalizationControllerU extends GetxController implements GetxService {
  RxList<RxString> languageU =
      ["English".obs, "Spanish".obs, "hindi".obs, "arabic".obs].obs;
  RxList<RxBool> selectedLanguageU =
      [false.obs, true.obs, false.obs, true.obs].obs;

  void onSelectLang(int index) {
    if (index == 0) {
      selectedLanguageU.value = [];
      for (int i = 0; i <= languageU.length; i++) {
        if (i == index) {
          selectedLanguageU.add(false.obs);
        } else {
          selectedLanguageU.add(true.obs);
        }
      }

      LocalizationService().changeLocale("English");
      //Get.offAll(ManagerDashBoardScreen());
    } else if (index == 1) {
      selectedLanguageU.value = [];
      for (int i = 0; i <= languageU.length; i++) {
        if (i == index) {
          selectedLanguageU.add(false.obs);
        } else {
          selectedLanguageU.add(true.obs);
        }
      }

      LocalizationService().changeLocale("Spanish");
      // Get.offAll(ManagerDashBoardScreen());
    } else if (index == 2) {
      selectedLanguageU.value = [];
      for (int i = 0; i <= languageU.length; i++) {
        if (i == index) {
          selectedLanguageU.add(false.obs);
        } else {
          selectedLanguageU.add(true.obs);
        }
      }

      LocalizationService().changeLocale("hindi");
      //Get.offAll(ManagerDashBoardScreen());
    } else if (index == 3) {
      selectedLanguageU.value = [];
      for (int i = 0; i <= languageU.length; i++) {
        if (i == index) {
          selectedLanguageU.add(false.obs);
        } else {
          selectedLanguageU.add(true.obs);
        }
      }

      LocalizationService().changeLocale("arabic");
      //Get.offAll(ManagerDashBoardScreen());
    }
  }
}
