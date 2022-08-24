import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobseek/screen/frist_page/frist_Screen.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backgroungColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 230),
          Center(
            child: Image(
              height: 200,
              image: AssetImage(AssetRes.congratsLogo),
            ),
          ),
          SizedBox(height: 15),
          Center(
            child: Text(
              'Congrats!',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 26,
                  color: ColorRes.containerColor),
            ),
          ),
          SizedBox(height: 25),
          Center(
            child: Text(
              'Your account is ready to use',
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ColorRes.black),
            ),
          ),
          SizedBox(height: 150),
          Center(
            child: Container(
              height: 50,
              width: 339,
              //width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(colors: [
                  ColorRes.gradientColor,
                  ColorRes.containerColor,
                ]),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (con) => FirstScreen()));
                },
                child: Text("Go to homepage",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: ColorRes.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
