import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:tour_app/ui/widgets/violet_button.dart';

import '../route/route.dart';

class PrivayPolicy extends StatelessWidget {
  PdfViewerController? _pdfViewerController;
  RxBool _loaded = false.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            left: 30.w,
            right: 30.w,
            top: 20.h,
          ),
          child: Column(
            children: [
              Expanded(
                child: SfPdfViewer.network(
                  "https://firebasestorage.googleapis.com/v0/b/tour-app-f6828.appspot.com/o/privacy-policy%2F01%20Python%20Basics.pdf?alt=media&token=0812efa3-c937-40a7-988a-55a9e8b0c07a",
                  onDocumentLoaded: (PdfDocumentLoadedDetails details) {
                    _loaded.value = true;
                  },
                ),
              ),
              Obx(()=>
                _loaded == true?
                  VioletButton("Agree",()=> Get.toNamed(mainHomeScreen) ): Text("still loading")),

              VioletButton("Agree", () {
                print("Clicked");
              }),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
