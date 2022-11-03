import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jobseek/service/pref_services.dart';
import 'package:jobseek/utils/pref_keys.dart';

class ManagerHomeScreenController extends GetxController implements GetxService{
  String? companyNAme;
  List userData=[];
@override
  void onInit() {
  getCompanyName();
  getUserData();
    super.onInit();
  }
  getCompanyName()async{
    companyNAme = await PrefService.getString(PrefKeys.companyName);
  }


  getUserData()async{
  var data = await  FirebaseFirestore.instance.collection("Auth")
        .doc("User")
        .collection("register")
        .get();
  userData = data.docs;
  update(['userdata']);
  update(['userDataSeeAll']);
  }

}