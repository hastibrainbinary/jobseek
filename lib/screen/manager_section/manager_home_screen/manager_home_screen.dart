import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/dashboard/home/widgets/search_field.dart';
import 'package:jobseek/screen/manager_section/Recent%20People%20Application/recent_Application_screen.dart';
import 'package:jobseek/screen/manager_section/manager_home_screen/manager_home_screen_widget/manager_home_screen_widget.dart';
import 'package:jobseek/screen/manager_section/notification1/notification1_screen.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class ManagerHomeScreen extends StatelessWidget {
  const ManagerHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: ColorRes.logoColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Logo',
                        style: appTextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: ColorRes.containerColor),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (con) => const Notification1Screen()));
                    },
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: ColorRes.logoColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.notifications,
                          color: ColorRes.containerColor,
                        )),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome,",
                        style: appTextStyle(
                            color: ColorRes.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "AirBNB!",
                        style: appTextStyle(
                            color: ColorRes.containerColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        searchArea(),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tips for you",
                style: appTextStyle(
                    color: ColorRes.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "See all",
                  style: appTextStyle(
                      color: ColorRes.containerColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                        color: ColorRes.lightGreen,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      "Active",
                      style:
                          appTextStyle(color: ColorRes.darkGreen, fontSize: 12),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "\$2.350",
                    style: appTextStyle(
                        fontSize: 16,
                        color: ColorRes.containerColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(width: 10)
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent People Application",
                style: appTextStyle(
                    color: ColorRes.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (con) => const RecentApplicationScreen()));
                },
                child: Text(
                  "See all",
                  style: appTextStyle(
                      color: ColorRes.containerColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: recentPeopleBox(),
        )
      ],
    );
  }
}
