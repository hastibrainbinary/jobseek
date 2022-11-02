import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/manager_section/Recent%20People%20Application/recent_Application_screen.dart';
import 'package:jobseek/screen/manager_section/manager_home_screen/manager_home_screen_controller.dart';
import 'package:jobseek/screen/manager_section/manager_home_screen/manager_home_screen_widget/manager_home_screen_widget.dart';
import 'package:jobseek/screen/manager_section/notification1/notification1_screen.dart';
import 'package:jobseek/utils/app_res.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class ManagerHomeScreen extends StatelessWidget {
  ManagerHomeScreen({Key? key}) : super(key: key);
  final controller = Get.put(ManagerHomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Column(
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
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: ColorRes.containerColor),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (con) => const Notification1Screen()));
                    },
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: ColorRes.logoColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.notifications,
                          color: ColorRes.containerColor,
                        )),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome,",
                        style: appTextStyle(
                            color: ColorRes.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        controller.companyNAme ?? "",
                        maxLines: 2,
                        style: appTextStyle(
                            color: ColorRes.containerColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        // searchArea(),
        // const SizedBox(
        //   height: 20,
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                " Tips for you",
                style: appTextStyle(
                    color: ColorRes.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "See all",
                  style: appTextStyle(
                      color: ColorRes.containerColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        // Container(
        //   height: 92,
        //   width: Get.width,
        //   margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
        //   padding: const EdgeInsets.all(15),
        //   decoration: BoxDecoration(
        //       borderRadius: const BorderRadius.all(Radius.circular(15)),
        //       border: Border.all(color: const Color(0xffF3ECFF)),
        //       color: ColorRes.white),
        //   child: Row(
        //     children: [
        //       Image.asset(AssetRes.airBnbLogo),
        //       const SizedBox(width: 20),
        //       Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text("UI/UX Designer",
        //               style: appTextStyle(
        //                   color: ColorRes.black,
        //                   fontSize: 15,
        //                   fontWeight: FontWeight.w500)),
        //           Text("AirBNB",
        //               style: appTextStyle(
        //                   color: ColorRes.black,
        //                   fontSize: 12,
        //                   fontWeight: FontWeight.w400)),
        //           Text("United States - Full Time",
        //               style: appTextStyle(
        //                   color: ColorRes.black,
        //                   fontSize: 9,
        //                   fontWeight: FontWeight.w400)),
        //         ],
        //       ),
        //       const Spacer(),
        //       Column(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         crossAxisAlignment: CrossAxisAlignment.end,
        //         children: [
        //           Container(
        //             padding:
        //                 const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        //             decoration: BoxDecoration(
        //                 color: ColorRes.lightGreen,
        //                 borderRadius: BorderRadius.circular(15)),
        //             child: Text(
        //               "Active",
        //               style:
        //                   appTextStyle(color: ColorRes.darkGreen, fontSize: 12),
        //             ),
        //           ),
        //           const Spacer(),
        //           Text(
        //             "\$2.350",
        //             style: appTextStyle(
        //                 fontSize: 16,
        //                 color: ColorRes.containerColor,
        //                 fontWeight: FontWeight.w500),
        //           ),
        //         ],
        //       ),
        //       const SizedBox(width: 10)
        //     ],
        //   ),
        // ),
        StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("allPost").snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Expanded(
                child: snapshot.data.docs.length == 0
                    ? const SizedBox()
                    : SizedBox(
                        height: 50,
                        // Get.height * 0.65,
                        child: ListView.builder(
                            padding: const EdgeInsets.all(0),
                            itemCount: snapshot.data.docs.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () => Get.toNamed(
                                    AppRes.managerApplicationDetailScreen,
                                    arguments: {
                                      "docs": snapshot.data!.docs[index],
                                      "DocId": index
                                    }),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              // const SizedBox(width: 1),
                                              Text(
                                                  snapshot.data!.docs[index]
                                                      ["type"],
                                                  style: appTextStyle(
                                                      color: ColorRes.black,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w400)),
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
                                              snapshot.data!.docs[index]
                                                  ["Status"],
                                              style: appTextStyle(
                                                  color:
                                                      snapshot.data!.docs[index]
                                                                  ["Status"] ==
                                                              "Active"
                                                          ? ColorRes.darkGreen
                                                          : ColorRes.starColor,
                                                  fontSize: 12),
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            snapshot.data!.docs[index]
                                                ["salary"],
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
            }),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                " Recent People Application",
                style: appTextStyle(
                    color: ColorRes.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (con) => const RecentApplicationScreen()));
                },
                child: Text(
                  "See all",
                  style: appTextStyle(
                      color: ColorRes.containerColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: recentPeopleBox(),
        )
      ],
    );
  }
}
