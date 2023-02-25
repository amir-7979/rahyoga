import 'package:get/get.dart';
import 'package:rahyoga/app/screens/signup/signup_controller.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() =>SignupController());
  }
}