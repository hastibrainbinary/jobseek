import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrganizationProfileScreenController extends GetxController
    implements GetxService {
  TextEditingController companyName = TextEditingController();
  TextEditingController companyEmail = TextEditingController();
  TextEditingController companyAddress = TextEditingController();

  RxBool isNameValidate = false.obs;
  RxBool isEmailValidate = false.obs;
  RxBool isAddressValidate = false.obs;

  validateAndSubmit(){
    if(companyName.text.isEmpty){
      isNameValidate.value = true;
    }else{
      isNameValidate.value = false;
    }
     if(companyEmail.text.isEmpty||!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(companyEmail.text)){
      isEmailValidate.value = true;
    }else{
       isEmailValidate.value = false;
     }
      if(companyAddress.text.isEmpty){
      isAddressValidate.value = true;
    }else{
        isAddressValidate.value = false;
      }

  }

}
