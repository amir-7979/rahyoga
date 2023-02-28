import 'package:get/get.dart';

import 'buy_course_controller.dart';

class BuyCourseBinding implements Bindings {
  @override
  void dependencies() => Get.lazyPut<BuyCourseController>(() =>BuyCourseController());
}