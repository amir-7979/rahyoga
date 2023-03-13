import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/authentication _format.dart';
import '../../data/services/user_api_service.dart';

class RecoveryPasswordController extends GetxController {
  UserApiService userApiService = Get.find<UserApiService>();
  String? email;
  final codeController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordController2 = TextEditingController();
  RxBool passwordVisible = true.obs;
  RxBool passwordVisible2 = true.obs;
  RxBool isLoading = false.obs;
  RxString errorText = ''.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void gotoLogin(){
    Get.back();
  }

  void toggle() => passwordVisible.value = !passwordVisible.value;

  void toggle2() => passwordVisible2.value = !passwordVisible2.value;

  String? passwordValidation(String txt1, String text2) => checkPasswordSignUp(txt1, text2);

  Future<void> changePassword() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      errorText.value = '';
      update();
      final response = await userApiService.changePasswordCode(email??'', codeController.value.text, passwordController.value.text);
      isLoading.value = false;
      update();
      if (response == 200) {
        gotoLogin();
      } else {
        errorText.value = 'error';
        update();
      }
    }
  }

  @override
  void onInit() {
    email = Get.arguments;
    super.onInit();
  }

}