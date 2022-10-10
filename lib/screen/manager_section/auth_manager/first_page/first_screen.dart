import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/manager_section/auth_manager/Sign_in/sign_in_screen.dart';
import 'package:jobseek/screen/manager_section/auth_manager/sign_up/sign_up_screen.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';
import 'package:url_launcher/url_launcher.dart';

class FirstPageScreenM extends StatelessWidget {
  const FirstPageScreenM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorRes.backgroungColor,
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AssetRes.firstBackScreen,
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.12),
            Text(
              'Logo',
              style: appTextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.w600,
                  color: ColorRes.black),
            ),
            SizedBox(height: Get.height * 0.12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                textAlign: TextAlign.center,
                'We currently have over 140 live roles waiting for you!',
                style: appTextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 26,
                  color: ColorRes.black.withOpacity(0.7),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.03),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (con) => SignUpScreenM()));
              },
              child: Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorRes.containerColor),
                child: Text(
                  "Create Account",
                  style: appTextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: ColorRes.white),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.03),
            Text(
              'Already have an account?',
              style: appTextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: ColorRes.black.withOpacity(0.6),
              ),
            ),
            SizedBox(height: Get.height * 0.0344),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (con) => SignInScreenM()));
              },
              child: Container(
                height: 55,
                width: 327,
                // width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: ColorRes.containerColor),
                ),
                child: Text("Sign In",
                    style: appTextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: ColorRes.containerColor)),
              ),
            ),
            SizedBox(height: Get.height * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            'By creating an account, you are agreeing\n                to our',
                        style: appTextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: ColorRes.textColor)),
                    TextSpan(
                        text: ' Terms of Service',
                        style: appTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ColorRes.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            if (!await launch(
                                "https://www.termsfeed.com/live/588c37bc-3594-490a-be8b-d9409af52df7")) {
                              throw 'Could not launch :https://www.termsfeed.com/live/588c37bc-3594-490a-be8b-d9409af52df7';
                            }
                          })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
