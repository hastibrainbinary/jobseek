import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/dashboard/applications/applications_screen.dart';
import 'package:jobseek/screen/dashboard/dashboard_controller.dart';
import 'package:jobseek/screen/dashboard/home/home_screen.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({Key? key}) : super(key: key);
  final DashBoardController controller = Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backgroungColor,
      body: GetBuilder<DashBoardController>(
        id: "bottom_bar",
        builder: (controller) {
          return controller.currentTab == 0
              ?  HomeScreen()
              : controller.currentTab == 1
                  ?  ApplicationsScreen()
                  : controller.currentTab == 2
                      ? const Center(child: Text("page 2"))
                      : const Center(child: Text("page 3"));
        },
      ),
      bottomNavigationBar: GetBuilder<DashBoardController>(
        id: "bottom_bar",
        builder: (controller) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 18),
            decoration: const BoxDecoration(
                color: ColorRes.white,
                // border: Border.all(),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: SalomonBottomBar(
              margin: const EdgeInsets.all(12),
              selectedItemColor: ColorRes.containerColor,
              unselectedItemColor: ColorRes.containerColor,
              currentIndex: controller.currentTab,
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
                    color: controller.currentTab == 0
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
                    color: controller.currentTab == 1
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
                    color: controller.currentTab == 2
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
                    color: controller.currentTab == 3
                        ? ColorRes.containerColor
                        : ColorRes.containerColor,
                  ),
                  title: Text("Profile", style: bottomTitleStyle),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
