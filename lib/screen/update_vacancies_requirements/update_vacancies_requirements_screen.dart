import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/common/widgets/backButton.dart';
import 'package:jobseek/screen/job_detail_screen/job_detail_widget/job_detail_widget.dart';
import 'package:jobseek/screen/update_vacancies_requirements/update_vacancies_requirement_controller.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class UpdateVacanciesRequirementsScreen extends StatelessWidget {
  const UpdateVacanciesRequirementsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateVacanciesRequirementController());

    return Scaffold(
      backgroundColor: ColorRes.backgroungColor,
      body: Column(children: [
        const SizedBox(height: 18),
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
            const SizedBox(width: 28),
            Text(
              'Update Vacancies',
              style: appTextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  height: 1,
                  color: ColorRes.black),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.all(10),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: ColorRes.logoColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.edit,
                color: ColorRes.containerColor,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 44,
              width: 164,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [ColorRes.gradientColor, ColorRes.containerColor],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text(
                  textAlign: TextAlign.center,
                  'Job Details',
                  style: appTextStyle(
                      color: ColorRes.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Container(
              height: 44,
              width: 164,
              decoration: BoxDecoration(
                color: ColorRes.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: ColorRes.containerColor),
              ),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text(
                  textAlign: TextAlign.center,
                  'Requirements',
                  style: appTextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: ColorRes.containerColor),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        SizedBox(
          height: 350,
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.requirements.length,
              itemBuilder: (context, index) {
                return detailBox(controller.requirements[index]);
              }),
        ),
        const SizedBox(height: 25),
        Container(
          height: 50,
          width: 339,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorRes.containerColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage(AssetRes.addIcon),
                height: 10,
              ),
              const SizedBox(width: 5),
              Text(
                'Add New Requirements',
                style: appTextStyle(
                    color: ColorRes.containerColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        const SizedBox(height: 70),
        Container(
          height: 50,
          width: 339,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [
                ColorRes.gradientColor,
                ColorRes.containerColor,
              ],
            ),
          ),
          child: Text("Update Vacancy",
              style: appTextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: ColorRes.white)),
        ),
      ]),
    );
  }
}
