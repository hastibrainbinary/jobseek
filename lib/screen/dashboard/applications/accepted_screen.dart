import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/common/widgets/backButton.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class AcceptedScreen extends StatelessWidget {
  const AcceptedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorRes.backgroundColor,
        body: Column(
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
                      'Application',
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
            const SizedBox(height: 10),
            SizedBox(
              height: Get.height - 140,
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 135,
                        width: Get.width,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 4),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            border: Border.all(color: const Color(0xffF3ECFF)),
                            color: ColorRes.white),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                children: [
                                  Image.asset(AssetRes.airBnbLogo, height: 40),
                                  const SizedBox(width: 20),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                            const Divider(
                              color: ColorRes.grey,
                            ),
                            const SizedBox(height: 10),
                            Container(
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
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: Get.width,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 5),
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
                                        color: ColorRes.black.withOpacity(0.8),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500)),
                                Text("\$2.350",
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
                                Text("Full Time",
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
                                Text("United States",
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
                          " Hi,Adam Smith,",
                          style: appTextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: ColorRes.black.withOpacity(0.9)),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 19),
                        child: Text(
                          " congratulation!",
                          style: appTextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: ColorRes.black.withOpacity(0.9)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "After we reviewed your application for the position of UI/UX Designer,we congratulate you for beinga part of us.After this you will be contacted personally by our team.Thank You ...",
                            style: appTextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: ColorRes.black.withOpacity(0.9)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          " Greetings,",
                          style: appTextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: ColorRes.black.withOpacity(0.9)),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          " Hiring Manager",
                          style: appTextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: ColorRes.black.withOpacity(0.9)),
                        ),
                      ),
                      const SizedBox(height: 55),
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
                        child: Text("Send Message to Recruiter Now",
                            style: appTextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: ColorRes.white)),
                      )
                    ]),
              ),
            ),
          ],
        ));
  }
}
