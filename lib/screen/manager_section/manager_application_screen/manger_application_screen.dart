import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/create_vacancies/create_vacancies_screen.dart';
import 'package:jobseek/screen/manager_section/manager_application_screen/manager_application_screen_controller.dart';
import 'package:jobseek/service/pref_services.dart';
import 'package:jobseek/utils/app_res.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';
import 'package:jobseek/utils/pref_keys.dart';

class ManagerApplicationScreen extends StatelessWidget {
  final ManagerApplicationScreenController controller =
      Get.put(ManagerApplicationScreenController());
  final jrController = Get.put(ManagerApplicationScreenController());
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  ManagerApplicationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: TextField(
              controller: controller.searchController,
              onChanged: (value) {
                jrController.searchText.value = value;
                jrController.update(["search"]);
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: const Icon(Icons.search, color: ColorRes.grey),
                  hintText: "Search",
                  hintStyle: appTextStyle(
                      fontSize: 14,
                      color: ColorRes.grey,
                      fontWeight: FontWeight.w500),
                  contentPadding: const EdgeInsets.only(left: 0, top: 13)),
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
          // Obx(() => controller.selectedJobs2.value == 0
          //     ? application(fireStore.collection("allVacancies").snapshots())
          //     : controller.selectedJobs2.value == 1
          //         ? application(
          //             fireStore
          //                 .collection("type")
          //                 .doc("Active")
          //                 .collection("Active")
          //                 .snapshots(),
          //           )
          //         : controller.selectedJobs2.value == 2
          //             ? application(
          //                 fireStore
          //                     .collection("type")
          //                     .doc("Inactive")
          //                     .collection("Inactive")
          //                     .snapshots(),
          //               )
          //             : Center(
          //                 child: Text(
          //                     controller.jobs2[controller.selectedJobs2.value]),
          //               ))
          const SizedBox(height: 18),

          StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("allPost").snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data != null) {
                snapshot.data.docs.forEach((e) {
                  if (PrefService.getString(PrefKeys.companyName) ==
                      e["CompanyName"]) {
                    controller.isData = false;
                  }
                });
              }
              return Expanded(
                child: (snapshot.data == null)
                    ? SizedBox()
                    : snapshot.data.docs.length == 0
                        ? SizedBox()
                        : GetBuilder<ManagerApplicationScreenController>(
                            id: "status",
                            builder: (con) {
                              return (controller.isData == true)
                                  ? Column(
                                      children: [
                                        const Image(
                                          image:
                                              AssetImage(AssetRes.successImage),
                                        ),
                                        Text(
                                          textAlign: TextAlign.center,
                                          "Empty",
                                          style: TextStyle(
                                              color: ColorRes.containerColor,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(height: 18),
                                        Padding(
                                          padding: const EdgeInsets.all(13.0),
                                          child: Text(
                                            maxLines: 2,
                                            "Create a job vacancy for your company and start \n             find new high quality employee.",
                                            style: TextStyle(
                                                color: ColorRes.black
                                                    .withOpacity(0.7),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13),
                                          ),
                                        ),
                                        const SizedBox(height: 95),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (con) =>
                                                        CreateVacanciesScreenM()));
                                          },
                                          child: Container(
                                            height: 50,
                                            width: 339,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              gradient:
                                                  const LinearGradient(colors: [
                                                ColorRes.gradientColor,
                                                ColorRes.containerColor,
                                              ]),
                                            ),
                                            child: Text("Create Vacancies Now",
                                                style: appTextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 18,
                                                    color: ColorRes.white)),
                                          ),
                                        ),
                                      ],
                                    )
                                  : SizedBox(
                                      height: Get.height * 0.65,
                                      child:
                                          (controller.selectedJobs2.value == 1)
                                              ? ListView.builder(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  itemCount:
                                                      snapshot.data.docs.length,
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index) {
                                                    if (snapshot.data!
                                                                .docs[index]
                                                            ["Status"] ==
                                                        "Active") {
                                                      return (PrefService.getString(
                                                                  PrefKeys
                                                                      .companyName) !=
                                                              snapshot.data!
                                                                          .docs[
                                                                      index][
                                                                  "CompanyName"])
                                                          ? SizedBox()
                                                          : InkWell(
                                                              onTap: () {
                                                                Get.toNamed(
                                                                    AppRes
                                                                        .managerApplicationDetailScreen,
                                                                    arguments: {
                                                                      "docs": snapshot
                                                                          .data!
                                                                          .docs[index],
                                                                      "DocId": snapshot
                                                                          .data!
                                                                          .docs[
                                                                              index]
                                                                          .id
                                                                    });
                                                              },
                                                              child: Container(
                                                                height: 92,
                                                                width:
                                                                    Get.width,
                                                                margin: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        18,
                                                                    vertical:
                                                                        4),
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(15),
                                                                decoration: BoxDecoration(
                                                                    borderRadius: const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            15)),
                                                                    border: Border.all(
                                                                        color: const Color(
                                                                            0xffF3ECFF)),
                                                                    color: ColorRes
                                                                        .white),
                                                                child: Row(
                                                                  children: [
                                                                    Image.asset(
                                                                        AssetRes
                                                                            .airBnbLogo),
                                                                    const SizedBox(
                                                                        width:
                                                                            20),
                                                                    Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                            snapshot.data!.docs[index][
                                                                                "Position"],
                                                                            style: appTextStyle(
                                                                                color: ColorRes.black,
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.w500)),
                                                                        Text(
                                                                            snapshot.data!.docs[index][
                                                                                "CompanyName"],
                                                                            style: appTextStyle(
                                                                                color: ColorRes.black,
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w400)),
                                                                        Row(
                                                                          children: [
                                                                            Text(
                                                                              snapshot.data!.docs[index]["location"],
                                                                              style: appTextStyle(color: ColorRes.black, fontSize: 10, fontWeight: FontWeight.w400),
                                                                            ),
                                                                            // const SizedBox(width: 1),
                                                                            Text(snapshot.data!.docs[index]["type"],
                                                                                style: appTextStyle(color: ColorRes.black, fontSize: 10, fontWeight: FontWeight.w400)),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    const Spacer(),
                                                                    Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              20,
                                                                          padding:
                                                                              const EdgeInsets.symmetric(horizontal: 14),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color: snapshot.data!.docs[index]["Status"] == "Active"
                                                                                ? ColorRes.lightGreen
                                                                                : ColorRes.invalidColor,
                                                                            borderRadius:
                                                                                BorderRadius.circular(20),
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            snapshot.data!.docs[index]["Status"],
                                                                            style:
                                                                                appTextStyle(color: snapshot.data!.docs[index]["Status"] == "Active" ? ColorRes.darkGreen : ColorRes.starColor, fontSize: 12),
                                                                          ),
                                                                        ),
                                                                        const Spacer(),
                                                                        Text(
                                                                          snapshot
                                                                              .data!
                                                                              .docs[index]["salary"],
                                                                          style: appTextStyle(
                                                                              fontSize: 16,
                                                                              color: ColorRes.containerColor,
                                                                              fontWeight: FontWeight.w500),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            10)
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                    } else {
                                                      return SizedBox();
                                                    }
                                                  },
                                                )
                                              : (controller.selectedJobs2
                                                          .value ==
                                                      2)
                                                  ? ListView.builder(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0),
                                                      itemCount: snapshot
                                                          .data.docs.length,
                                                      shrinkWrap: true,
                                                      itemBuilder:
                                                          (context, index) {
                                                        if (snapshot.data!
                                                                    .docs[index]
                                                                ["Status"] ==
                                                            "Inactive") {
                                                          return (PrefService
                                                                      .getString(
                                                                          PrefKeys
                                                                              .companyName) !=
                                                                  snapshot.data!
                                                                              .docs[
                                                                          index]
                                                                      [
                                                                      "CompanyName"])
                                                              ? SizedBox()
                                                              : InkWell(
                                                                  onTap: () =>
                                                                      Get.toNamed(
                                                                          AppRes
                                                                              .managerApplicationDetailScreen,
                                                                          arguments: {
                                                                        "docs": snapshot
                                                                            .data!
                                                                            .docs[index],
                                                                        "DocId":
                                                                            index
                                                                      }),
                                                                  child:
                                                                      Container(
                                                                    height: 92,
                                                                    width: Get
                                                                        .width,
                                                                    margin: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            18,
                                                                        vertical:
                                                                            4),
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            15),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            const BorderRadius.all(Radius.circular(
                                                                                15)),
                                                                        border: Border.all(
                                                                            color: const Color(
                                                                                0xffF3ECFF)),
                                                                        color: ColorRes
                                                                            .white),
                                                                    child: Row(
                                                                      children: [
                                                                        Image.asset(
                                                                            AssetRes.airBnbLogo),
                                                                        const SizedBox(
                                                                            width:
                                                                                20),
                                                                        Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(snapshot.data!.docs[index]["Position"],
                                                                                style: appTextStyle(color: ColorRes.black, fontSize: 15, fontWeight: FontWeight.w500)),
                                                                            Text(snapshot.data!.docs[index]["CompanyName"],
                                                                                style: appTextStyle(color: ColorRes.black, fontSize: 12, fontWeight: FontWeight.w400)),
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  snapshot.data!.docs[index]["location"],
                                                                                  style: appTextStyle(color: ColorRes.black, fontSize: 10, fontWeight: FontWeight.w400),
                                                                                ),
                                                                                // const SizedBox(width: 1),
                                                                                Text(snapshot.data!.docs[index]["type"], style: appTextStyle(color: ColorRes.black, fontSize: 10, fontWeight: FontWeight.w400)),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        const Spacer(),
                                                                        Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.end,
                                                                          children: [
                                                                            Container(
                                                                              height: 20,
                                                                              padding: const EdgeInsets.symmetric(horizontal: 14),
                                                                              decoration: BoxDecoration(
                                                                                color: snapshot.data!.docs[index]["Status"] == "Active" ? ColorRes.lightGreen : ColorRes.invalidColor,
                                                                                borderRadius: BorderRadius.circular(20),
                                                                              ),
                                                                              child: Text(
                                                                                snapshot.data!.docs[index]["Status"],
                                                                                style: appTextStyle(color: snapshot.data!.docs[index]["Status"] == "Active" ? ColorRes.darkGreen : ColorRes.starColor, fontSize: 12),
                                                                              ),
                                                                            ),
                                                                            const Spacer(),
                                                                            Text(
                                                                              snapshot.data!.docs[index]["salary"],
                                                                              style: appTextStyle(fontSize: 16, color: ColorRes.containerColor, fontWeight: FontWeight.w500),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        const SizedBox(
                                                                            width:
                                                                                10)
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                        } else {
                                                          return SizedBox();
                                                        }
                                                      },
                                                    )
                                                  : ListView.builder(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0),
                                                      itemCount: snapshot
                                                          .data.docs.length,
                                                      shrinkWrap: true,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return (PrefService
                                                                    .getString(
                                                                        PrefKeys
                                                                            .companyName) !=
                                                                snapshot.data!
                                                                            .docs[
                                                                        index][
                                                                    "CompanyName"])
                                                            ? SizedBox()
                                                            : InkWell(
                                                                onTap: () =>
                                                                    Get.toNamed(
                                                                        AppRes
                                                                            .managerApplicationDetailScreen,
                                                                        arguments: {
                                                                      "docs": snapshot
                                                                          .data!
                                                                          .docs[index],
                                                                      "DocId":
                                                                          index
                                                                    }),
                                                                child:
                                                                    Container(
                                                                  height: 92,
                                                                  width:
                                                                      Get.width,
                                                                  margin: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          18,
                                                                      vertical:
                                                                          4),
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(15),
                                                                  decoration: BoxDecoration(
                                                                      borderRadius: const BorderRadius
                                                                              .all(
                                                                          Radius.circular(
                                                                              15)),
                                                                      border: Border.all(
                                                                          color: const Color(
                                                                              0xffF3ECFF)),
                                                                      color: ColorRes
                                                                          .white),
                                                                  child: Row(
                                                                    children: [
                                                                      Image.asset(
                                                                          AssetRes
                                                                              .airBnbLogo),
                                                                      const SizedBox(
                                                                          width:
                                                                              20),
                                                                      Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                              snapshot.data!.docs[index]["Position"],
                                                                              style: appTextStyle(color: ColorRes.black, fontSize: 15, fontWeight: FontWeight.w500)),
                                                                          Text(
                                                                              snapshot.data!.docs[index]["CompanyName"],
                                                                              style: appTextStyle(color: ColorRes.black, fontSize: 12, fontWeight: FontWeight.w400)),
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                snapshot.data!.docs[index]["location"],
                                                                                style: appTextStyle(color: ColorRes.black, fontSize: 10, fontWeight: FontWeight.w400),
                                                                              ),
                                                                              // const SizedBox(width: 1),
                                                                              Text(snapshot.data!.docs[index]["type"], style: appTextStyle(color: ColorRes.black, fontSize: 10, fontWeight: FontWeight.w400)),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      const Spacer(),
                                                                      Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        children: [
                                                                          Container(
                                                                            height:
                                                                                20,
                                                                            padding:
                                                                                const EdgeInsets.symmetric(horizontal: 14),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: snapshot.data!.docs[index]["Status"] == "Active" ? ColorRes.lightGreen : ColorRes.invalidColor,
                                                                              borderRadius: BorderRadius.circular(20),
                                                                            ),
                                                                            child:
                                                                                Text(
                                                                              snapshot.data!.docs[index]["Status"],
                                                                              style: appTextStyle(color: snapshot.data!.docs[index]["Status"] == "Active" ? ColorRes.darkGreen : ColorRes.starColor, fontSize: 12),
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
                                                                      const SizedBox(
                                                                          width:
                                                                              10)
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                      },
                                                    ),
                                    );
                            }),
              );
            },
          ),
        ],
      ),
    );
  }
}
