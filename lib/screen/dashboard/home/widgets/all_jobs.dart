import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/dashboard/home/home_controller.dart';
import 'package:jobseek/screen/job_recommendation_screen/job_recommendation_controller.dart';
import 'package:jobseek/utils/app_res.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

Widget allJobs(Stream stream){
  final HomeController controller = HomeController();

  final jrController = Get.put(JobRecommendationController());
  return StreamBuilder(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

        jrController.documents = snapshot.data.docs;



        if (jrController.searchText.value.isNotEmpty) {
          jrController.documents = jrController.documents.where((element) {

            //print(element.get('Position'));
            return element
                .get('Position')
                .toString()
                .toLowerCase()
                .contains(jrController.searchText.value.toLowerCase());

          }).toList();
        }

        return snapshot.hasData
            ? ListView.builder(
            itemCount: jrController.documents.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              if (kDebugMode) {
                print(index);
              }
              if (kDebugMode) {
                print(jrController.documents[index].id);
              }
              return InkWell(
                onTap: () => Get.toNamed(
                    AppRes.jobDetailScreen,
                    arguments: {
                      "saved": controller
                          .jobTypesSaved[index % 5],
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
                      Image.asset(controller
                          .jobTypesLogo[index % 5]),
                      const SizedBox(width: 20),
                      Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            // controller.jobTypes[index],
                              jrController.documents[index]
                              ["Position"],
                              style: appTextStyle(
                                  color: ColorRes.black,
                                  fontSize: 15,
                                  fontWeight:
                                  FontWeight.w500)),
                          Text(
                              jrController.documents[index]
                              ["CompanyName"],
                              style: appTextStyle(
                                  color: ColorRes.black,
                                  fontSize: 12,
                                  fontWeight:
                                  FontWeight.w400)),
                          Text(
                              "${jrController.documents[index]["location"]}  ${jrController.documents[index]["type"]}",
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
                                controller.jobTypesSaved[
                                index % 5]
                                    ? AssetRes
                                    .bookMarkFillIcon
                                    : AssetRes
                                    .bookMarkBorderIcon,
                                height: 20,
                              );
                            }),
                          ),
                          const Spacer(),
                          Text(
                            "\$${jrController.documents[index]["salary"]}",
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
      });
}