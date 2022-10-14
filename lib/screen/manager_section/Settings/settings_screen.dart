import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobseek/common/widgets/backButton.dart';
import 'package:jobseek/screen/looking_for_screen/looking_for_screen.dart';
import 'package:jobseek/screen/manager_section/Appearance/Appearance_screen.dart';
import 'package:jobseek/screen/manager_section/Notification/Notification_screen.dart';
import 'package:jobseek/screen/manager_section/help/help_screen.dart';
import 'package:jobseek/screen/manager_section/security/security_screen.dart';
import 'package:jobseek/service/pref_services.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

class SettingScreenM extends StatelessWidget {
  const SettingScreenM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorRes.backgroundColor,
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
                const SizedBox(width: 85),
                Text(
                  'Settings',
                  style: appTextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      height: 1,
                      color: ColorRes.black),
                ),
              ],
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (con) => const NotificationScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: ColorRes.logoColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Icons.notifications,
                        color: ColorRes.containerColor,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      'Notification',
                      style: appTextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: ColorRes.black),
                    ),
                    const SizedBox(width: 165),
                    const Image(
                      image: AssetImage(AssetRes.settingaArrow),
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 3),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              color: ColorRes.lightGrey.withOpacity(0.8),
              height: 1,
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (con) => const SecurityScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: ColorRes.logoColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Icons.lock,
                        color: ColorRes.containerColor,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      'Security',
                      style: appTextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: ColorRes.black),
                    ),
                    SizedBox(width: Get.width - 170),
                    const Image(
                      image: AssetImage(AssetRes.settingaArrow),
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 3),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              color: ColorRes.lightGrey.withOpacity(0.8),
              height: 1,
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (con) => const AppearanceScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: ColorRes.logoColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Icons.visibility,
                        color: ColorRes.containerColor,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      'Appearance',
                      style: appTextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: ColorRes.black),
                    ),
                    SizedBox(width: Get.width - 200),
                    const Image(
                      image: AssetImage(AssetRes.settingaArrow),
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 3),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              color: ColorRes.lightGrey.withOpacity(0.8),
              height: 1,
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (con) => const HelpScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: ColorRes.logoColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Image(
                        image: AssetImage(AssetRes.settingHelp),
                        color: ColorRes.containerColor,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      'Help',
                      style: appTextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: ColorRes.black),
                    ),
                    SizedBox(width: Get.width - 145),
                     const Image(
                      image: AssetImage(AssetRes.settingaArrow),
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 3),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              color: ColorRes.lightGrey.withOpacity(0.8),
              height: 1,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  settingModalBottomSheet(context);
                },
                child: Row(
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: ColorRes.deleteColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Image(
                        image: AssetImage(
                          AssetRes.logout,
                        ),
                        color: ColorRes.starColor,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      'Logout',
                      style: appTextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: ColorRes.black),
                    ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }

  Future settingModalBottomSheet(context) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return Container(
            height: 265,
            decoration: const BoxDecoration(
              color: ColorRes.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
                topRight: Radius.circular(45),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Image(
                  image: AssetImage(AssetRes.logout),
                  color: ColorRes.starColor,
                ),
                const SizedBox(height: 20),
                Text(
                  "Are you sure want to logout?",
                  style: appTextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: ColorRes.black.withOpacity(0.8)),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Container(
                          height: 50,
                          width: 160,
                          decoration: BoxDecoration(
                              color: ColorRes.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border:
                                  Border.all(color: ColorRes.containerColor)),
                          child: Center(
                              child: Text(
                            "Cancel",
                            style: appTextStyle(
                              color: ColorRes.containerColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () async {
                        final GoogleSignIn googleSignIn = GoogleSignIn();
                        if (await googleSignIn.isSignedIn()) {
                          await googleSignIn.signOut();
                        }
                        await FirebaseAuth.instance.signOut();
                        PrefService.clear();
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const LookingForScreen(),
                            ),
                            (route) => false);
                      },
                      child: Container(
                        height: 50,
                        width: 160,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                            ColorRes.gradientColor,
                            ColorRes.containerColor,
                          ]),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                          child: Text(
                            "Yes, Logout",
                            style: appTextStyle(
                              color: ColorRes.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }
}
