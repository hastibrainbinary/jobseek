import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/common/widgets/backButton.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class Notification1Screen extends StatelessWidget {
  const Notification1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorRes.backgroungColor,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
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
                const SizedBox(width: 80),
                Text(
                  'Notification',
                  style: appTextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      height: 1,
                      color: ColorRes.black),
                ),
              ],
            ),
            const SizedBox(height: 25),
            SizedBox(
              height: Get.height - 150,
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin:
                        const EdgeInsets.only(left: 18, right: 18, bottom: 20),
                    padding: const EdgeInsets.all(15),
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: const Color(0xffF3ECFF)),
                        color: ColorRes.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 80,
                          child: Image(
                            image: AssetImage(AssetRes.rightLogo),
                          ),
                        ),
                        SizedBox(
                          height: 92,
                          width: Get.width / 1.5 - 26,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Your application to Apple Company has been read',
                                  style: appTextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                      color: ColorRes.black),
                                ),
                                Text(
                                  '17.00',
                                  style: appTextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: ColorRes.black.withOpacity(0.5)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ]),
    );
  }
}
