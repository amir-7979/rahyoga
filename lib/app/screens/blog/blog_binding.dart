import 'package:get/get.dart';

import 'blog_controller.dart';

class BlogBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlogController>(() =>BlogController());
  }

}