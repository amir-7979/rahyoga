import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecoveryPasswordController extends GetxController {


  final _passwordController = TextEditingController().obs;
  final _passwordController2 = TextEditingController().obs;
  bool passwordVisible = false;
  bool passwordVisible2 = false;


  void gotoLogin(){
    Get.back();
  }

  toggle() {
    passwordVisible = !passwordVisible;
    update();
  }
  toggle2() {
    passwordVisible2 = !passwordVisible2;
    update();
  }


  get passwordController => _passwordController;

  get passwordController2 => _passwordController2;

//todo check password with package


/** Notify changes in method, variables to the views **/
//update();

}