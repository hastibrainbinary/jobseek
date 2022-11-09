import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobseek/screen/auth/sign_inScreen/Signin_Screen.dart';
import 'package:jobseek/screen/dashboard/home/widgets/search_field.dart';
import 'package:jobseek/screen/looking_for_screen/looking_for_screen.dart';
import 'package:jobseek/screen/search_job/search_job_screen.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class HomePageNewScreenU extends StatelessWidget {
  const HomePageNewScreenU({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            Row(children: [
              Container(
                margin: const EdgeInsets.all(15),
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
              const Spacer(),
              Center(
                child: Text(
                  'Job Seeker',
                  style: appTextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      height: 1,
                      color: ColorRes.black),
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.all(15),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: ColorRes.logoColor,
                    borderRadius: BorderRadius.circular(10)),
                child: const InkWell(
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (con) => Notification(),
                  //     ),
                  //   );
                  // },
                  child: Icon(
                    Icons.notifications,
                    color: ColorRes.containerColor,
                  ),
                ),
              ),
            ]),
            const SizedBox(height: 10),
            searchArea(),
            const SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 1),
              color: ColorRes.logoColor,
              height: 1,
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Make the most of Job Seeker by creating your job profile ',
                style: GoogleFonts.playfairDisplay(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: ColorRes.black),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: const [
                  Icon(
                    Icons.star,
                    color: ColorRes.orange,
                  ),
                  SizedBox(width: 13),
                  Text(
                    "Get discovered directly by recruiters",
                    style: TextStyle(
                        color: ColorRes.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 62.0),
              child: Text(
                "Recruiters will not post a job 70% of the time",
                style: TextStyle(
                    color: ColorRes.black.withOpacity(0.5),
                    fontSize: 11,
                    fontWeight: FontWeight.w300),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: const [
                  Icon(
                    Icons.star,
                    color: ColorRes.orange,
                  ),
                  SizedBox(width: 13),
                  Text(
                    "Find relevant job recommendations",
                    style: TextStyle(
                        color: ColorRes.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 62.0),
              child: Text(
                "Relevance is better for complete profiles",
                style: TextStyle(
                    color: ColorRes.black.withOpacity(0.5),
                    fontSize: 11,
                    fontWeight: FontWeight.w300),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      Get.to(()=>LookingForScreen());
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 15),
                      height: 36,
                      width: 95,
                      decoration: BoxDecoration(
                          color: ColorRes.containerColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: ColorRes.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: (){
                      Get.to(()=>SigninScreenU());
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 15),
                      height: 36,
                      width: 95,
                      decoration: BoxDecoration(
                          color: ColorRes.logoColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          "Log in",
                          style: TextStyle(
                              color: ColorRes.containerColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      decoration: const BoxDecoration(),
                      child: const Image(
                        image: AssetImage(
                          AssetRes.HomeImage,
                        ),
                        height: 132,
                      ))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 1),
              color: ColorRes.logoColor,
              height: 10,
            ),
            const SizedBox(height: 15),
            const Center(
              child: Image(
                image: AssetImage(
                  AssetRes.Home2,
                ),
                height: 150,
              ),
            ),
            const Center(
              child: Text(
                "Find your dream job",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: ColorRes.black),
              ),
            ),
            const SizedBox(height: 13),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter skills, designations, companies',
                  focusColor: Colors.green,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter location',
                  focusColor: Colors.green,
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Get.to(()=>SearchJobScreen());
              },
              child: Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  height: 36,
                  width: 119,
                  decoration: BoxDecoration(
                      color: ColorRes.containerColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      "Search jobs",
                      style: TextStyle(
                          color: ColorRes.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 1),
              color: ColorRes.logoColor,
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
