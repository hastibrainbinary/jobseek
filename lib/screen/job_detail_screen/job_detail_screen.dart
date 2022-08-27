import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/job_detail_screen/job_detail_controller.dart';
import 'package:jobseek/screen/job_detail_screen/job_detail_widget/job_detail_widget.dart';
import 'package:jobseek/screen/job_detail_screen/job_detail_widget/job_details_appbar.dart';
import 'package:jobseek/utils/app_res.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';
import 'package:jobseek/utils/string.dart';

class JobDetailScreen extends StatelessWidget {
  JobDetailScreen({Key? key}) : super(key: key);
  final JobDetailsController controller = Get.put(JobDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: jobDetailsAppBar()),
          SizedBox(
            height: Get.height - 100,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 92,
                    width: Get.width,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: ColorRes.borderColor),
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
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: Get.width,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 18),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: ColorRes.borderColor),
                        color: ColorRes.white),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Salary",
                                style: appTextStyle(
                                    color: ColorRes.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                            Text("\$2.350",
                                style: appTextStyle(
                                    color: ColorRes.containerColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Type",
                                style: appTextStyle(
                                    color: ColorRes.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                            Text("Full Time",
                                style: appTextStyle(
                                    color: ColorRes.containerColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Location",
                                style: appTextStyle(
                                    color: ColorRes.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                            Text("United States",
                                style: appTextStyle(
                                    color: ColorRes.containerColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      Strings.requirements,
                      style: appTextStyle(color: ColorRes.black),
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.requirements.length,
                      itemBuilder: (context, index) {
                        return detailBox(controller.requirements[index]);
                      }),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRes.jobDetailUploadCvScreen);
                    },
                    child: Container(
                      height: 50,
                      width: Get.width,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      margin: const EdgeInsets.only(
                          right: 18, left: 18, top: 10, bottom: 30),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gradient: LinearGradient(colors: [
                          ColorRes.gradientColor,
                          ColorRes.containerColor,
                        ]),
                      ),
                      child: Text(Strings.applyNow,
                          style: appTextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}