import 'package:get/get.dart';
import 'package:rahyoga/app/screens/blog/blog_controller.dart';
import 'package:rahyoga/app/screens/main/main_controller.dart';
import 'package:rahyoga/app/screens/my_courses/my_courses_controller.dart';
import 'package:rahyoga/app/screens/profile/profile_controller.dart';

import '../home/home_controller.dart';

class MainScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() =>MainController());
    Get.lazyPut<HomeController>(() =>HomeController());
    Get.lazyPut<MyCoursesController>(() =>MyCoursesController());
    Get.lazyPut<ProfileController>(() =>ProfileController());
    Get.lazyPut<BlogController>(() =>BlogController());

  }
}