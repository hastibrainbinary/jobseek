import 'package:get/get.dart';
import 'package:jobseek/service/pref_services.dart';
import 'package:jobseek/utils/pref_keys.dart';

class ManagerHomeScreenController extends GetxController implements GetxService{
  String? companyNAme;
@override
  void onInit() {
  getCompanyName();
    super.onInit();
  }
  getCompanyName()async{
    companyNAme = await PrefService.getString(PrefKeys.companyName);
  }
}