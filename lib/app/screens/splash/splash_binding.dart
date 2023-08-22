import 'package:get/get.dart';
import 'package:rahyoga/app/screens/splash/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => SplashController());
  }
}