import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/routes.dart';
import '../../data/services/user_api_service.dart';

class ValidateController extends GetxController {

  UserApiService service = Get.find<UserApiService>();
  final codeController = TextEditingController();
  RxBool isLoading = false.obs;
  RxString errorText = ''.obs;

  void gotoMainScreen() => Get.offAndToNamed(AppRoutes.mainScreen);

  Future<void> checkCode(String userName, String password, String code) async {
    isLoading.value = true;
    errorText.value = '';
    update();
    final response = await service.checkCode(userName, password, code);
    if(response == 200){
      gotoMainScreen();
    }
    else{
      errorText.value = 'error';
      update();
    }
  }
}
