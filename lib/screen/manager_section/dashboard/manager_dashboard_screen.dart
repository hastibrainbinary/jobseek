// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/chat_box/chat_box_screen.dart';
import 'package:jobseek/screen/manager_section/Profile/profile_screen.dart';
import 'package:jobseek/screen/manager_section/dashboard/manager_dashboard_screen_controller.dart';
import 'package:jobseek/screen/manager_section/manager_application_screen/manger_application_screen.dart';
import 'package:jobseek/screen/manager_section/manager_home_screen/manager_home_screen.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class ManagerDashBoardScreen extends StatelessWidget {
  ManagerDashBoardScreen({Key? key}) : super(key: key);
  ManagerDashBoardScreenController controller =
      Get.put(ManagerDashBoardScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorRes.backgroungColor,
        body: Obx(() => controller.currentTab.value == 0
            ? const ManagerHomeScreen()
            : controller.currentTab.value == 1
                ? ManagerApplicationScreen()
                : controller.currentTab.value == 2
                    ? ChatBoxScreen()
                    : ProfileScreen()),
        bottomNavigationBar: Obx(() => Container(
              margin: const EdgeInsets.symmetric(horizontal: 18),
              decoration: const BoxDecoration(
                  color: ColorRes.white,
                  // border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: SalomonBottomBar(
                margin: const EdgeInsets.all(12),
                selectedItemColor: const Color(0xff8B4EFF),
                unselectedItemColor: ColorRes.containerColor,
                currentIndex: controller.currentTab.value,
                onTap: (int index) {
                  controller.onBottomBarChange(index);
                },
                items: [
                  /// Home
                  SalomonBottomBarItem(
                    selectedColor: ColorRes.containerColor,
                    icon: Image.asset(
                      AssetRes.home,
                      height: 16,
                      width: 16,
                      color: controller.currentTab.value == 0
                          ? ColorRes.containerColor
                          : ColorRes.containerColor,
                    ),
                    title: Text("Home", style: bottomTitleStyle),
                  ),

                  /// application
                  SalomonBottomBarItem(
                    icon: Image.asset(
                      AssetRes.application,
                      height: 16,
                      width: 16,
                      color: controller.currentTab.value == 1
                          ? ColorRes.containerColor
                          : ColorRes.containerColor,
                    ),
                    title: Text("Applications", style: bottomTitleStyle),
                  ),

                  /// chat
                  SalomonBottomBarItem(
                    icon: Image.asset(
                      AssetRes.chat,
                      height: 16,
                      width: 16,
                      color: controller.currentTab.value == 2
                          ? ColorRes.containerColor
                          : ColorRes.containerColor,
                    ),
                    title: Text(
                      "Chat",
                      style: bottomTitleStyle,
                    ),
                  ),

                  /// Profile
                  SalomonBottomBarItem(
                    icon: Image.asset(
                      AssetRes.profile,
                      height: 16,
                      width: 16,
                      color: controller.currentTab.value == 3
                          ? ColorRes.containerColor
                          : ColorRes.containerColor,
                    ),
                    title: Text("Profile", style: bottomTitleStyle),
                  ),
                ],
              ),
            )));
  }
}
