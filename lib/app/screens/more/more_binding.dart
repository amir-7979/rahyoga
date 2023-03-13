import 'package:get/get.dart';

import 'more_controller.dart';

class MoreBinding implements Bindings {
  @override
  void dependencies() => Get.lazyPut<MoreController>(() =>MoreController());
}