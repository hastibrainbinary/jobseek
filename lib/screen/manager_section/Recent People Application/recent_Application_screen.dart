import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/common/widgets/backButton.dart';

import 'package:jobseek/screen/dashboard/home/widgets/search_field.dart';
import 'package:jobseek/screen/manager_section/manager_home_screen/manager_home_screen_controller.dart';

import 'package:jobseek/screen/manager_section/manager_home_screen/manager_home_screen_widget/manager_home_screen_widget.dart';
import 'package:jobseek/utils/app_res.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/color_res.dart';

class RecentApplicationScreen extends StatelessWidget {
  const RecentApplicationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorRes.backgroundColor,
      body: Column(
        children: [
          const SizedBox(height: 55),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: backButton(),
                ),
              ),
              SizedBox(width: Get.width - 350),
              Text(
                'Recent People Application',
                style: appTextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    height: 1,
                    color: ColorRes.black),
              ),
            ],
          ),
          const SizedBox(height: 5),

        //  searchArea(),
        //   const SizedBox(height: 12),
          GetBuilder<ManagerHomeScreenController>(
            id: "userDataSeeAll",
            builder: (con) {
              return Expanded(
                child:  Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: InkWell(
                            onTap: () => Get.toNamed(AppRes.applicantsDetails),
                            child: recentPeopleBox()),
                      ),
              );
            }
          ),
        ],
      ),
    );
  }
}
