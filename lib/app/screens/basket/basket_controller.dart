import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/my_courses/my_courses_controller.dart';

import '../../../core/languages/translator.dart';
import '../../../routes/routes.dart';
import '../../data/models/basket.dart';
import '../../data/services/content_api_services.dart';
import '../home/home_controller.dart';

class BasketController extends GetxController{

  final ContentApiService _apiService = Get.find<ContentApiService>();
  final discountController = TextEditingController();
  Rx<Basket?> basket =  Basket().obs;
  var shopList = '';
  List courses = [].obs;
  String screenTitle = Translator.order.tr;
  String deleteAll = Translator.deleteAll.tr;
  String discountCode = Translator.discountCode.tr;
  String applyDiscount = Translator.applyDiscount.tr;
  String enterDiscount = Translator.enterDiscount.tr;
  String pay = Translator.pay.tr;
  String totalPrice = Translator.totalPrice.tr;
  String totalPrice2 = Translator.totalPrice2.tr;
  String discount = Translator.discount.tr;
  String numberOfCourses = Translator.numberOfCourses.tr;
  String orderInfo = Translator.orderInfo.tr;
  String toman2 = Translator.toman2.tr;
  RxInt isLoading = 0.obs;

  void gotoMainScreen() => Get.offAndToNamed(AppRoutes.mainScreen);

  void back()=>Get.back();

  Future<Basket?> fetchBasket() async {
  basket.value = await _apiService.getCart();
  update();
  return basket.value;
}

  Future<Basket?> deleteItemFromBasket(int id) async {
    isLoading.value = id;
    basket.value = await _apiService.deleteItemFromBasket(id.toString());
    isLoading.value = 0;
    update();
    Get.find<HomeController>().minorUpdate();
    return basket.value;
  }

  @override
  void onInit() {
    fetchBasket();
    super.onInit();
  }

  void gotoPayment()=> Get.toNamed(AppRoutes.paymentScreen, arguments: [basket.value?.seller, basket.value?.totalOffer]);

  void minorUpdate() {
    basket.value!.count = null;
    update();
    fetchBasket();
  }
  void closeDialog(){
    back();
    Get.find<MyCoursesController>().refreshPage2();
    update();
  }

}
