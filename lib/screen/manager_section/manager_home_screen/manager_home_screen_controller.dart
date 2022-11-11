import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jobseek/service/pref_services.dart';
import 'package:jobseek/utils/pref_keys.dart';

class ManagerHomeScreenController extends GetxController
    implements GetxService {
  String? companyName;
  List userData = [];
    bool loader=false;

  @override
  Future<void> onInit() async {
    getCompanyName();
    getUserData();
    super.onInit();
  }

  getCompanyName() async {
    companyName = PrefService.getString(PrefKeys.companyName);
  }

  getUserData() async {
    loader=true;
    update(['userdata']);

    var data = await FirebaseFirestore.instance.collection("Apply").get();
    userData = data.docs;

    loader =false;
    update(['userdata']);
    update(['userDataSeeAll']);
  }
}
