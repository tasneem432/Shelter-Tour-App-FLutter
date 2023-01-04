import 'package:get/get.dart';
import 'package:tour_app/ui/drawyer_pages/faq.dart';
import 'package:tour_app/ui/drawyer_pages/how_to_use.dart';
import 'package:tour_app/ui/drawyer_pages/privacy.dart';
import 'package:tour_app/ui/drawyer_pages/settings.dart';
import 'package:tour_app/ui/views/auth/sign_in.dart';
import 'package:tour_app/ui/views/auth/sign_up.dart';
import 'package:tour_app/ui/views/onbording_screen.dart';
import 'package:tour_app/ui/views/privacy_policy.dart';
import 'package:tour_app/ui/views/splash_screen.dart';
import 'package:tour_app/ui/views/user_form.dart';

import '../drawyer_pages/support.dart';
import '../views/bottom_nav_controller.dart';
import '../views/main_home_screen.dart';

const String splash = '/splash-screen';
const String onBoarding = '/onboarding-screen';
const String signUp = '/sign-up-screen';
const String signIn = '/sign-in-screen';
const String userForm = '/user-form-screen';
const String privacyPolicy = '/privacy-policy-screen';
const String mainHomeScreen = '/main-home-screen';


const String supportScreen = '/support-screen';
const String privacyScreen = '/privacy-screen';
const String faqScreen = '/faq-screen';
const String howToUseScreen = '/how-to-use-screen';
const String settingsScreen = '/settings-screen';


//control our page rouge

List<GetPage> getPage = [
  GetPage(name: splash, page: () => SplashScreen()),
  GetPage(name: onBoarding, page: () => OnBoardingScreen()),
  GetPage(name: signUp, page: () => SignUp()),
  GetPage(name: signIn, page: () => SignIn()),
  GetPage(name: userForm, page: () => UserForm()),
  GetPage(name: privacyPolicy, page: () => PrivayPolicy()),
  GetPage(name: mainHomeScreen, page: () => MainHomeScreen()),

  GetPage(name: supportScreen, page: () => Support()),
  GetPage(name: privacyScreen, page: () => Privacy()),
  GetPage(name: faqScreen, page: () => FAQ()),
  GetPage(name: howToUseScreen, page: () => HowToUse()),
  GetPage(name: settingsScreen, page: () => Settings()),

];
