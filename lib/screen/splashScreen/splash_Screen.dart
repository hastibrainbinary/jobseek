import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class splash_Screen extends StatelessWidget {
  const splash_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backgroungColor,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              (AssetRes.splash_screenback),
            ),
          ),
        ),
        child: Padding(
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
      ),
    );
  }
}
