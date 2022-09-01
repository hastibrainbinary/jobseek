import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UpdateVacanciesRequirementController extends GetxController {

  RxList requirements = [
    "Experienced in Figma or Sketch.",
    "Able to work in large or small team.",
    "At least 1 year of working experience in agency freelance, or start-up.",
    "Able to keep up with the latest trends.",
    "Have relevant experience for at least 3 years."
  ].obs;



}