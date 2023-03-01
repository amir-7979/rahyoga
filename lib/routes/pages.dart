import 'package:get/get.dart';
import 'package:rahyoga/app/screens/basket/basket_screen.dart';
import 'package:rahyoga/app/screens/buy_course/buy_course_screen.dart';
import 'package:rahyoga/app/screens/home/home_screen.dart';
import 'package:rahyoga/app/screens/login/login_screen.dart';
import 'package:rahyoga/app/screens/main/main_screen.dart';
import 'package:rahyoga/app/screens/signup/sginup_binding.dart';
import 'package:rahyoga/app/screens/signup/signup_screen.dart';
import 'package:rahyoga/app/screens/splash/splash_binding.dart';
import 'package:rahyoga/app/screens/splash/splash_screen.dart';
import 'package:rahyoga/routes/routes.dart';
import '../app/screens/basket/basket_binding.dart';
import '../app/screens/buy_course/buy_course_binding.dart';
import '../app/screens/home/home_binding.dart';
import '../app/screens/login/login_binding.dart';
import '../app/screens/main/main_binding.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: AppRoutes.loginScreen,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.signupScreen,
      page: () => SignupScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: AppRoutes.mainScreen,
      page: () => MainScreen(),
      binding: MainScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.basketScreen,
      page: () => BasketScreen(),
      binding: BasketBinding(),
    ),
    GetPage(
      name: AppRoutes.buyCourseScreen,
      page: () => BuyCourseScreen(),
      binding: BuyCourseBinding(),
    ),
  ];
}