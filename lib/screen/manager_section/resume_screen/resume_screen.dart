
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';

import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';

import 'package:jobseek/utils/color_res.dart';

class ResumeScreen extends StatefulWidget {
  const ResumeScreen({Key? key}) : super(key: key);

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

            /* SizedBox(
          height: 500,
          child: FutureBuilder(
              future: DefaultCacheManager().getSingleFile(
                  '${args['doc']}.pdf'),
              builder: (context,snapshot) {
                print(snapshot.data);
              return PdfDocumentLoader.openFile(
                snapshot.data.toString(),
                documentBuilder: (context, pdfDocument, pageCount) => LayoutBuilder(
                  builder: (context, constraints) => ListView.builder(
                      itemCount: pageCount,
                      itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.all(0),
                          padding: EdgeInsets.all(18),
                          height: 200,
                          color: Colors.black12,
                          child: PdfPageView(
                            pdfDocument: pdfDocument,
                            pageNumber: index + 1,
                          )
                      )
                  )
                )
              );
            }
          ),
        ),*/


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
              child: Image.asset(AssetRes.resumeImage),
            ),
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

  // imageFromPdfFile2(File pdfFile) async {
  //   List imageList = [];
  //   int height = 0, width = 0;
  //
  //   final document = await pdf_ren.PDFDocument.openFile(pdfFile.path);
  //   im.Image imImage;
  //   for (int i = 1; i <= document.pagesCount; i++) {
  //     final page = await document.getPage(i);
  //     final pdfPageImage =
  //     await page.render(width: page.width, height: page.height);
  //     imImage = im.decodeImage(pdfPageImage.bytes); // First issue in this line
  //     height += imImage.height;
  //     // the width should correspond to the maximum
  //     // width of the image: it should not exceed it
  //     if (imImage.width > width ) {
  //       width =  imImage.width;
  //     }
  //     imageList.add(imImage);
  //     await page.close();
  //   }
  //
  //   im.Image mergedImage = im.Image(width, height);
  //   // Merge generated image vertically as vertical-orientated-multi-pdf
  //   for (var i = 0; i < imageList.length; i++) {
  //     // one page height
  //     final onePageImageOffset = height / document.pagesCount;
  //     // offset for actual page from by y axis
  //     final actualPageOffset = onePageImageOffset  * i;
  //
  //     im.copyInto(
  //       mergedImage,
  //       imageList[i],
  //       blend: true,
  //       srcY: actualPageOffset, // or dstY
  //     );
  //   }
  //
  //   savePdfAndImageDB(pdfFile, imImage.getBytes());
  // }

  // pdf()async{
  //
  //   final config = Configuration("####-####-####-####-####", "##################");
  //   final wordsApi = WordsApi(config);
  //
  //   final doc = (await File("${args['resumeUrl']}.pdf").readAsBytes()).buffer.asByteData();
  //   final request = SplitDocumentOnlineRequest(doc, 'png', zipOutput: true);
  //   final split = await wordsApi.splitDocumentOnline(request);
  //
  //   print(split);
  // }
}
