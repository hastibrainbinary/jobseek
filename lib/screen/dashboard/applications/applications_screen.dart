import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/dashboard/applications/applications_controller.dart';
import 'package:jobseek/screen/dashboard/applications/rejected_screen.dart';
import 'package:jobseek/screen/dashboard/home/widgets/search_field.dart';
import 'package:jobseek/screen/savejobs/save_job_screen.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';
import 'Financialplanner_screen.dart';
import 'UiuxDesigner_screen.dart';
import 'accepted_screen.dart';

class ApplicationsScreen extends StatelessWidget {
  ApplicationsScreen({Key? key}) : super(key: key);

  final applicationController = Get.put(ApplicationsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: Get.height,
        width: Get.width,
        color: ColorRes.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: ColorRes.logoColor),
                    child: Text("Logo",
                        style: appTextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                            color: ColorRes.containerColor)),
                  ),
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Applications",
                          style: appTextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: ColorRes.black),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      debugPrint("ON TAP SAVE BTN");
                    },
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (con) => SaveJobScreen()));
                      },
                      child: Container(
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: ColorRes.logoColor),
                          child: Image.asset(
                            AssetRes.bookMarkFillIcon,
                            height: 21,
                            width: 15,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            searchArea(),
            const SizedBox(height: 25),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: 32,
              child: ListView.builder(
                  itemCount: applicationController.jobs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => applicationController.onTapJobs2(index),
                      child: Obx(() => Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            height: 32,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorRes.containerColor, width: 2),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color:
                                    applicationController.selectedJobs.value ==
                                            index
                                        ? ColorRes.containerColor
                                        : ColorRes.white),
                            child: Text(
                              applicationController.jobs[index],
                              style: appTextStyle(
                                  color: applicationController
                                              .selectedJobs.value ==
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
            const SizedBox(height: 15),
            SizedBox(
              height: Get.height - 309,
              child: SingleChildScrollView(
                child: Obx(() {
                  return Column(
                    children: [
                      applicationController.selectedJobs.value == 0
                          ? Column(
                              children: [
                                Container(
                                  height: 135,
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
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Row(
                                          children: [
                                            Image.asset(AssetRes.airBnbLogo,
                                                height: 40),
                                            const SizedBox(width: 20),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("UI/UX Designer",
                                                    style: appTextStyle(
                                                        color: ColorRes.black,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                Text("AirBNB",
                                                    style: appTextStyle(
                                                        color: ColorRes.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        color: ColorRes.grey,
                                      ),
                                      const SizedBox(height: 10),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (con) =>
                                                      const AcceptedScreen()));
                                        },
                                        child: Container(
                                          height: 28,
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffEDF9F0),
                                            borderRadius:
                                                BorderRadius.circular(99),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Application Accepted",
                                              style: appTextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xff23A757)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 135,
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
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Row(
                                          children: [
                                            Image.asset(AssetRes.airBnbLogo,
                                                height: 40),
                                            const SizedBox(width: 20),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("UI/UX Designer",
                                                    style: appTextStyle(
                                                        color: ColorRes.black,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                Text("AirBNB",
                                                    style: appTextStyle(
                                                        color: ColorRes.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        color: ColorRes.grey,
                                      ),
                                      const SizedBox(height: 10),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (con) =>
                                                      const UiUxDesignerScreen()));
                                        },
                                        child: Container(
                                          height: 28,
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffEEF2FA),
                                            borderRadius:
                                                BorderRadius.circular(99),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Application Sent",
                                              style: appTextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xff2E5AAC)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 135,
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
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Row(
                                          children: [
                                            Image.asset(AssetRes.twitterLogo,
                                                height: 40),
                                            const SizedBox(width: 20),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Financial Planner",
                                                    style: appTextStyle(
                                                        color: ColorRes.black,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                Text("Twitter",
                                                    style: appTextStyle(
                                                        color: ColorRes.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        color: ColorRes.grey,
                                      ),
                                      const SizedBox(height: 10),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (con) =>
                                                      const FinancialPlannerScreen()));
                                        },
                                        child: Container(
                                          height: 28,
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffFFFBED),
                                            borderRadius:
                                                BorderRadius.circular(99),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Application Pending",
                                              style: appTextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xffF1C100)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 135,
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
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Row(
                                          children: [
                                            Image.asset(AssetRes.facebook,
                                                height: 40),
                                            const SizedBox(width: 20),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Product Designer",
                                                  style: appTextStyle(
                                                      color: ColorRes.black,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text("Facebook",
                                                    style: appTextStyle(
                                                        color: ColorRes.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        color: ColorRes.grey,
                                      ),
                                      const SizedBox(height: 10),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (con) =>
                                                      const RejectedScreen()));
                                        },
                                        child: Container(
                                          height: 28,
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffFEEFEF),
                                            borderRadius:
                                                BorderRadius.circular(99),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Application Rejected",
                                              style: appTextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xffDA1414)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          : const SizedBox(),
                      applicationController.selectedJobs.value == 1
                          ? Container(
                              height: 135,
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
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      children: [
                                        Image.asset(AssetRes.airBnbLogo,
                                            height: 40),
                                        const SizedBox(width: 20),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("UI/UX Designer",
                                                style: appTextStyle(
                                                    color: ColorRes.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text("AirBNB",
                                                style: appTextStyle(
                                                    color: ColorRes.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    color: ColorRes.grey,
                                  ),
                                  const SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (con) =>
                                                  const AcceptedScreen()));
                                    },
                                    child: Container(
                                      height: 28,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffEDF9F0),
                                        borderRadius: BorderRadius.circular(99),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Application Accepted",
                                          style: appTextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff23A757)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          :


                      const SizedBox(),
                      applicationController.selectedJobs.value == 4
                          ? Container(
                              height: 135,
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
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      children: [
                                        Image.asset(AssetRes.airBnbLogo,
                                            height: 40),
                                        const SizedBox(width: 20),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("UI/UX Designer",
                                                style: appTextStyle(
                                                    color: ColorRes.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text("AirBNB",
                                                style: appTextStyle(
                                                    color: ColorRes.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    color: ColorRes.grey,
                                  ),
                                  const SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (con) =>
                                                  const UiUxDesignerScreen()));
                                    },
                                    child: Container(
                                      height: 28,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffEEF2FA),
                                        borderRadius: BorderRadius.circular(99),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Application Sent",
                                          style: appTextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff2E5AAC)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox(),
                      applicationController.selectedJobs.value == 2
                          ? Container(
                              height: 135,
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
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      children: [
                                        Image.asset(AssetRes.twitterLogo,
                                            height: 40),
                                        const SizedBox(width: 20),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Financial Planner",
                                                style: appTextStyle(
                                                    color: ColorRes.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text("Twitter",
                                                style: appTextStyle(
                                                    color: ColorRes.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    color: ColorRes.grey,
                                  ),
                                  const SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (con) =>
                                                  const FinancialPlannerScreen()));
                                    },
                                    child: Container(
                                      height: 28,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffFFFBED),
                                        borderRadius: BorderRadius.circular(99),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Application Pending",
                                          style: appTextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xffF1C100)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox(),
                      applicationController.selectedJobs.value == 3
                          ? Container(
                              height: 135,
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
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      children: [
                                        Image.asset(AssetRes.facebook,
                                            height: 40),
                                        const SizedBox(width: 20),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Product Designer",
                                              style: appTextStyle(
                                                  color: ColorRes.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text("Facebook",
                                                style: appTextStyle(
                                                    color: ColorRes.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    color: ColorRes.grey,
                                  ),
                                  const SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (con) =>
                                                  const RejectedScreen()));
                                    },
                                    child: Container(
                                      height: 28,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffFEEFEF),
                                        borderRadius: BorderRadius.circular(99),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Application Rejected",
                                          style: appTextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xffDA1414)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox(),
                    ],
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
