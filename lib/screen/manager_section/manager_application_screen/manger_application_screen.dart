import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/create_vacancies/create_vacancies_screen.dart';
import 'package:jobseek/screen/manager_section/manager_application_screen/manager_application_screen_controller.dart';
import 'package:jobseek/utils/app_res.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class ManagerApplicationScreen extends StatelessWidget {
  final ManagerApplicationScreenController controller =
      Get.put(ManagerApplicationScreenController());

  ManagerApplicationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: ColorRes.logoColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Logo',
                          style: appTextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                              color: ColorRes.containerColor),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (con) =>
                                    const CreateVacanciesScreenM()));
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: ColorRes.logoColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(AssetRes.add1),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Applications",
                    style: appTextStyle(
                        color: ColorRes.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: ColorRes.white2,
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  suffixIcon: Icon(Icons.search)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 32,
            child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: controller.jobs2.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => controller.onTapJobs2(index),
                    child: Obx(
                      () => Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 32,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: ColorRes.containerColor, width: 2),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: controller.selectedJobs2.value == index
                                ? ColorRes.containerColor
                                : ColorRes.white),
                        child: Text(
                          controller.jobs2[index],
                          style: appTextStyle(
                              color: controller.selectedJobs2.value == index
                                  ? ColorRes.white
                                  : ColorRes.containerColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(height: 18),
          StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("allPost").snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Expanded(
                  child: SizedBox(
                    height: Get.height * 0.65,
                    child: ListView.builder(
                        padding: const EdgeInsets.all(0),
                        itemCount: snapshot.data.docs.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => Get.toNamed(
                                AppRes.managerApplicationDetailScreen),
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
                                  Image.asset(AssetRes.airBnbLogo),
                                  const SizedBox(width: 20),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          snapshot.data!.docs[index]
                                              ["Position"],
                                          style: appTextStyle(
                                              color: ColorRes.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),
                                      Text(
                                          snapshot.data!.docs[index]
                                              ["CompanyName"],
                                          style: appTextStyle(
                                              color: ColorRes.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400)),
                                      Row(
                                        children: [
                                          Text(
                                            snapshot.data!.docs[index]
                                                ["location"],
                                            style: appTextStyle(
                                                color: ColorRes.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          // const SizedBox(width: 3),
                                          Text(
                                              snapshot.data!.docs[index]
                                                  ["type"],
                                              style: appTextStyle(
                                                  color: ColorRes.black,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 20,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        decoration: BoxDecoration(
                                          color: snapshot.data!.docs[index]
                                                      ["Status"] ==
                                                  "Active"
                                              ? ColorRes.lightGreen
                                              : ColorRes.invalidColor,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          snapshot.data!.docs[index]["Status"],
                                          style: appTextStyle(
                                              color: snapshot.data!.docs[index]
                                                          ["Status"] ==
                                                      "Active"
                                                  ? ColorRes.darkGreen
                                                  : ColorRes.starColor,
                                              fontSize: 12),
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        snapshot.data!.docs[index]["salary"],
                                        style: appTextStyle(
                                            fontSize: 16,
                                            color: ColorRes.containerColor,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 10)
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                );
              })
        ],
      ),
    );
  }
}
