import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/job_detail_screen/job_detail_widget/job_details_appbar.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';
import 'package:jobseek/utils/string.dart';

// ignore: must_be_immutable
class JobDetailsSuccessOrFailedScreen extends StatelessWidget {
  JobDetailsSuccessOrFailedScreen({Key? key}) : super(key: key);
  var args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    debugPrint("Args Print $args");
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            jobDetailsAppBar(),
            SizedBox(
              height: Get.height - 100,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      height: 92,
                      width: Get.width,
                      margin: const EdgeInsets.symmetric(vertical: 4),
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
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xffEEEBF4),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: ColorRes.borderColor),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(AssetRes.pdfIcon, height: 90),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Resume - Adam Smith.pdf",
                                  style: appTextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: ColorRes.black)),
                              const SizedBox(height: 10),
                              Text("440 kb",
                                  style: appTextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: ColorRes.grey))
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Image.asset(
                        args[0]["error"] == false
                            ? AssetRes.successImage
                            : AssetRes.failedImage,
                        height: 130),
                    const SizedBox(height: 10),
                    args[0]["error"] == false
                        ? Text(Strings.successful,
                            style: appTextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: ColorRes.containerColor))
                        : Text(Strings.failed,
                            style: appTextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: ColorRes.red)),
                    const SizedBox(height: 5),
                    Text(
                        args[0]["error"] == false
                            ? Strings.youHaveSuccessfullyApplied
                            : Strings.pleaseMakeSureThatYourInternet,
                        style: appTextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorRes.grey),
                        textAlign: TextAlign.center),
                    const SizedBox(height: 30),
                    GestureDetector(
                      child: Container(
                        height: 50,
                        width: Get.width,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        margin:
                            const EdgeInsets.only(right: 18, left: 18, top: 10),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          gradient: LinearGradient(colors: [
                            ColorRes.gradientColor,
                            ColorRes.containerColor,
                          ]),
                        ),
                        child: Text(
                            args[0]["error"] == false
                                ? Strings.seeAppliedJobsList
                                : Strings.tryAgain,
                            style: appTextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        height: 50,
                        width: Get.width,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        margin: const EdgeInsets.only(
                            right: 18, left: 18, top: 10, bottom: 30),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: ColorRes.containerColor),
                        ),
                        child: Text(Strings.discoverMoreJobs,
                            style: appTextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: ColorRes.containerColor)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}