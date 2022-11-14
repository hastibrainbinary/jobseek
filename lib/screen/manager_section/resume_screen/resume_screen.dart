//
// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:get/get.dart';
//
// import 'package:jobseek/utils/app_style.dart';
// import 'package:jobseek/utils/asset_res.dart';
//
// import 'package:jobseek/utils/color_res.dart';
//
// class ResumeScreen extends StatefulWidget {
//   const ResumeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ResumeScreen> createState() => _ResumeScreenState();
// }
//
// class _ResumeScreenState extends State<ResumeScreen> {
//   var args = Get.arguments;
//   PDFViewController? _pdfViewController;
//
//   //var docFile;
//   @override
//   Widget build(BuildContext context) {
//
//     //docFile = DefaultCacheManager().getSingleFile("https://firebasestorage.googleapis.com/v0/b/jobseek-5275d.appspot.com/o/files%2FDocument%20from%20Jyot%20Vavadiya?alt=media&token=e8da4c45-8050-4022-bc4d-32b6b6703634");
//     return Scaffold(
//       backgroundColor: ColorRes.black,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: Get.height * 0.1,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Stack(
//                 children: [
//                   Align(
//                     alignment: Alignment.center,
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 10),
//                       child: Text(
//                         "See Resume",
//                         style: appTextStyle(color: Colors.white, fontSize: 20),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//
//             /* SizedBox(
//           height: 500,
//           child: FutureBuilder(
//               future: DefaultCacheManager().getSingleFile(
//                   '${args['doc']}.pdf'),
//               builder: (context,snapshot) {
//                 print(snapshot.data);
//               return PdfDocumentLoader.openFile(
//                 snapshot.data.toString(),
//                 documentBuilder: (context, pdfDocument, pageCount) => LayoutBuilder(
//                   builder: (context, constraints) => ListView.builder(
//                       itemCount: pageCount,
//                       itemBuilder: (context, index) => Container(
//                           margin: EdgeInsets.all(0),
//                           padding: EdgeInsets.all(18),
//                           height: 200,
//                           color: Colors.black12,
//                           child: PdfPageView(
//                             pdfDocument: pdfDocument,
//                             pageNumber: index + 1,
//                           )
//                       )
//                   )
//                 )
//               );
//             }
//           ),
//         ),*/
//
//
//             /*SizedBox(
//               height: Get.height * 0.63,
//               width: Get.width,
//               child: PDFView(
//                 filePath: docFile.path,
//                 onViewCreated: (PDFViewController v) {
//                   _pdfViewController = v;
//                 },
//               ),
//             ),*/
//             /* SizedBox(
//                 height: Get.height * 0.68,
//                 width: Get.width,
//                 child: Image.network(args['doc']),),*/
//             SizedBox(
//               height: Get.height * 0.68,
//               width: Get.width,
//               child: Image.asset(AssetRes.resumeImage),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             InkWell(
//               onTap: () {
//                 Get.back();
//               },
//               child: Container(
//                 height: 50,
//                 margin: const EdgeInsets.symmetric(horizontal: 20),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     gradient: const LinearGradient(colors: [
//                       Color(0xFFBF9EFF),
//                       Color(0xFF8B4EFF),
//                     ])),
//                 child: Center(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const Icon(
//                         Icons.arrow_back,
//                         color: Colors.white,
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                         "Back",
//                         style: appTextStyle(color: Colors.white, fontSize: 20),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   // imageFromPdfFile2(File pdfFile) async {
//   //   List imageList = [];
//   //   int height = 0, width = 0;
//   //
//   //   final document = await pdf_ren.PDFDocument.openFile(pdfFile.path);
//   //   im.Image imImage;
//   //   for (int i = 1; i <= document.pagesCount; i++) {
//   //     final page = await document.getPage(i);
//   //     final pdfPageImage =
//   //     await page.render(width: page.width, height: page.height);
//   //     imImage = im.decodeImage(pdfPageImage.bytes); // First issue in this line
//   //     height += imImage.height;
//   //     // the width should correspond to the maximum
//   //     // width of the image: it should not exceed it
//   //     if (imImage.width > width ) {
//   //       width =  imImage.width;
//   //     }
//   //     imageList.add(imImage);
//   //     await page.close();
//   //   }
//   //
//   //   im.Image mergedImage = im.Image(width, height);
//   //   // Merge generated image vertically as vertical-orientated-multi-pdf
//   //   for (var i = 0; i < imageList.length; i++) {
//   //     // one page height
//   //     final onePageImageOffset = height / document.pagesCount;
//   //     // offset for actual page from by y axis
//   //     final actualPageOffset = onePageImageOffset  * i;
//   //
//   //     im.copyInto(
//   //       mergedImage,
//   //       imageList[i],
//   //       blend: true,
//   //       srcY: actualPageOffset, // or dstY
//   //     );
//   //   }
//   //
//   //   savePdfAndImageDB(pdfFile, imImage.getBytes());
//   // }
//
//   // pdf()async{
//   //
//   //   final config = Configuration("####-####-####-####-####", "##################");
//   //   final wordsApi = WordsApi(config);
//   //
//   //   final doc = (await File("${args['resumeUrl']}.pdf").readAsBytes()).buffer.asByteData();
//   //   final request = SplitDocumentOnlineRequest(doc, 'png', zipOutput: true);
//   //   final split = await wordsApi.splitDocumentOnline(request);
//   //
//   //   print(split);
//   // }
// }

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobseek/common/widgets/common_loader.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'package:jobseek/utils/color_res.dart';

