import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/common/widgets/backButton.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class FinancialPlannerScreen extends StatelessWidget {
  const FinancialPlannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backgroungColor,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: backButton(),
                  ),
                ),
                const SizedBox(width:70),
                Center(
                  child: Text(
                    'Application',
                    style: appTextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        height: 1,
                        color: ColorRes.black),
                  ),
                ),
              ],
            ),
            Container(
              height: 135,
              width: Get.width,
              margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(color: const Color(0xffF3ECFF)),
                  color: ColorRes.white),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Image.asset(AssetRes.twitterLogo, height: 40),
                        const SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Financial Planner",
                                style: appTextStyle(
                                    color: ColorRes.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                            Text("Twitter",
                                style: appTextStyle(
                                    color: ColorRes.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: ColorRes.grey,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 28,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFF4EC),
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: Center(
                      child: Text(
                        "Scheduled for Interview",
                        style: appTextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xffB95000)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: Get.width,
              margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(color: ColorRes.borderColor),
                  color: ColorRes.white),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Salary",
                          style: appTextStyle(
                              color: ColorRes.black.withOpacity(0.8),
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                      Text("\$1.480",
                          style: appTextStyle(
                              color: ColorRes.containerColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Type",
                          style: appTextStyle(
                              color: ColorRes.black.withOpacity(0.8),
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                      Text("Freelance",
                          style: appTextStyle(
                              color: ColorRes.containerColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Location",
                          style: appTextStyle(
                              color: ColorRes.black.withOpacity(0.8),
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                      Text("Singapore",
                          style: appTextStyle(
                              color: ColorRes.containerColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Waiting for review ...',
                style: appTextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: ColorRes.black.withOpacity(0.4)),
              ),
            ),
            SizedBox(height: Get.height - 495),
            Container(
              height: 50,
              width: Get.width,
              // width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                  colors: [
                    ColorRes.gradientColor,
                    ColorRes.containerColor,
                  ],
                ),
              ),
              child: Text("Waiting for review",
                  style: appTextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: ColorRes.white)),
            )
          ]),
    );
  }
}