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
List companyList = [];

bool abc = false;

class JobDetailsUploadCvController extends GetxController {

  init() async {

    await firestore.collection("Apply").get().then((value) {
      value.docs.forEach((element) {
        if (element['uid'] == PrefService.getString(PrefKeys.userId)) {
          companyList = element['companyName'];
        }
      });

      /*for (int i = 1; i <= value.docs.length; i++) {
        if (value.docs[i]['uid'] == PrefService.getString(PrefKeys.userId)) {
          companyList = value.docs[i]['companyName'];
        }
      }*/

    });
  }

  String? pdfUrl;

  onTapApply({var args}) {

    abc = false;
    for (int i = 0; i < companyList.length; i++) {
      if (companyList[i] == args['CompanyName']) {
        abc = true;
      }
    }

    if (!abc) {
      companyList.add(args['CompanyName']);
    }

    List<String> companyNameList = List.generate(companyList.length, (index) {
      return companyList[index].toString();
    });
    print(companyNameList);

    firestore
        .collection("Apply")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'apply': true,
      'companyName': companyNameList,
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

    Get.toNamed(AppRes.jobDetailSuccessOrFailed, arguments: [
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

      //pdfUrl = file.path;

      // PDF url :

      dynamic storageRef =
          FirebaseStorage.instance.ref().child(path).getDownloadURL();
      storageRef.then((result) {
        pdfUrl = result;
        print("result is $result");

      });
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
