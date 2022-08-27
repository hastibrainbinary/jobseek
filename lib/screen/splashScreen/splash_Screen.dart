import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobseek/screen/first_page/first_Screen.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),(){
      Get.off(()=> const FirstScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider backgroundImage = const AssetImage(AssetRes.splash_screenback);
    backgroundImage.resolve(createLocalImageConfiguration(context));
    ImageProvider backgroundImageBoy = const AssetImage(AssetRes.splashBoyImg);
    backgroundImageBoy.resolve(createLocalImageConfiguration(context));
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        // decoration: const BoxDecoration(
        //   gradient:LinearGradient(colors: [
        //     Color(0xFFBAE5F5),
        //     Color(0xFFFADFA8),
        //     Color(0xFFE2D3FE),
        //     Color(0xFFCCF0C0),
        //   ], begin: Alignment.topLeft,
        //     end: Alignment.topRight,
        //     stops: [0.1, 0.4, 0.7, 0.9],
        //   )
        // ),
        decoration:  BoxDecoration(
            image: DecorationImage(
                image: backgroundImage,
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(top: 54, right: 30),
              child: Text(
                textAlign: TextAlign.end,
                'Logo',
                style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: ColorRes.splashLogoColor),
              ),
            ),
            SizedBox(
              height: 140,
              // decoration: BoxDecoration(border: Border.all()),
              child: Row(
                children: [
                  Container(
                    height: 110,
                    margin: const EdgeInsets.only(bottom: 20),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Find Your  \n',
                              style: GoogleFonts.poppins(
                                color: ColorRes.black2,
                                fontWeight: FontWeight.w500,
                                fontSize: 40,
                                height: 1,
                              )),
                          TextSpan(
                            text: ' dream job \n',
                            style: GoogleFonts.poppins(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              color: ColorRes.black2,
                              background: Paint()..color = Colors.white,
                              height: 1,
                            ),
                          ),
                          TextSpan(
                              text: ' here',
                              style: GoogleFonts.poppins(
                                  color: ColorRes.black2,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 40,
                                  height: 1))
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 140,
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: const EdgeInsets.only(right: 35),
                      alignment: Alignment.center,
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          shape: BoxShape.circle,
                          color: ColorRes.black2),
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            Image.asset(
              AssetRes.splashBoyImg,
              height: Get.height / 1.5,
              width: Get.width,
              fit: BoxFit.fill,
              filterQuality: FilterQuality.none,
            )
          ],
        ),
      ),
    );
  }
}
