import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/dashboard/applications/applications_controller.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class ApplicationsScreen extends StatelessWidget {
   ApplicationsScreen({Key? key}) : super(key: key);
  final applicationController = Get.put(ApplicationsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: ColorRes.backgroungColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
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
                    child: const Text("Logo",
                        style: TextStyle(color: ColorRes.containerColor)),
                  ),
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Applications",
                          style: appTextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: ColorRes.black),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      debugPrint("ON TAP SAVE BTN");
                    },
                    child: Container(
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: ColorRes.logoColor),
                        child: Image.asset(
                          AssetRes.bookMarkFillIcon,
                          height: 20,
                        )),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: ColorRes.white2,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: TextField(
                        controller: applicationController.searchController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon:
                            const Icon(Icons.search, color: ColorRes.grey),
                            hintText: "Search",
                            hintStyle: appTextStyle(
                                fontSize: 14,
                                color: ColorRes.grey,
                                fontWeight: FontWeight.w500
                            ),
                            contentPadding:
                            const EdgeInsets.only(left: 20, top: 13)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                        // width: 70,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: ColorRes.containerColor, width: 2),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: applicationController.selectedJobs.value == index
                                ? ColorRes.containerColor
                                : ColorRes.white),
                        child: Text(
                          applicationController.jobs[index],
                          style: appTextStyle(
                              color: applicationController.selectedJobs.value == index
                                  ? ColorRes.white
                                  : ColorRes.containerColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                    );
                  }),
            ),
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
                        Image.asset(AssetRes.airBnbLogo,height: 40),
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
                  const Divider(color: ColorRes.grey,),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: const BorderRadius.all(Radius.circular(15))
                    ),


                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
