import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/common/widgets/backButton.dart';
import 'package:jobseek/screen/dashboard/home/home_controller.dart';
import 'package:jobseek/screen/dashboard/home/widgets/all_jobs.dart';
import 'package:jobseek/screen/dashboard/home/widgets/search_field.dart';
import 'package:jobseek/screen/job_recommendation_screen/job_recommendation_controller.dart';
import 'package:jobseek/utils/app_res.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class JobRecommendation extends StatelessWidget {
  const JobRecommendation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(JobRecommendationController());
    FirebaseFirestore fireStore = FirebaseFirestore.instance;

    return Scaffold(
      backgroundColor: ColorRes.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: backButton(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Job recommendation',
                      style: appTextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          height: 1,
                          color: ColorRes.black),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            searchArea(),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: 32,
              child: ListView.builder(
                  itemCount: controller.jobs2.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => controller.onTapJobs2(index),
                      child: Obx(() => Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 32,
                            width: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorRes.containerColor, width: 2),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: controller.selectedJobs2.value == index
                                    ? ColorRes.containerColor
                                    : ColorRes.white),
                            child: Text(
                              controller.jobs2[index],
                              style: appTextStyle(
                                  color: controller.selectedJobs2.value == index
                                      ? ColorRes.white
                                      : ColorRes.containerColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                    );
                  }),
            ),
            Obx(() => controller.selectedJobs2.value == 0
                ? allJobs(fireStore.collection("allPost").snapshots())
                : controller.selectedJobs2.value == 1
                    ? allJobs(fireStore
                        .collection("category")
                        .doc("Writer")
                        .collection("Writer")
                        .snapshots())
                    : controller.selectedJobs2.value == 2
                        ? allJobs(fireStore
                            .collection("category")
                            .doc("Design")
                            .collection("Design")
                            .snapshots())
                        : controller.selectedJobs2.value == 3
                            ? allJobs(fireStore
                                .collection("category")
                                .doc("Finance")
                                .collection("Finance")
                                .snapshots())
                            : Center(
                                child: Text(controller
                                    .jobs2[controller.selectedJobs2.value]),
                              )),
          ],
        ),
      ),
    );
  }
}
