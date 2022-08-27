import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/first_page/first_Screen.dart';
import 'package:jobseek/screen/job_detail_screen/job_detail_screen.dart';
import 'package:jobseek/screen/job_detail_screen/job_detail_upload_cv_screen/upload_cv_screen.dart';
import 'package:jobseek/screen/job_detail_screen/job_details_success_or_fails/job_details_success_or_faild_screen.dart';
import 'package:jobseek/screen/job_recommendation_screen/job_recommendation_screen.dart';
import 'package:jobseek/screen/notification_screen/notification_screen.dart';
import 'package:jobseek/screen/splashScreen/splash_Screen.dart';
import 'package:jobseek/utils/app_res.dart';
import 'package:jobseek/screen/first_page/first_Screen.dart';


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
        GetPage(
            name: AppRes.notificationScreen,
            page: () => const NotificationScreen()),
        GetPage(name: AppRes.jobDetailScreen, page: () => JobDetailScreen()),
        GetPage(
            name: AppRes.jobDetailUploadCvScreen,
            page: () => JobDetailsUploadCvScreen()),
        GetPage(
            name: AppRes.jobDetailSuccessOrFailed,
            page: () => JobDetailsSuccessOrFailedScreen()),
        GetPage(
            name: AppRes.notificationScreen,
            page: () => const NotificationScreen()),
        GetPage(name: AppRes.jobDetailScreen, page: () => JobDetailScreen()),
        GetPage(
            name: AppRes.jobDetailScreen, page: () =>  JobDetailScreen()),
        GetPage(
            name: AppRes.jobRecommendationScreen,
            page: () => const JobRecommendation()),
      ],
    );
  }
}
