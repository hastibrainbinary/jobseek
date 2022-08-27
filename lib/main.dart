import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/first_page/first_Screen.dart';

void main() {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirstScreen(),
  ));
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
        GetPage(name: AppRes.jobDetailScreen, page: ()=> JobDetailScreen()),
        GetPage(name: AppRes.jobDetailUploadCvScreen, page: ()=> JobDetailsUploadCvScreen()),
        GetPage(name: AppRes.jobDetailSuccessOrFailed, page: ()=>  JobDetailsSuccessOrFailedScreen()),
        GetPage(
            name: AppRes.notificationScreen,
            page: () => const NotificationScreen()),
        GetPage(
            name: AppRes.jobDetailScreen, page: () => const JobDetailScreen()),
        GetPage(
            name: AppRes.jobRecommendationScreen,
            page: () => const JobRecommendation()),
      ],

    );
  }
}
