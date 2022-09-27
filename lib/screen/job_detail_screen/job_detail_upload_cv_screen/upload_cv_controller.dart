import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/utils/app_res.dart';

class JobDetailsUploadCvController extends GetxController {
  onTapApply() {
    Get.toNamed(AppRes.jobDetailSuccessOrFailed, arguments: [
      {"error": false, "filename": filepath}
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

        /*      fileList.forEach((file) async {
          if (file.size > 67108864) {
            // showErrorToast("canNotUpload".tr);
            if (file == fileList.last) {
              uploadingMedia = false;
              // notifyListeners();
            }
          } else {
            debugPrint("FILES : "+fileList.toString());
            // String? imageUrl = await storageService.uploadDocument(
            //     File(file.path!), roomId!);
            //
            // await getUploadPath(file.name, "document").then((filePath) async {
            //   await File(filePath!).create(recursive: true);
            //   await File(filePath)
            //       .writeAsBytes(await File(file.path!).readAsBytes())
            //       .then((value) {
            //     if (file == fileList.last) {
            //       uploadingMedia = false;
            //       notifyListeners();
            //     }
            //   });
            //   return filePath;
            // }
            //
            // );
          }
        });*/

      }
      /*      fileList.forEach((file) async {
          if (file.size > 67108864) {
            // showErrorToast("canNotUpload".tr);
            if (file == fileList.last) {
              uploadingMedia = false;
              // notifyListeners();
            }
          } else {
            debugPrint("FILES : "+fileList.toString());
            // String? imageUrl = await storageService.uploadDocument(
            //     File(file.path!), roomId!);
            //
            // await getUploadPath(file.name, "document").then((filePath) async {
            //   await File(filePath!).create(recursive: true);
            //   await File(filePath)
            //       .writeAsBytes(await File(file.path!).readAsBytes())
            //       .then((value) {
            //     if (file == fileList.last) {
            //       uploadingMedia = false;
            //       notifyListeners();
            //     }
            //   });
            //   return filePath;
            // }
            //
            // );
          }
        });*/

    } else {
      // User canceled the picker

      isPdfUploadError.value =true;
    }
  }

  double getFileSize(File file) {
    int sizeInBytes = file.lengthSync();
    double sizeInMb = sizeInBytes / (1024 * 1024);
    return sizeInMb;
  }
}
