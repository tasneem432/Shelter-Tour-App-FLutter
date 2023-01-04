import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour_app/const/app_colors.dart';
import 'package:tour_app/ui/route/route.dart';
import 'package:tour_app/ui/styles/styles.dart';
import 'package:tour_app/ui/widgets/violet_button.dart';

import '../../../business_logics/auth.dart';

class SignUp extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            left: 30.w,
            right: 30.w,
            top: 80.h,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create \nYour Account",
                  style: TextStyle(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.violetColor,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  "Create your account and start your journey",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 80.h,
                ),
                TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration:
                        AppStyles().textFieldDecoration("E-mail Address")),
                TextFormField(
                  controller: _passwordController,
                  decoration:
                      AppStyles().textFieldDecoration("Enter your password"),
                ),
                SizedBox(
                  height: 40.h,
                ),
                VioletButton(
                    "Create account",
                    () => Auth().registration(_emailController.text,
                        _passwordController.text, context)),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "--OR--",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset("assets/icons/search.png"),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset("assets/icons/facebook.png"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Already an user?    ",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      children: [
                        TextSpan(
                          text: "Log In",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.violetColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.toNamed(signIn),
                        ),
                      ]),
                ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
