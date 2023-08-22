import 'package:get/get.dart';
import 'payment_controller.dart';

class PaymentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentController>(() =>PaymentController());
  }

}