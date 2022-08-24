import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobseek/screen/splashScreen/splash_controller.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backgroungColor,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage(AssetRes.splash_screenback))),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(top: 54, right: 30),
                child: Text(
                  textAlign: TextAlign.end,
                  'Logo',
                  style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: ColorRes.splashLogoColor),
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(left: 18),
                  child: Text(
                    "Find Your",
                    style: GoogleFonts.poppins(
                        color: ColorRes.black2,
                        fontWeight: FontWeight.w500,
                        fontSize: 40),
                  )),
              Container(
                  decoration: const BoxDecoration(color: ColorRes.white),
                  child: Text(
                    "dream job",
                    style: GoogleFonts.poppins(
                        color: ColorRes.black2,
                        fontWeight: FontWeight.w500,
                        fontSize: 40),
                  )),
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.only(left: 18),
                      child: Text(
                        "here",
                        style: GoogleFonts.poppins(
                            color: ColorRes.black2,
                            fontWeight: FontWeight.w500,
                            fontSize: 40),
                      )),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      // padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(right: 20),
                      alignment: Alignment.center,
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          shape: BoxShape.circle,
                          color: ColorRes.lightBlack),
                      child: const Icon(Icons.search,color: Colors.white,size: 40,),
                    ),
                  ),
                ],
              ),

              Image.asset(
                AssetRes.splashBoyImg,
                height: Get.height / 1.5,
                width: Get.width,
                fit: BoxFit.fill,
              )
            ],
          ),
        ),
      ),
    );
  }
}
