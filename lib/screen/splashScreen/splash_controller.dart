import 'package:get/get.dart';
import 'package:jobseek/screen/dashboard/dashboard_screen.dart';

class SplashController extends GetxController{
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3),(){
      Get.off(()=> DashBoardScreen());
    });
    super.onInit();
  }

}