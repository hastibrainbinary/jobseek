import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/common/widgets/backButton.dart';
import 'package:jobseek/screen/manager_section/Jobdetails/Jobdetails_controller.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';
import 'package:jobseek/utils/string.dart';

class JobDetailsScreen extends StatelessWidget {
  final bool isError;
  JobDetailsScreen({Key? key, required this.isError}) : super(key: key);
  final JobDetailsController controller = Get.put(JobDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backgroungColor,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: backButton(),
                    ),
                  ),
                  SizedBox(width: Get.width - 280),
                  Text(
                    'Job Details',
                    style: appTextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        height: 1,
                        color: ColorRes.black),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 92,
                width: Get.width,
                margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
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
                        Text(
                          "UI/UX Designer",
                          style: appTextStyle(
                              color: ColorRes.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "AirBNB",
                          style: appTextStyle(
                              color: ColorRes.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
              Center(
                child: Image.asset(
                    isError == true
                        ? AssetRes.successImage
                        : AssetRes.failedImage,
                    height: 130),
              ),
              const SizedBox(height: 10),
              Center(
                child: isError == true
                    ? Text("Job Vacancy Posted!",
                        style: appTextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: ColorRes.containerColor))
                    : Text("Oops, Failed to Post",
                        style: appTextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: ColorRes.starColor)),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: isError == true
                      ? Text(
                          "Now you can see all the applier CV/Resume and invite them to the next step.",
                          style: appTextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorRes.black.withOpacity(0.6),
                          ),
                          textAlign: TextAlign.center)
                      : Text(
                          "Please make sure that your internet connection is active and stable, then press “Try Again”",
                          style: appTextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorRes.black.withOpacity(0.6),
                          ),
                          textAlign: TextAlign.center),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  margin: const EdgeInsets.only(right: 18, left: 18, top: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient: LinearGradient(colors: [
                      ColorRes.gradientColor,
                      ColorRes.containerColor,
                    ]),
                  ),
                  child: Text(
                      isError == true
                          ? Strings.gotoapplications
                          : Strings.tryAgain,
                      style: appTextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  margin: const EdgeInsets.only(
                    right: 18,
                    left: 18,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: ColorRes.white,
                      border: Border.all(color: ColorRes.containerColor)),
                  child: Text(
                      isError == true
                          ? Strings.postanothervacancy
                          : Strings.backtohome,
                      style: appTextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ColorRes.containerColor)),
                ),
              ),
            ]),
      ),
    );
  }
}