class ResumeScreen extends StatefulWidget {
  ResumeScreen({Key? key}) : super(key: key);

  @override
  State<ResumeScreen> createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  var args = Get.arguments;
  PDFViewController? _pdfViewController;
  String remotePDFpath = "";
  bool loader = false;

  //var docFile;
  int? pages = 0;
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

    void initState() {
      super.initState();

      createFileOfPdfUrl().then((f) {
        setState(() {
          remotePDFpath = f.path;
        });
      });
      print(remotePDFpath);
    }

    Future<File> createFileOfPdfUrl() async {
      loader = true;
      Completer<File> completer = Completer();
      print("Start download file from internet!");
      try {
        // "https://berlin2017.droidcon.cod.newthinking.net/sites/global.droidcon.cod.newthinking.net/files/media/documents/Flutter%20-%2060FPS%20UI%20of%20the%20future%20%20-%20DroidconDE%2017.pdf";
        // final url = "https://pdfkit.org/docs/guide.pdf";
        var url = args['doc'];
        final filename = url.substring(url.lastIndexOf("/") + 1);
        var request = await HttpClient().getUrl(Uri.parse(url));
        var response = await request.close();
        var bytes = await consolidateHttpClientResponseBytes(response);
        var dir = await getApplicationDocumentsDirectory();
        print("Download files");
        print("${dir.path}/$filename");
        File file = File("${dir.path}/$filename");

        await file.writeAsBytes(bytes, flush: true);
        completer.complete(file);
        loader = false;
      } catch (e) {
        throw Exception('Error parsing asset file!');
      }

      return completer.future;
    }

    @override
    Widget build(BuildContext context) {
      //docFile = DefaultCacheManager().getSingleFile("https://firebasestorage.googleapis.com/v0/b/jobseek-5275d.appspot.com/o/files%2FDocument%20from%20Jyot%20Vavadiya?alt=media&token=e8da4c45-8050-4022-bc4d-32b6b6703634");
      return Scaffold(
        backgroundColor: ColorRes.black,
        body: loader == true
            ? const Center(
          child: CommonLoader(),
        )
            : Stack(
          children: <Widget>[
            Container(
              height: Get.height,
              width: Get.width,
              color: ColorRes.black,
            ),
            Positioned(
              top: 50,
              child: SizedBox(
                height: 600,
                width: Get.width,
                child: PDFView(
                  filePath: remotePDFpath,
                  enableSwipe: true,
                  swipeHorizontal: true,

                  autoSpacing: false,
                  pageFling: true,
                  pageSnap: true,
                  defaultPage: currentPage!,
                  fitPolicy: FitPolicy.BOTH,
                  preventLinkNavigation: false,
                  // if set to true the link is handled in flutter
                  onRender: (pages) {
                    setState(() {
                      pages = pages;
                      isReady = true;
                    });
                  },
                  onError: (error) {
                    setState(() {
                      errorMessage = error.toString();
                    });
                    if (kDebugMode) {
                      print(error.toString());
                    }
                  },
                  onPageError: (page, error) {
                    setState(() {
                      errorMessage = '$page: ${error.toString()}';
                    });
                    if (kDebugMode) {
                      print('$page: ${error.toString()}');
                    }
                  },
                  onViewCreated: (PDFViewController pdfViewController) {
                    _controller.complete(pdfViewController);
                  },
                  onLinkHandler: (String? uri) {
                    if (kDebugMode) {
                      print('goto uri: $uri');
                    }
                  },
                  onPageChanged: (int? page, int? total) {
                    if (kDebugMode) {
                      print('page change: $page/$total');
                    }
                    setState(() {
                      currentPage = page;
                    });
                  },
                ),
              ),
            ),
            const Positioned(
              top: 10,
              left: 150,
              child: Center(
                child: Text(
                  "See Resume",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: ColorRes.white),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  width: Get.width - 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      colors: [
                        ColorRes.logoColor,
                        ColorRes.containerColor,
                      ],
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.arrow_back,
                          color: ColorRes.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Back",
                          style: appTextStyle(
                              color: ColorRes.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            errorMessage.isEmpty
                ? !isReady
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : const SizedBox()
                : Center(
              child: Text(errorMessage),
            )
          ],
        ),
      );
    }
  }
