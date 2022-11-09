import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobseek/common/widgets/backButton.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class SearchJobScreen extends StatelessWidget {
  const SearchJobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: backButton(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Search jobs',
                    style: appTextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        height: 1,
                        color: ColorRes.black),
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 18,right: 18),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Skills, designations, companies',
                focusColor: Colors.green,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Location',
                focusColor: Colors.green,
              ),
            ),
          ),
          InkWell(
            onTap: (){

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
            height: 10,
            color: ColorRes.containerColor.withOpacity(0.2),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              'Your most recent searches',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: ColorRes.black,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Container(
              //margin: const EdgeInsets.symmetric(horizontal: 18),
              height: 67,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              color: ColorRes.white,
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  [
                    Image.asset(AssetRes.search,height: 15,width: 15,),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Supervisor,Gurgaon/Guru...",style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                        )),
                        const SizedBox(height: 6,),
                        Text("2 new",style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: ColorRes.containerColor
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
