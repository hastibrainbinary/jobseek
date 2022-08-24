import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobseek/screen/dashboard/home/home_controller.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';
import 'package:jobseek/utils/string.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      color: ColorRes.backgroungColor,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: ColorRes.logoColor),
                child: const Text("Logo",
                    style: TextStyle(color: ColorRes.containerColor)),
              ),
              Expanded(
                  child: Container(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Hello, ',
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: ColorRes.black)),
                      TextSpan(
                        text: 'Rakib!',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: ColorRes.containerColor,
                        ),
                      )
                    ],
                  ),
                ),
              )),
              Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: ColorRes.logoColor),
                  child: const Icon(
                    Icons.notifications,
                    color: ColorRes.containerColor,
                  )),
            ],
          ),
          const SizedBox(height: 23),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: ColorRes.white2,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: TextField(
                    controller: controller.searchController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.search, color: ColorRes.grey),
                        hintText: "Search",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w500, color: ColorRes.grey),
                        contentPadding: EdgeInsets.only(left: 20, top: 13)),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: ColorRes.logoColor,
                  ),
                  child: Image.asset(
                    AssetRes.menuIcon,
                    color: ColorRes.containerColor,
                    height: 15,
                  )),
            ],
          ),
          const SizedBox(height: 27),
          Row(
            children: [
              Text(
                "Tips for you",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Text("See all",
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ColorRes.containerColor))

              // Text("See all",style: GoogleFonts.poppins(fontSize: ),)
            ],
          ),
          const SizedBox(height: 18),
          Container(
            height: 139,
            decoration: const BoxDecoration (
              borderRadius: BorderRadius.all(Radius.circular(15)),
              gradient: LinearGradient(colors: [
                ColorRes.gradientColor,
                ColorRes.containerColor,
              ]),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20),
                  width:Get.width - 160,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                       Text(Strings.howToFindAPerfectJob,style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20,color: ColorRes.white),),
                      Container(
                        height:32,
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: Text("Read more",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 12),),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Image.asset(AssetRes.girlImage),
                const SizedBox(width: 20)
              ],
            ),

          )
        ],
      ),
    );
  }
}
