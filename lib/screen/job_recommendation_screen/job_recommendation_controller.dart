import 'package:get/get.dart';

class JobRecommendationController extends GetxController implements GetxService{
  RxInt selectedJobs2 = 0.obs;
  RxList jobs2 = ["All Job", "Writer", "Design", "Finance"].obs;

  onTapJobs2(int index){
    selectedJobs2.value = index;
    //update(["hList"]);
  }


}