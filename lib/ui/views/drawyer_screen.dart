import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour_app/const/app_strings.dart';
import 'package:tour_app/ui/route/route.dart';

import '../widgets/drawyer_item.dart';

class DrawyerScreen extends StatelessWidget {
  const DrawyerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, top: 50.h, bottom: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.appName,
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Travel Agency",
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            drawyerItem("Support", ()=> Get.toNamed(supportScreen)), 
            drawyerItem("Privacy", ()=> Get.toNamed(privacyScreen)), 
            drawyerItem("FAQ", ()=> Get.toNamed(faqScreen)), 
            drawyerItem("Rate US", () {}),
            drawyerItem("How to use", ()=> Get.toNamed(howToUseScreen)),
            Expanded(child: SizedBox()),
            InkWell(
              onTap: ()=> Get.toNamed(settingsScreen),
              child: Text("Settings", style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
 
              ), ),
            ),
          ],
        ),
      ),
    );
  }
}
