import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/common/widgets/backButton.dart';
import 'package:jobseek/screen/manager_section/Jobdetails/Jobdetails_screen.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';
import 'add_requirements_controller.dart';

class RequirementsScreen extends StatelessWidget {
  RequirementsScreen({Key? key}) : super(key: key);
  final controller = Get.put(AddRequirementController());

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
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'Requirements',
              style: appTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 1,
                  color: ColorRes.black.withOpacity(0.7)),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 350,
                child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          // detailBox(controller.requirements[index]),
                          (controller.text.value == true)
                              ? Container(
                                  //padding: EdgeInsets.symmetric( vertical: 10),
                                  height: 46,
                                  width: 339,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xffF3F0F8),
                                  ),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.check_circle_outline,
                                          color: ColorRes.containerColor,
                                          size: 30,
                                        )),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      );
                    }),
              ),
              const SizedBox(height: 22),
              InkWell(
                onTap: () {
                  controller.text.value = true;
                },
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
              ),
              const SizedBox(height: 60),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (con) => JobDetailsScreen( isError: false,)));
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
            ],
          ),
        ],
      ),
    );
  }
}
