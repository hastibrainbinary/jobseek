import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobseek/screen/dashboard/home/home_controller.dart';
import 'package:jobseek/screen/dashboard/home/widgets/appbar.dart';
import 'package:jobseek/screen/dashboard/home/widgets/search_field.dart';
import 'package:jobseek/screen/dashboard/home/widgets/tips_for_you_section.dart';
import 'package:jobseek/utils/app_res.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';
import 'package:jobseek/utils/string.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Container(
      height: Get.height,
      width: Get.width,
      color: ColorRes.backgroungColor,
      // padding: const EdgeInsets.symmetric(horizontal: 18),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            homeAppBar(),
            const SizedBox(height: 23),
            searchArea(),
            tipsForYouSection(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  Text(
                    Strings.jobRecommendation,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: ColorRes.black,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => Get.toNamed(AppRes.jobRecommendationScreen),
                    child: Text(Strings.seeAll,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ColorRes.containerColor)),
                  )

                  // Text("See all",style: GoogleFonts.poppins(fontSize: ),)
                ],
              ),
            ),

            ///listview using obx
            /*  SizedBox(
              height: 32,
              child: Obx(() {
                return ListView.builder(
                    itemCount: controller.jobs.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: ()=>controller.onTapJobs(index),
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 32,
                          width: 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorRes.containerColor, width: 2),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: index == controller.selectedJobs.value
                                  ? ColorRes.containerColor
                                  : ColorRes.white),
                          child: Text(
                            controller.jobs[index],
                            style: appTextStyle(
                                color: index == controller.selectedJobs.value
                                    ? ColorRes.white
                                    : ColorRes.containerColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      );
                    });
              }),
            ),*/

            const SizedBox(height: 18),
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

            ListView.builder(
                itemCount: controller.jobTypes.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Get.toNamed(AppRes.jobDetailScreen,arguments: {"saved":controller.jobTypesSaved[index]}),
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
                          Image.asset(controller.jobTypesLogo[index]),
                          const SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(controller.jobTypes[index],
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
          ],
        ),
      ),
    );
  }
}
