import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobseek/screen/auth/OtpPage/OtpScreen.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

import '../../../common/widgets/backButton.dart';
import 'ForgotPassword_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  ForgotPasswordController con = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backgroungColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.0738),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: backButton(),
                  ),
                ),
                const SizedBox(width: 46),
                Text(
                  'Forgot Password',
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w500, height: 1),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'Select which contact details should we use to reset your password',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400, fontSize: 12),
              ),
            ),
            const SizedBox(height: 16),
            GetBuilder<ForgotPasswordController>(
              id: "SMS",
              builder: (controller) => InkWell(
                onTap: controller.mobileUpdate,
                child: Container(
                  height: 120,
                  width: 339,
                  decoration: BoxDecoration(
                    color: ColorRes.white,
                    border: Border.all(
                        color: controller.isselected
                            ? ColorRes.containerColor
                            : Colors.transparent,
                        width: controller.isselected ? 1 : 0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 80,
                          width: 80,
                          padding: const EdgeInsets.all(26),
                          decoration: BoxDecoration(
                            color: ColorRes.logoColor,
                            borderRadius: BorderRadius.circular(80),
                          ),
                          child: const Image(
                            image: AssetImage(
                              AssetRes.inboxlogo,
                            ),
                            height: 10,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              textAlign: TextAlign.start,
                              'Via SMS:',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: ColorRes.black.withOpacity(0.6),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '+6282******39',
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: ColorRes.black),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GetBuilder<ForgotPasswordController>(
              id: "SMS",
              builder: (controller) => InkWell(
                onTap: controller.emailUpdate,
                child: Container(
                  height: 120,
                  width: 339,
                  decoration: BoxDecoration(
                    color: ColorRes.white,
                    border: Border.all(
                        color: controller.isselectedemail
                            ? ColorRes.containerColor
                            : Colors.transparent,
                        width: controller.isselectedemail ? 1 : 0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 80,
                          width: 80,
                          padding: const EdgeInsets.all(26),
                          decoration: BoxDecoration(
                            color: ColorRes.logoColor,
                            borderRadius: BorderRadius.circular(80),
                          ),
                          child: const Image(
                            image: AssetImage(
                              AssetRes.emailLogo,
                            ),
                            height: 10,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Via Email:',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: ColorRes.black.withOpacity(0.6),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'ex***le@yourdomain.com',
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: ColorRes.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 240),
            Container(
              height: 50,
              width: 339,
              //width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(colors: [
                  ColorRes.gradientColor,
                  ColorRes.containerColor,
                ]),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (con) => OtpScreen()));
                },
                child: Text("Continue",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: ColorRes.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
