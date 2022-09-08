import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/common/widgets/common_textField.dart';
import 'package:jobseek/screen/see_details/see_details_controller.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class SeeDetailsScreen extends StatelessWidget {
  const SeeDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SeeDetailsController());
    return Scaffold(
      backgroundColor: ColorRes.backgroungColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "See Details",
                  style: appTextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: ColorRes.black),
                ),
              ),
              const SizedBox(height: 30),
              const Center(
                child: Image(
                  image: AssetImage(AssetRes.detailsImage),
                  height: 100,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                " Name",
                style: appTextStyle(
                  color: ColorRes.black.withOpacity(0.6),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              commonTextFormField(
                controller: controller.nameController,
                color: ColorRes.containerColor,
                textDecoration: const InputDecoration(border: InputBorder.none),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                " Email",
                style: appTextStyle(
                  color: ColorRes.black.withOpacity(0.6),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              commonTextFormField(
                controller: controller.emailController,
                color: ColorRes.containerColor,
                textDecoration: const InputDecoration(border: InputBorder.none),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Phone Number",
                style: appTextStyle(
                  color: ColorRes.black.withOpacity(0.6),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              commonTextFormField(
                controller: controller.phoneNumberController,
                color: ColorRes.containerColor,
                textDecoration: const InputDecoration(border: InputBorder.none),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                " city",
                style: appTextStyle(
                  color: ColorRes.black.withOpacity(0.6),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              commonTextFormField(
                controller: controller.cityController,
                color: ColorRes.containerColor,
                textDecoration: const InputDecoration(border: InputBorder.none),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "State",
                style: appTextStyle(
                  color: ColorRes.black.withOpacity(0.6),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              commonTextFormField(
                controller: controller.stateController,
                color: ColorRes.containerColor,
                textDecoration: const InputDecoration(border: InputBorder.none),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Country",
                style: appTextStyle(
                  color: ColorRes.black.withOpacity(0.6),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              commonTextFormField(
                controller: controller.countryController,
                color: ColorRes.containerColor,
                textDecoration: const InputDecoration(border: InputBorder.none),
              ),
              const SizedBox(height: 25),
              Container(
                height: 50,
                width: 339,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(colors: [
                    ColorRes.gradientColor,
                    ColorRes.containerColor,
                  ]),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    "Back",
                    style: appTextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: ColorRes.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
