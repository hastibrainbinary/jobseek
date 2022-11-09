import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';

import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';

import 'package:jobseek/utils/color_res.dart';

import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart'as http;
import 'package:permission_handler/permission_handler.dart';

class ResumeScreen extends StatefulWidget {
   ResumeScreen({Key? key}) : super(key: key);

  @override
  State<ResumeScreen> createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  var args = Get.arguments;
  PDFViewController? _pdfViewController;

   //var docFile;

  @override
  Widget build(BuildContext context) {
    //docFile = DefaultCacheManager().getSingleFile("https://firebasestorage.googleapis.com/v0/b/jobseek-5275d.appspot.com/o/files%2FDocument%20from%20Jyot%20Vavadiya?alt=media&token=e8da4c45-8050-4022-bc4d-32b6b6703634");
    return Scaffold(
      backgroundColor: ColorRes.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                children: [

                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "See Resume",
                        style: appTextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            /*SizedBox(
              height: Get.height * 0.63,
              width: Get.width,
              child: PDFView(
                filePath: docFile.path,
                onViewCreated: (PDFViewController v) {
                  _pdfViewController = v;
                },
              ),
            ),*/
           /* SizedBox(
                height: Get.height * 0.68,
                width: Get.width,
                child: Image.network(args['doc']),),*/
            SizedBox(
                height: Get.height * 0.68,
                width: Get.width,
                child: Image.asset(AssetRes.resumeImage),),
            const SizedBox(
              height: 20,

            ),

            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(colors: [
                      Color(0xFFBF9EFF),
                      Color(0xFF8B4EFF),
                    ])),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Back",
                        style: appTextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );

  }
}
