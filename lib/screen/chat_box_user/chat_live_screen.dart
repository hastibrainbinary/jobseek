import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/common/widgets/backButton.dart';
import 'package:jobseek/screen/call/call_joining_screen.dart';
import 'package:jobseek/screen/call/video_joinScreen.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class ChatLiveScreen extends StatelessWidget {
  const ChatLiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorRes.backgroundColor,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: backButton(),
                  ),
                ),
                const SizedBox(width: 85),
                Center(
                  child: Text(
                    'Chat Box',
                    style: appTextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        height: 1,
                        color: ColorRes.black),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Center(
              child: Container(
                height: 92,
                width: Get.width,
                margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    border: Border.all(
                      color: const Color(0xffF3ECFF),
                    ),
                    color: ColorRes.white),
                child: Row(
                  children: [
                    Image.asset(
                      AssetRes.airBnbLogo,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "AirBNB",
                          style: appTextStyle(
                              color: ColorRes.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Online",
                          style: appTextStyle(
                              color: ColorRes.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(width: 70),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (con) => const VideoJoinScreen()));
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: const BoxDecoration(
                          color: ColorRes.logoColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: const Icon(Icons.videocam,
                            color: ColorRes.containerColor),
                      ),
                    ),
                    const SizedBox(width: 14),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (con) => const CallJoiningScreen()));
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: const BoxDecoration(
                          color: ColorRes.logoColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: const Icon(Icons.call,
                            color: ColorRes.containerColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: 214,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xffEEEBF4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  maxLines: 6,
                ),
              ),
            ),
            Container(
              height: 50,
              width: Get.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(colors: [
                    Color(0xFFBF9EFF),
                    Color(0xFF8B4EFF),
                  ])),
              child: Center(
                child: Text(
                  "Join Interview",
                  style: appTextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ]),
    );
  }
}
