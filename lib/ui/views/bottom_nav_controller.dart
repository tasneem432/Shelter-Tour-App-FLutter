import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour_app/const/app_strings.dart';

import '../bottom_nav_pages/nav_add.dart';
import '../bottom_nav_pages/nav_favourite.dart';
import '../bottom_nav_pages/nav_home.dart';

class BottomNavController extends StatelessWidget {
  RxInt _currentIndex = 0.obs;
  RxBool _drawyer = false.obs;
  final _pages = [
    NavHome(),
    NavAdd(),
    NavFavourite(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedPositioned(
          duration: Duration(milliseconds: 400),
          top: _drawyer.value == false ? 0 : 100.h,
          bottom: _drawyer.value == false ? 0 : 100.h,
          left: _drawyer.value == false ? 0 : 200.w,
          right: _drawyer.value == false ? 0 : -100.w,
          child: Container(
            decoration: BoxDecoration(),
            child: Obx(() => Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    leading: _drawyer.value == false
                        ? IconButton(
                            onPressed: () {
                              _drawyer.value = true;
                            },
                            icon: Icon(
                              Icons.menu,
                              color: Colors.black,
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              _drawyer.value = false;
                            },
                            icon: Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          ),
                    title: Text(
                      AppStrings.appName,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  bottomNavigationBar: BottomNavigationBar(
                    onTap: (value) => _currentIndex.value = value,
                    currentIndex: _currentIndex.value,
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home_outlined), label: "Home"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.add_outlined), label: "Add"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.favorite_outline),
                          label: "Favorite"),
                    ],
                  ),
                  body: _pages[_currentIndex.value],
                )),
          ),
        ));
  }
}
