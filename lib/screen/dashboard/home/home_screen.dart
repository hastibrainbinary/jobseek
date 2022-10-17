import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobseek/screen/dashboard/home/home_controller.dart';
import 'package:jobseek/screen/dashboard/home/tipsforyou_screen.dart';
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
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Container(
      height: Get.height,
      width: Get.width,
      color: ColorRes.backgroundColor,
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          homeAppBar(),
          SizedBox(
            height: Get.height - 175,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 23),
                  searchArea(),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (con) => const TipsForYouScreen()));
                      },
                      child: tipsForYouSection()),
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
                          onTap: () =>
                              Get.toNamed(AppRes.jobRecommendationScreen),
                          child: Text(Strings.seeAll,
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: ColorRes.containerColor)),
                        ),
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
                                          color: ColorRes.containerColor,
                                          width: 2),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      color: controller.selectedJobs2.value ==
                                              index
                                          ? ColorRes.containerColor
                                          : ColorRes.white),
                                  child: Text(
                                    controller.jobs2[index],
                                    style: appTextStyle(
                                        color: controller.selectedJobs2.value ==
                                                index
                                            ? ColorRes.white
                                            : ColorRes.containerColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )),
                          );
                        }),
                  ),
                  StreamBuilder(
                      stream: fireStore.collection("allPost").snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        return snapshot.hasData
                            ? ListView.builder(
                                itemCount: snapshot.data.docs.length,
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  if (kDebugMode) {
                                    print(index);
                                  }
                                  if (kDebugMode) {
                                    print(snapshot.data!.docs[index].id);
                                  }
                                  return InkWell(
                                    onTap: () => Get.toNamed(
                                        AppRes.jobDetailScreen,
                                        arguments: {
                                          "saved":
                                              controller.jobTypesSaved[index%5],
                                          "docId": snapshot.data!.docs[index].id
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
                                          Image.asset(
                                              controller.jobTypesLogo[index%5]),
                                          const SizedBox(width: 20),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  // controller.jobTypes[index],
                                                  snapshot.data!.docs[index]["Position"],
                                                  style: appTextStyle(
                                                      color: ColorRes.black,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              Text(snapshot.data!.docs[index]["CompanyName"],
                                                  style: appTextStyle(
                                                      color: ColorRes.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                              Text(
                                                  "${snapshot.data!.docs[index]["location"]}  ${snapshot.data!.docs[index]["type"]}",
                                                  style: appTextStyle(
                                                      color: ColorRes.black,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w400)),
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
                                                    controller.jobTypesSaved[index%5]
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
                                                    color:
                                                        ColorRes.containerColor,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                          const SizedBox(width: 10)
                                        ],
                                      ),
                                    ),
                                  );
                                })
                            : const Center(
                                child: CircularProgressIndicator(),
                              );
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
