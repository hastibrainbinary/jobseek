import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/service/pref_services.dart';
import 'package:jobseek/utils/app_res.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../../utils/pref_keys.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
//List<String> position = [];

class JobDetailsUploadCvController extends GetxController {

  String? pdfUrl;

  onTapApply({var args}) {


    firestore
        .collection("Apply")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      //'position': PrefService.getList(PrefKeys.positionList),
      'apply': true,
      'companyName': args['CompanyName'],
      'userName': PrefService.getString(PrefKeys.fullName),
      'email': PrefService.getString(PrefKeys.email),
      'phone': PrefService.getString(PrefKeys.phoneNumber),
      'city': PrefService.getString(PrefKeys.city),
      'state': PrefService.getString(PrefKeys.state),
      'country': PrefService.getString(PrefKeys.country),
      'Occupation': PrefService.getString(PrefKeys.occupation),
      'uid': FirebaseAuth.instance.currentUser!.uid,
      'resumeUrl': pdfUrl,
    });

    Get.toNamed(AppRes.jobDetailSuccessOrFailed,
        arguments: [
          {"doc": args},
          {"error": false, "filename": filepath},
        ]);
  }

  RxString filepath = "".obs;
  RxInt? fileSize;
  RxBool isPdfUploadError = false.obs;
  bool uploadingMedia = false;

  applyResume() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: true,
      allowedExtensions: [
        'pdf',
        /* 'xlsx',
        'xlsm',
        'xls',
        'ppt',
        'pptx',
        'doc',
        'docx',
        'txt',
        'text',
        'rtf',
        'zip',*/
      ],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      // List<PlatformFile> fileList = result.files;

      debugPrint("FILES : $file");
      filepath.value = file.name.toString();
      final kb = file.size / 1024;
      final kbVal = kb.ceil().toInt();
      final mb = kb / 1024;
      fileSize?.value = kbVal;

      debugPrint("filepath $filepath FileSize ${fileSize?.value}  $kbVal");
      {
        PlatformFile file = result.files.first;
        // List<PlatformFile> fileList = result.files;

        debugPrint("FILES : $file");
        filepath.value = file.name.toString();
        fileSize?.value = file.size;
        isPdfUploadError.value = false;

        debugPrint("filepath $filepath FileSize $fileSize");
      }

      final File fileForFirebase = File(file.path!);

      uploadImage(file: fileForFirebase, path: "files/${file.name}");
    } else {
      // User canceled the picker

      isPdfUploadError.value = true;
    }
  }

  Future<String?> uploadImage({File? file, String? path}) async {
    final firebaseStorage = FirebaseStorage.instance;

    if (file != null) {

      firebaseStorage.ref().child(path!).putFile(file).snapshot;


      pdfUrl = file.path;


      // PDF url :

     /* dynamic storageRef = FirebaseStorage.instance.ref().child(path).getDownloadURL();
      storageRef.then((result) {

        //pdfUrl = result;
        print("result is $result");
      });*/


    } else {
      print('No Image Path Received');

      return '';
    }
  }

/*void documentFileUpload(String str) {

    var data = {
      "PDF": str,
    };
    snapshot.child("Documents").child('pdf').set(data).then((v) {
    });
  }*/

}
