import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/job_detail_screen/job_detail_widget/job_detail_widget.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class JobDetailScreen extends StatelessWidget {
  const JobDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const SizedBox(height: 60,),
            SizedBox(
              height: 50,
              width: Get.width,
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        padding: const EdgeInsets.only(left: 10),
                        margin: const EdgeInsets.only(left: 10),
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
                      Container(
                        height: 50,
                        width: 50,
                        padding: const EdgeInsets.only(left: 0),
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: ColorRes.logoColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(AssetRes.bookMarkBorderIcon,height: 30,width: 30,),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Center(
                      child: Text(
                        "Notification",
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
            const SizedBox(height: 30,),
            Container(
              height: 92,
              width: Get.width,
              margin:
              const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
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
                      Text("United States - Full Time",
                          style: appTextStyle(
                              color: ColorRes.black,
                              fontSize: 9,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                  const Spacer(),
                  /*Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(
                        AssetRes.bookMarkFillIcon,
                        height: 20,
                      ),
                      const Spacer(),
                      Text(
                        "\$2.350",
                        style: appTextStyle(
                            fontSize: 16,
                            color: ColorRes.containerColor,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),*/
                  const SizedBox(width: 10)
                ],
              ),
            ),
            Container(
              width: Get.width,
              margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius:
                  const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(color: const Color(0xffF3ECFF)),
                  color: ColorRes.white),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text("Salary",
                          style: appTextStyle(
                              color: ColorRes.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                      Text("\$2.350",
                          style: appTextStyle(
                              color: ColorRes.containerColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text("Type",
                          style: appTextStyle(
                              color: ColorRes.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                      Text("Full Time",
                          style: appTextStyle(
                              color: ColorRes.containerColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text("Location",
                          style: appTextStyle(
                              color: ColorRes.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                      Text("United States",
                          style: appTextStyle(
                              color: ColorRes.containerColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Requirements",style: appTextStyle(color: ColorRes.black),),
                  const SizedBox(height: 20,),
                  detailBox("Experienced in Figma or Sketch."),

                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}
