import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:rahyoga/app/screens/main/main_controller.dart';

import '../home/home_controller.dart';

class MainScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() =>MainController());
    Get.lazyPut<HomeController>(() =>HomeController());
  }
}