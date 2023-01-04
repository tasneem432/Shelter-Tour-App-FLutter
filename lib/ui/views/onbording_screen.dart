import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tour_app/const/app_colors.dart';
import 'package:tour_app/ui/route/route.dart';

import '../styles/styles.dart';

class OnBoardingScreen extends StatelessWidget {
  List<String> _lottieFiles = [
    'assets/files/welcome.json',
    'assets/files/categories.json',
    'assets/files/support.json',
  ];

  List<String> _title = [
    'Welcome',
    'Categories',
    'Support',
  ];

  List<String> _description = [
    '1 Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
    '2 Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
    '3 Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
  ];

  RxInt _currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          children: [
            Obx(
              () => Expanded(
                  flex: 2,
                  child: Lottie.asset(_lottieFiles[_currentIndex.toInt()])),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.scaffoldColor,
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(4.0, 4.0),
                        blurRadius: 5,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() => Text(
                              _title[_currentIndex.toInt()],
                              style: AppStyles().mytextStyle,
                            )),
                        Obx(
                          () => Text(_description[_currentIndex.toInt()]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => DotsIndicator(
                                dotsCount: _lottieFiles.length,
                                position: _currentIndex.toDouble(),
                                decorator: DotsDecorator(),
                              ),
                            ),
                            InkWell(
                              onTap: (() {
                                if (_currentIndex == _title.length - 1) {
                                  Get.toNamed(signUp);
                                } else {
                                  _currentIndex + 1;
                                }
                              }),
                              child: Container(
                                width: 37.w,
                                height: 37.h,
                                decoration: BoxDecoration(
                                  color: AppColors.scaffoldColor,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(4, 4),
                                        blurRadius: 10,
                                        spreadRadius: 1.0),
                                    BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(-4, -4),
                                        blurRadius: 5,
                                        spreadRadius: 1),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
