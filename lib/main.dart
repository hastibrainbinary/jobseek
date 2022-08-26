import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/dashboard/home/home_controller.dart';
import 'package:jobseek/screen/job_detail_screen/job_detail_screen.dart';
import 'package:jobseek/screen/notification_screen/notification_screen.dart';
import 'package:jobseek/screen/splashScreen/splash_Screen.dart';
import 'package:jobseek/utils/app_res.dart';

import 'screen/dashboard/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "jobSeek",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      initialRoute: "/",
      getPages: [
        GetPage(name: AppRes.notificationScreen, page: ()=>const NotificationScreen()),
        GetPage(name: AppRes.jobDetailScreen, page: ()=>const JobDetailScreen()),
      ],

    );
  }
}
