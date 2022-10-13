import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/common/widgets/backButton.dart';
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
                const SizedBox(width: 10),
                Text(
                  'Job Recommendation',
                  style: appTextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      height: 1,
                      color: ColorRes.black),
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
            SizedBox(
              height: Get.height * 0.65,
              child: StreamBuilder(
                stream: fireStore.collection("allPost").snapshots(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: snapshot.data.docs.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => Get.toNamed(AppRes.jobDetailScreen,
                                  arguments: {
                                    "saved": controller.jobTypesSaved[index]
                                  }),
                              child: Container(
                                height: 92,
                                width: Get.width,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 4),
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    border: Border.all(
                                        color: const Color(0xffF3ECFF)),
                                    color: ColorRes.white),
                                child: Row(
                                  children: [
                                    Image.asset(controller.jobTypesLogo[index]),
                                    const SizedBox(width: 20),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            // controller.jobTypes[index],
                                            snapshot.data!.docs[index]
                                                ["Position"],
                                            style: appTextStyle(
                                                color: ColorRes.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500)),
                                        Text("AirBNB",
                                            style: appTextStyle(
                                                color: ColorRes.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400)),
                                        Text(
                                            "${snapshot.data!.docs[index]["location"]}  ${snapshot.data!.docs[index]["type"]}",
                                            style: appTextStyle(
                                                color: ColorRes.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            controller.onTapSave(index);
                                          },
                                          child: Obx(() {
                                            return Image.asset(
                                              controller.jobTypesSaved[index]
                                                  ? AssetRes.bookMarkFillIcon
                                                  : AssetRes.bookMarkBorderIcon,
                                              height: 20,
                                            );
                                          }),
                                        ),
                                        const Spacer(),
                                        Text(
                                          "\$${snapshot.data!.docs[index]["salary"]}",
                                          style: appTextStyle(
                                              fontSize: 16,
                                              color: ColorRes.containerColor,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                    const SizedBox(width: 10)
                                  ],
                                ),
                              ),
                            );
                          })
                      : Center(
                          child: Container(
                            padding: const EdgeInsets.all(35),
                            height: 110,
                            width: 110,
                            decoration: BoxDecoration(
                                color: ColorRes.white,
                                borderRadius: BorderRadius.circular(25)),
                            child: const CircularProgressIndicator(
                              backgroundColor: Color(0xffE2D3FE),
                              color: ColorRes.containerColor,
                            ),
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
