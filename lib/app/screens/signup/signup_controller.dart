import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/authentication _format.dart';
import '../../../routes/routes.dart';
import '../../data/services/user_api_service.dart';
import '../../widgets/validate_dialog/validate_dialog.dart';

class SignupController extends GetxController {
  UserApiService userApiService = Get.find<UserApiService>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordController2 = TextEditingController();
  RxBool passwordVisible = true.obs;
  RxBool passwordVisible2 = true.obs;
  RxBool isLoading = false.obs;
  RxString errorText = ''.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void gotoLogin() => Get.offAndToNamed(AppRoutes.loginScreen);

  void toggle() => passwordVisible.value = !passwordVisible.value;

  void toggle2() => passwordVisible2.value = !passwordVisible2.value;

  String? usernameValidation(String txt) => checkUsernameSignUp(txt);

  String? passwordValidation(String txt1, String text2) => checkPasswordSignUp(txt1, text2);

  String? emailValidation(String txt) => checkEmail(txt);

  Future<void> signup() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      errorText.value = '';
      update();
      final response = await userApiService.signup(
          usernameController.value.text, emailController.value.text, passwordController.value.text);
      isLoading.value = false;
      update();
      if (response == 201) {
          Get.dialog(validateDialog(usernameController.value.text, passwordController.value.text), barrierDismissible: false, );

      } else {
        errorText.value = 'error';
        update();
      }
    }
  }

}
