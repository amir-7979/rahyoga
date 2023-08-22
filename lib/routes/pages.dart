import 'package:get/get.dart';
import 'package:rahyoga/app/screens/bookmark/bookmark_binding.dart';
import 'package:rahyoga/app/screens/bookmark/bookmark_screen.dart';
import 'package:rahyoga/app/screens/more/more_screen.dart';
import 'package:rahyoga/app/screens/payment/payment_binding.dart';
import 'package:rahyoga/app/screens/payment/payment_screen.dart';
import 'package:rahyoga/app/screens/recovery_password/recovery_password_screen.dart';

import '../app/screens/article/article_binding.dart';
import '../app/screens/article/article_screen.dart';
import '../app/screens/basket/basket_binding.dart';
import '../app/screens/basket/basket_screen.dart';
import '../app/screens/buy_course/buy_course_binding.dart';
import '../app/screens/buy_course/buy_course_screen.dart';
import '../app/screens/course_info/course_info_binding.dart';
import '../app/screens/course_info/course_info_screen.dart';
import '../app/screens/home/home_binding.dart';
import '../app/screens/home/home_screen.dart';
import '../app/screens/login/login_binding.dart';
import '../app/screens/login/login_screen.dart';
import '../app/screens/main/main_binding.dart';
import '../app/screens/main/main_screen.dart';
import '../app/screens/more/more_binding.dart';
import '../app/screens/recovery_password/recovery_password_binding.dart';
import '../app/screens/signup/sginup_binding.dart';
import '../app/screens/signup/signup_screen.dart';
import '../app/screens/splash/splash_binding.dart';
import '../app/screens/splash/splash_screen.dart';
import 'routes.dart';

class AppPages {
  static final List<GetPage> pages = [

    GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: AppRoutes.loginScreen,
      page: () =>  LoginScreen(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: AppRoutes.signupScreen,
      page: () =>  SignupScreen(),
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
      name: AppRoutes.articleScreen,
      page: () => ArticleScreen(),
      binding: ArticleBinding(),
    ),

    GetPage(
      name: AppRoutes.courseInfoScreen,
      page: () => CourseInfoScreen(),
      binding: CourseInfoBinding(),
    ),

    GetPage(
      name: AppRoutes.recoveryPasswordScreen,
      page: () => RecoveryPasswordScreen(),
      binding: RecoveryPasswordBinding(),
    ),

    GetPage(
      name: AppRoutes.moreScreen,
      page: () => MoreScreen(),
      binding: MoreBinding(),
    ),

    GetPage(
      name: AppRoutes.byuCourseScreen,
      page: () => BuyCourseScreen(),
      binding: BuyCourseBinding(),
    ),

    GetPage(
      name: AppRoutes.bookmarkScreen,
      page: () => BookmarkScreen(),
      binding: BookmarkBinding(),
    ),

    GetPage(
      name: AppRoutes.paymentScreen,
      page: () => PaymentScreen(),
      binding: PaymentBinding(),
    ),
  ];
}