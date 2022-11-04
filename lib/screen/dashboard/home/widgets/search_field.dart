import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:jobseek/screen/dashboard/home/home_controller.dart';
import 'package:jobseek/screen/job_recommendation_screen/job_recommendation_controller.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/color_res.dart';






Widget searchArea() {
  final HomeController controller = HomeController();
  final jrController = Get.put(JobRecommendationController());
  return Padding(

    padding: const EdgeInsets.symmetric(horizontal: 18),
    child: Row(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
                color: ColorRes.white2,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: TextField(
              controller: controller.searchController,
              onChanged: (value) {

                jrController.searchText.value = value;
                jrController.update(["search"]);

              },
              /*onChanged: (val){
                jrController.allJob = FirebaseFirestore.instance.collection("allPost").where(val , isGreaterThanOrEqualTo: "Position"
                  // e.toString().toLowerCase().contains(val.toString().toLowerCase());
                ).where(val , isLessThanOrEqualTo: "Position" + "z",

                ) as Stream? ;
              },*/
              decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: const Icon(Icons.search, color: ColorRes.grey),
                  hintText: "Search",
                  hintStyle: appTextStyle(
                      fontSize: 14,
                      color: ColorRes.grey,
                      fontWeight: FontWeight.w500),
                  contentPadding: const EdgeInsets.only(left: 20, top: 13)),
            ),
          ),
        ),
        // const SizedBox(width: 20),
        // Container(
        //   height: 40,
        //   width: 40,
        //   alignment: Alignment.center,
        //   decoration: const BoxDecoration(
        //     borderRadius: BorderRadius.all(Radius.circular(10)),
        //     color: ColorRes.logoColor,
        //   ),
        //   child: Image.asset(
        //     AssetRes.menuIcon,
        //     color: ColorRes.containerColor,
        //     height: 15,
        //   ),
        // ),
      ],
    ),
  );
}
