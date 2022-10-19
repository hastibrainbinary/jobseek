import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/manager_section/manager_home_screen/manager_home_screen_widget/manager_home_screen_widget.dart';
import 'package:jobseek/screen/update_vacancies_requirements/update_vacancies_requirements_screen.dart';
import 'package:jobseek/utils/app_res.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class ManagerApplicationDetailScreen extends StatelessWidget {
  const ManagerApplicationDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: ColorRes.logoColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 11),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Logo",
                        style: appTextStyle(
                            color: ColorRes.containerColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 10),
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width - 80,
                    alignment: Alignment.center,
                    child: Text(
                      "Applications",
                      style: appTextStyle(color: ColorRes.black, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (con) =>
                            const UpdateVacanciesRequirementsScreen()));
              },
              child: Container(
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
                          height: 20,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: ColorRes.lightGreen,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Active",
                            style: appTextStyle(
                                color: ColorRes.darkGreen, fontSize: 12),
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
                    "Applicants",
                    style: appTextStyle(
                        color: const Color(0xff242424),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: Get.height * 0.6,
              child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: InkWell(
                          onTap: () => Get.toNamed(AppRes.applicantsDetails),
                          child: recentPeopleBox()),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
