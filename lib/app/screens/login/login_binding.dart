import 'package:get/get.dart';

import '../../widgets/validate_dialog/validate_controller.dart';
import 'login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() =>LoginController());
    Get.lazyPut<ValidateController>(() =>ValidateController());
  }

}