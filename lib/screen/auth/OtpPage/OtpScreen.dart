import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:jobseek/common/widgets/backButton.dart';
import 'package:jobseek/screen/auth/OtpPage/OtpController.dart';
import 'package:jobseek/screen/auth/ResetPasswordPage/ResetPasswordScreen.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({Key? key}) : super(key: key);
  OtpController controller = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorRes.backgroungColor,
        body: Column(children: [
          SizedBox(height: Get.height * 0.0369),
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
          SizedBox(height: Get.height * 0.19),
          Text(
            'Code has been send to +6282******39',
            style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: ColorRes.black),
          ),
          SizedBox(height: Get.height * 0.05),
          Pinput(
            autofocus: true,
            keyboardType: TextInputType.number,
            length: 4,
            showCursor: true,
            closeKeyboardWhenCompleted: true,
            defaultPinTheme: controller.defaultTheme,
            focusedPinTheme: controller.defaultTheme.copyDecorationWith(
              border:
                  Border.all(color: const Color.fromRGBO(139, 78, 255, 0.05)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(height: Get.height * 0.01),
          controller.otpError == ''
              ? const SizedBox(height: 20)
              : Container(
                  width: 339,
                  height: 28,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: ColorRes.invalidColor),
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage(
                            AssetRes.invalid,
                          ),
                          height: 14,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Invalid OTP code',
                          style: GoogleFonts.poppins(
                              fontSize: 9,
                              fontWeight: FontWeight.w400,
                              color: ColorRes.starColor),
                        ),
                      ]),
                ),
          SizedBox(height: Get.height * 0.0600),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Resend code in ',
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: ColorRes.black)),
              Text(
                '${controller.seconds}',
                style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: ColorRes.containerColor),
              ),
              Text(
                ' s',
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: ColorRes.black),
              ),
            ],
          ),
          SizedBox(height: Get.height * 0.2640),
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
                    MaterialPageRoute(builder: (con) => ResetPasswordScreen()));
              },
              child: Text("Verify",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: ColorRes.white)),
            ),
          ),
          SizedBox(height: Get.height * 0.0381),
        ]),
      ),
    );
  }
}
