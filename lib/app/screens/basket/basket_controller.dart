import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/languages/translator.dart';
import '../../../routes/routes.dart';

class BasketController extends GetxController{
  final discountController = TextEditingController();

  var shopList = '';
  List courses = [].obs;
  String screenTitle = Translator.order.tr;
  String ordersTitle = Translator.courses2.trParams({'number':'3'});
  String deleteAll = Translator.deleteAll.tr;
  String discountCode = Translator.discountCode.tr;
  String applyDiscount = Translator.applyDiscount.tr;
  String enterDiscount = Translator.enterDiscount.tr;
  String pay = Translator.pay.tr;
  String totalPrice = Translator.totalPrice.tr;
  String discount = Translator.discount.tr;
  String numberOfCourses = Translator.numberOfCourses.tr;
  String orderInfo = Translator.orderInfo.tr;
  String courseCount = Translator.course2.trParams({'number':'2'});
  String toman = Translator.toman.trParams({'number':'123456'});
  String toman2 = Translator.toman2.tr;

  void gotoMainScreen() => Get.offAndToNamed(AppRoutes.mainScreen);
  void deleteAllCourses() => courses = [];
  void deleteCourse(int i) => courses.removeAt(i);
  void setDiscount(String discount){
    //todo ask arman
    shopList = shopList;
    update();
  }
  void goPay(String discount){
    //todo ask arman

  }
  void back()=> Get.back();


}
