import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';
import 'package:path_provider/path_provider.dart';


class ResumeScreen extends StatefulWidget {
   ResumeScreen({Key? key}) : super(key: key);

  @override
  State<ResumeScreen> createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  var args = Get.arguments;
  File? file;

dynamic pageImage;


  @override
  Widget build(BuildContext context) {
    pdf();
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
                  // Container(
                  //   height: 40,
                  //   width: 40,
                  //   padding: const EdgeInsets.only(left: 10),
                  //   decoration: BoxDecoration(
                  //       color: ColorRes.logoColor,
                  //       borderRadius: BorderRadius.circular(8)),
                  //   child: const Icon(
                  //     Icons.arrow_back_ios,
                  //     color: ColorRes.containerColor,
                  //   ),
                  // ),
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
            SizedBox(
              height: Get.height * 0.68,
              width: Get.width,
              child: Image.file(file!),),
           /* Image(
              image: MemoryImage(pageImage.bytes),
            ),*/
            /*SizedBox(
                height: Get.height * 0.68,
                width: Get.width,
                child: Image.asset(AssetRes.resumeImage),),*/
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

  void pdf()async{
    Completer<File> completer = Completer();
    try {

      final url = args['doc'];
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      print("Download files");
      print("${dir.path}/$filename");
       file = File("${dir.path}/$filename");

      await file?.writeAsBytes(bytes, flush: true);
      completer.complete(file);

    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    /* final PdfImage assetImage = await pdfImageFromImageProvider(
      pdf: pdf.document,
      image: const AssetImage('assets/test.jpg'),
    );*/
/*    final document = await PdfDocument.openFile(args['doc']);
    final page = await document.getPage(1);
     pageImage = await page.render(width: page.width, height: page.height);*/
  }
}
