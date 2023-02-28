import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/authentication _format.dart';
import '../../../core/values/consts.dart';
import '../../../routes/routes.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool passwordVisible = true.obs;
  RxBool isLoading = false.obs;
  RxString errorText = ''.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void toggle() => passwordVisible.value = !passwordVisible.value;

  void gotoSignupScreen() => Get.offAndToNamed(AppRoutes.signupScreen);

  void gotoMainScreen() => Get.offAndToNamed(AppRoutes.mainScreen);

  String? usernameValidation(String txt) => checkUsernameLogin(txt);

  String? passwordValidation(String txt) => checkPasswordLogin(txt);

  Future<void> login() async {
    gotoMainScreen();

    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      errorText.value = '';
      update();
      //gotoMainScreen();

      /*final response = await userApiService.login(
          usernameController.value.text, passwordController.value.text);
      isLoading.value = false;
      update();

      if (response == '200') {
        gotoMainScreen();
      } else {
        errorText.value = 'error';
*//*
      errorText = response;
*//*
        update();
      }*/
    }
  }
}
