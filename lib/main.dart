import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/dashboard/applications/applications_screen.dart';
import 'package:jobseek/screen/first_page/first_Screen.dart';
import 'package:jobseek/screen/job_detail_screen/job_detail_screen.dart';
import 'package:jobseek/screen/job_detail_screen/job_detail_upload_cv_screen/upload_cv_screen.dart';
import 'package:jobseek/screen/job_detail_screen/job_details_success_or_fails/job_details_success_or_faild_screen.dart';
import 'package:jobseek/screen/job_recommendation_screen/job_recommendation_screen.dart';
import 'package:jobseek/screen/looking_for_screen/looking_for_screen.dart';
import 'package:jobseek/screen/manager_section/applicants_detail_screen/applicants_detail_screen.dart';
import 'package:jobseek/screen/manager_section/auth_manager/first_page/first_screen.dart';
import 'package:jobseek/screen/manager_section/dashboard/manager_dashboard_screen.dart';
import 'package:jobseek/screen/manager_section/manager_application_detail_screen/manager_application_detail_screen.dart';
import 'package:jobseek/screen/manager_section/resume_screen/resume_screen.dart';
import 'package:jobseek/screen/notification_screen/notification_screen.dart';
import 'package:jobseek/screen/organization_profile_screen/organization_profile_screen.dart';
import 'package:jobseek/screen/see_details/see_details_screen.dart';
import 'package:jobseek/utils/app_res.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
    statusBarIconBrightness: Brightness.dark,
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
      home: const LookingForScreen(),
      initialRoute: "/",
      getPages: [
        GetPage(
            name: AppRes.notificationScreen,
            page: () => const NotificationScreen()),
        // GetPage(name: AppRes.jobDetailScreen, page: () => JobDetailScreen()),
        GetPage(
            name: AppRes.jobDetailUploadCvScreen,
            page: () => JobDetailsUploadCvScreen()),
        GetPage(
            name: AppRes.jobDetailSuccessOrFailed,
            page: () => JobDetailsSuccessOrFailedScreen()),
        GetPage(
            name: AppRes.notificationScreen,
            page: () => const NotificationScreen()),
        //GetPage(name: AppRes.jobDetailScreen, page: () => JobDetailScreen()),
        GetPage(
            name: AppRes.jobDetailScreen,
            page: () => JobDetailScreen()),
        GetPage(
            name: AppRes.jobRecommendationScreen,
            page: () => const JobRecommendation()),
        GetPage(
            name: AppRes.jobRecommendationScreen,
            page: () => const JobRecommendation()),
        GetPage(
            name: AppRes.organizationProfileScreen,
            page: () => const OrganizationProfileScreen()),
        GetPage(
            name: AppRes.applicationsUser,
            page: () => ApplicationsScreen()),
        GetPage(
            name: AppRes.managerDashboardScreen,
            page: () => ManagerDashBoardScreen()),
        GetPage(
            name: AppRes.managerApplicationDetailScreen,
            page: () => const ManagerApplicationDetailScreen()),
        GetPage(name: AppRes.resumeScreen,
            page: () => const ResumeScreen()),
        GetPage(
            name: AppRes.applicantsDetails,
            page: () => ApplicantsDetailScreen()),
        GetPage(
            name: AppRes.firstPageScreenM,
            page: () => const FirstPageScreenM()),
        GetPage(
            name: AppRes.seeDetailsScreen,
            page: () => const SeeDetailsScreen()),
        GetPage(
            name: AppRes.firstScreen,
            page: () => FirstScreen()),
      ],
    );
  }
}
