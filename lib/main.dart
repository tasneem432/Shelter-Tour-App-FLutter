import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_app/const/app_colors.dart';
import 'package:tour_app/const/app_strings.dart';
import 'package:tour_app/ui/route/route.dart';
import 'package:tour_app/ui/views/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(App());

}

class App extends StatelessWidget {
  //Creating the initialization Future outside of "build"
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    name: "Shelter",
    options: FirebaseOptions(
        apiKey: "AIzaSyDF6EJEqqZSQGaw6FCBk4D_wyTNqeRTBaA",
        appId: "1:770765862015:android:8cb383174a669cb01c3b4a",
        messagingSenderId: '770765862015',
        projectId: "tour-app-f6828"),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          //Check for error
          if (snapshot.hasError) {
            return Center(child: CircularProgressIndicator());
          }

          //Once conplete, shot your application
          if (snapshot.connectionState == ConnectionState.done) {
            return MyApp();
          }

          //Otherwise, show something whilst waiting for initialization
          return Center(child: CircularProgressIndicator());
        });
  }
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.scaffoldColor,
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme.apply(),
            ),
          ),
          title: AppStrings.appName,
          initialRoute: splash,
          getPages: getPage,
          home: SplashScreen(),
        );
      },
    );
  }
}
