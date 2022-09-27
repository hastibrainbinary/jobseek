import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                children: [
                  // Container(
                  //   height: 40,
                  //   width: 40,
                  //   padding: const EdgeInsets.only(left: 10),
                  //   decoration: BoxDecoration(
                  //       color: ColorRes.logoColor,
                  //       borderRadius: BorderRadius.circular(8)),
                  //   child: const Icon(
                  //     Icons.arrow_back_ios,
                  //     color: ColorRes.containerColor,
                  //   ),
                  // ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "See Resume",
                        style: appTextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                height: Get.height * 0.68,
                width: Get.width,
                child: Image.asset(AssetRes.resumeImage)),
            const SizedBox(
              height: 20,
            ),
            InkWell( onTap: (){
              Get.back();
            },
              child: Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(colors: [
                      Color(0xFFBF9EFF),
                      Color(0xFF8B4EFF),
                    ])),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Back",
                        style: appTextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
