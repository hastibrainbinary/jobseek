import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/common/widgets/backButton.dart';
import 'package:jobseek/screen/savejobs/save_job_controller.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class SaveJobScreen extends StatelessWidget {
  SaveJobScreen({Key? key}) : super(key: key);
  final SaveJobController controller = SaveJobController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SaveJobController());
    return Scaffold(
      backgroundColor: ColorRes.backgroundColor,
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
                const SizedBox(width: 85),
                Text(
                  'Saved Jobs',
                  style: appTextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      height: 1,
                      color: ColorRes.black),
                ),
              ],
            ),
            ListView.builder(
                itemCount: controller.jobTypes.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
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
                        Image.asset(controller.jobTypesLogo[index]),
                        const SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(controller.jobTypes[index],
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                bottom(context);
                              },
                              child: Image.asset(
                                AssetRes.bookMarkFillIcon,
                                height: 20,
                              ),
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
                        ),
                        const SizedBox(width: 10)
                      ],
                    ),
                  );
                }),
          ]),
    );
  }
}

Future bottom(context) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        height: 290,
        decoration: const BoxDecoration(
          color: ColorRes.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 92,
              width: Get.width,
              margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(color: const Color(0xffF3ECFF)),
                  color: ColorRes.white),
              child: Row(
                children: [
                  Image.asset(AssetRes.twitterLogo),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Financial planner",
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(AssetRes.bookMarkFillIcon, height: 20),
                      const Spacer(),
                      Text(
                        "\$2.350",
                        style: appTextStyle(
                            fontSize: 16,
                            color: ColorRes.containerColor,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const SizedBox(width: 10)
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Remove from bookmark?",
              style: appTextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: ColorRes.black.withOpacity(0.8)),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Container(
                    height: 50,
                    width: 160,
                    decoration: BoxDecoration(
                        color: ColorRes.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: ColorRes.containerColor)),
                    child: Center(
                        child: Text(
                      "Cancel",
                      style: appTextStyle(
                        color: ColorRes.containerColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Container(
                    height: 50,
                    width: 160,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        ColorRes.gradientColor,
                        ColorRes.containerColor,
                      ]),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text(
                        "Yes, Remove",
                        style: appTextStyle(
                          color: ColorRes.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
