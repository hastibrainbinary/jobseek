import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/common/widgets/back_button.dart';
import 'package:jobseek/screen/manager_section/Settings/localization_controller.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/color_res.dart';
import 'package:jobseek/utils/string.dart';

// ignore: must_be_immutable
class LocalizationScreenM extends StatelessWidget {
  LocalizationScreenM({Key? key}) : super(key: key);

  LocalizationControllerM localizationControllerM =
      Get.put(LocalizationControllerM());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: backButton(),
                ),
              ),
              const SizedBox(width: 55),
              Text(
                Strings.chooseLanguage,
                style: appTextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    height: 1,
                    color: ColorRes.black),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Obx(
            () => ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 15),
              itemCount: localizationControllerM.language.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => localizationControllerM.onSelectLang(index),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 70),
                    height: 50,
                    decoration: BoxDecoration(
                      color: ColorRes.white,
                      border: Border.all(color: ColorRes.containerColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        localizationControllerM.language[index].value,
                        style: const TextStyle(
                            color: ColorRes.containerColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
