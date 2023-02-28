import 'package:get/get.dart';
import 'package:rahyoga/app/screens/basket/basket_controller.dart';

class BasketBinding implements Bindings {
  @override
  void dependencies() => Get.lazyPut<BasketController>(() =>BasketController());
}