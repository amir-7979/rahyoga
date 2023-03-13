
import 'package:get/get.dart';

import 'recovery_password_controller.dart';

class RecoveryPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecoveryPasswordController());
  }
}