import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tour_app/const/app_strings.dart';
import 'package:tour_app/ui/route/route.dart';
import 'package:get/get.dart';
import 'package:tour_app/ui/styles/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();


  Future chooseScreen() async {
    var userId = box.read("uid");
    print(userId);

    if(userId == null){
      Get.toNamed(onBoarding);
    }else{
      Get.toNamed(mainHomeScreen);
    }

  }


  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () => chooseScreen());
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FlutterLogo(
            size: 100.w,
          ),
          Text(
            AppStrings.appName,
            style: AppStyles().mytextStyle,
          ),
        ],
      ),
    )));
  }
}
