import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobseek/screen/dashboard/home/home_controller.dart';
import 'package:jobseek/screen/dashboard/home/widgets/appbar.dart';
import 'package:jobseek/screen/dashboard/home/widgets/search_field.dart';
import 'package:jobseek/screen/dashboard/home/widgets/tips_for_you_section.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';
import 'package:jobseek/utils/string.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
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
                  Text(Strings.seeAll,
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ColorRes.containerColor))

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
            GetBuilder<HomeController>(
                id: "hList",
                builder: (con) {
                  return SizedBox(
                    height: 32,
                    child: ListView.builder(
                        itemCount: con.jobs2.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => con.onTapJobs2(index),
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
                                  color: index == con.selectedJobs2
                                      ? ColorRes.containerColor
                                      : ColorRes.white),
                              child: Text(
                                con.jobs2[index],
                                style: appTextStyle(
                                    color: index == con.selectedJobs2
                                        ? ColorRes.white
                                        : ColorRes.containerColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          );
                        }),
                  );
                }),
            const SizedBox(height: 20),
          
            ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    height: 92,
                    width: Get.width,
                    margin: const EdgeInsets.symmetric(horizontal: 18,vertical: 4),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
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
                  );
                })
          ],
        ),
      ),
    );
  }
}
