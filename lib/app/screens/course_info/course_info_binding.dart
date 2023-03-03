import 'package:get/get.dart';
import 'course_info_controller.dart';


class CourseInfoBinding implements Bindings {
  @override
  void dependencies() => Get.lazyPut<CourseInfoController>(() =>CourseInfoController());
}