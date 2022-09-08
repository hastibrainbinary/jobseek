import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:  [
            const SizedBox(height: 60,),
            SizedBox(
              height: 45,
              width: Get.width,
              child: Stack(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    padding: const EdgeInsets.only(left: 10),
                    margin: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: ColorRes.logoColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: ColorRes.containerColor,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Center(
                      child: Text(
                        "Job Recommendation",
                        style: appTextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30,),
            searchArea(),
            const SizedBox(height: 30,),
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
              height: Get.height*0.65,
              child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Get.toNamed(AppRes.jobDetailScreen),
                      child: Container(
                        height: 92,
                        width: Get.width,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 4),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                            border: Border.all(color: const Color(0xffF3ECFF)),
                            color: ColorRes.white),
                        child: Row(
                          children: [
                            Image.asset(AssetRes.airBnbLogo),
                            const SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("UI/UX Designer",
                                    style: appTextStyle(
                                        color: ColorRes.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                                Text("AirBNB",
                                    style: appTextStyle(
                                        color: ColorRes.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400)),
                                Text("United States - Full Time",
                                    style: appTextStyle(
                                        color: ColorRes.black,
                                        fontSize: 9,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Image.asset(
                                  AssetRes.bookMarkFillIcon,
                                  height: 20,
                                ),
                                const Spacer(),
                                Text(
                                  "\$2.350",
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
                  }),
            ),


          ],
        ),
      ),
    );
  }
}
