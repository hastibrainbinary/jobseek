import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/job_detail_screen/job_detail_upload_cv_screen/upload_cv_controller.dart';
import 'package:jobseek/screen/job_detail_screen/job_detail_widget/job_details_appbar.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';
import 'package:jobseek/utils/string.dart';

class JobDetailsUploadCvScreen extends StatelessWidget {
  JobDetailsUploadCvScreen({Key? key}) : super(key: key);
  final JobDetailsUploadCvController controller =
      Get.put(JobDetailsUploadCvController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backgroungColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            jobDetailsAppBar(),
            const SizedBox(height: 20),
            Container(
              height: 92,
              width: Get.width,
              margin: const EdgeInsets.symmetric(vertical: 4),
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
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Divider(thickness: 2, color: Color(0xffD9D9D9)),
            Text(Strings.uploadResume,
                style: appTextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: ColorRes.black)),
            Text(Strings.uploadYourCvOr,
                style: appTextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: ColorRes.black)),
            ///upload pdf error Container
            /*Container(
              width: Get.width,
              // height: 28,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: ColorRes.invalidColor),
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 18,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage(
                        AssetRes.invalid,
                      ),
                      height: 25,
                    ),
                    const SizedBox(width: 10),
                    Text("Upload failed,please re-upload your file",
                        style: appTextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: ColorRes.starColor)),
                    const Spacer(),
                    const Icon(
                      Icons.clear,
                      color: ColorRes.starColor,
                    )
                  ]),
            ),*/
            controller.filepath.value != ""
                ? Container(
                    width: Get.width,
                    margin: const EdgeInsets.only(top: 10),
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
                            SizedBox(
                              width:Get.width * 0.65,
                              child: Text(
                                  controller.filepath
                                      .value /*"Resume - Adam Smith.pdf"*/,
                                  style: appTextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: ColorRes.black)),
                            ),
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
                  )
                : const SizedBox(),

            GestureDetector(
              onTap: () => controller.applyResume(),
              child: Container(
                width: Get.width,
                margin: const EdgeInsets.only(top: 15),
                padding: const EdgeInsets.only(top: 50, bottom: 40),
                decoration: BoxDecoration(
                  color: ColorRes.white,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(color: ColorRes.borderColor),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AssetRes.uploadIcon, height: 70),
                    const SizedBox(height: 20),
                    Text(
                      "Upload Resume/CV",
                      style: appTextStyle(
                          color: ColorRes.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),

            ///uploading loader
           /* Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(vertical: 35),
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: ColorRes.white,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                border: Border.all(color: ColorRes.borderColor),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                      color: ColorRes.containerColor,
                      backgroundColor:
                          ColorRes.containerColor.withOpacity(0.3)),
                  const SizedBox(height: 20),
                  Text(Strings.uploading,
                      style: appTextStyle(
                          color: ColorRes.containerColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500))
                ],
              ),
            ),*/

            // const Spacer(),
            GestureDetector(
              onTap: () => controller.onTapApply(),
              child: Container(
                height: 50,
                width: Get.width,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                margin: const EdgeInsets.only(
                    right: 18, left: 18, top: 10, bottom: 30),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(colors: [
                    ColorRes.gradientColor.withOpacity(0.4),
                    ColorRes.containerColor.withOpacity(0.4),
                  ]),
                ),
                child: Text(Strings.apply,
                    style: appTextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500)),
              ),
            )
          ],
        ),
      ),
    );
  }
}