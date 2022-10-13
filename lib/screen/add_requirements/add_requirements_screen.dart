import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/common/widgets/backButton.dart';
import 'package:jobseek/screen/create_vacancies/create_vacancies_controller.dart';
import 'package:jobseek/screen/manager_section/Jobdetails/Jobdetails_screen.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class RequirementsScreen extends StatelessWidget {
  RequirementsScreen({Key? key}) : super(key: key);
  final controller = Get.put(CreateVacanciesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backgroundColor,
      body: SizedBox(
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.073),
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
                    'Add Requirements',
                    style: appTextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        height: 1,
                        color: ColorRes.black),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.034),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: Text(
                  'Requirements',
                  style: appTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1,
                      color: ColorRes.black.withOpacity(0.7)),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    GetBuilder<CreateVacanciesController>(
                      id: "requirement",
                      builder: (controller) {
                        return SizedBox(
                          child: ListView.builder(
                              padding: const EdgeInsets.only(left: 18,right: 18,top: 18),
                              shrinkWrap: true,
                              itemCount: controller.addRequirementsList.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.only(right: 10),
                                  margin: const EdgeInsets.only(top: 5,bottom: 5),
                                  width: 339,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xffF3F0F8),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 46,
                                        width: 46,
                                        padding: const EdgeInsets.all(10),
                                        child: const Image(
                                          image: AssetImage(AssetRes.checkIcon),
                                          height: 10,
                                          width: 10,
                                        ),
                                      ),
                                      Expanded(
                                        child: TextField(
                                          controller: controller.addRequirementsList[index],
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                          decoration: const InputDecoration(
                                              border: InputBorder.none, enabled: true,),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        );
                      },
                    ),
                    const SizedBox(height: 22),
                    InkWell(
                      onTap: controller.onTapAddRequirements,
                      child: Container(
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
                              height: 15,
                            ),
                            const SizedBox(width: 10),
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
                    ),
                    const SizedBox(height: 15),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          controller.onTapNext();
          /*Navigator.push(
            context,
            MaterialPageRoute(
              builder: (con) => JobDetailsScreen(
                isError: true,
              ),
            ),
          );*/
        },
        child: Container(
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
          child: Text("Post Job Vacancy",
              style: appTextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: ColorRes.white)),
        ),
      ),
    );
  }
}
