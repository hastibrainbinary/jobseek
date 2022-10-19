import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/job_detail_screen/job_detail_controller.dart';
import 'package:jobseek/screen/job_detail_screen/job_detail_widget/job_detail_widget.dart';
import 'package:jobseek/screen/savejobs/save_job_screen.dart';
import 'package:jobseek/utils/app_res.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';
import 'package:jobseek/utils/string.dart';

class JobDetailScreen extends StatelessWidget {
  JobDetailScreen({Key? key}) : super(key: key);
  final JobDetailsController controller = Get.put(JobDetailsController());
  var args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  SizedBox(
                    height: 45,
                    width: Get.width,
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                padding: const EdgeInsets.only(left: 10),
                                // margin: const EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  color: ColorRes.logoColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: ColorRes.containerColor,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: ColorRes.logoColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: args["saved"] == true
                                    ? InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (con) =>
                                                      SaveJobScreen()));
                                        },
                                        child: Image.asset(
                                          AssetRes.bookMarkFillIcon,
                                          height: 20,
                                          width: 20,
                                        ),
                                      )
                                    : Image.asset(
                                        AssetRes.bookMarkBorderIcon,
                                        height: 20,
                                        width: 20,
                                      ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Center(
                            child: Text(
                              Strings.jobDetails,
                              style: appTextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("category")
                  .doc("Design")
                  .collection("Design")
                  .snapshots(),
              /*FirebaseFirestore.instance.collection("allPost").doc(args["docId"]).snapshots(),*/
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return SizedBox(
                  height: Get.height - 100,
                  child: snapshot.hasData
                      ? SingleChildScrollView(
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
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 4),
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    border:
                                        Border.all(color: ColorRes.borderColor),
                                    color: ColorRes.white),
                                child: Row(
                                  children: [
                                    Image.asset(AssetRes.airBnbLogo),
                                    const SizedBox(width: 20),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(snapshot.data!.docs[0]["Position"],
                                            style: appTextStyle(
                                                color: ColorRes.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500)),
                                        Text(
                                            snapshot.data!.docs[0]
                                                ["CompanyName"],
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
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 5),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 18, horizontal: 18),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    border:
                                        Border.all(color: ColorRes.borderColor),
                                    color: ColorRes.white),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Salary",
                                            style: appTextStyle(
                                                color: ColorRes.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500)),
                                        Text(
                                            "\$${snapshot.data!.docs[0]["salary"]}",
                                            style: appTextStyle(
                                                color: ColorRes.containerColor,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Type",
                                            style: appTextStyle(
                                                color: ColorRes.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500)),
                                        Text(snapshot.data!.docs[0]["type"],
                                            style: appTextStyle(
                                                color: ColorRes.containerColor,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Location",
                                            style: appTextStyle(
                                                color: ColorRes.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500)),
                                        Text(snapshot.data!.docs[0]["location"],
                                            style: appTextStyle(
                                                color: ColorRes.containerColor,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Text(
                                  Strings.requirements,
                                  style: appTextStyle(color: ColorRes.black),
                                ),
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: snapshot
                                      .data!.docs[0]["RequirementsList"].length,
                                  itemBuilder: (context, index) {
                                    return detailBox(snapshot.data!.docs[0]
                                        ["RequirementsList"][index]);
                                  }),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRes.jobDetailUploadCvScreen);
                                },
                                child: Container(
                                  height: 50,
                                  width: Get.width,
                                  alignment: Alignment.center,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  margin: const EdgeInsets.only(
                                      right: 18, left: 18, top: 10, bottom: 30),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    gradient: LinearGradient(colors: [
                                      ColorRes.gradientColor,
                                      ColorRes.containerColor,
                                    ]),
                                  ),
                                  child: Text(Strings.applyNow,
                                      style: appTextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          height: Get.height,
                          width: Get.width,
                          color: ColorRes.containerColor.withOpacity(0.2),
                          alignment: Alignment.center,
                          child: Container(
                            padding: const EdgeInsets.all(35),
                            height: 110,
                            width: 110,
                            decoration: BoxDecoration(
                                color: ColorRes.white,
                                borderRadius: BorderRadius.circular(25)),
                            child: const CircularProgressIndicator(
                              color: ColorRes.containerColor,
                            ),
                          ),
                        ),
                );
              })
        ],
      ),
    );
  }
}
