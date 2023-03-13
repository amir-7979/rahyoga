import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/authentication _format.dart';
import '../../../routes/routes.dart';
import '../../data/services/user_api_service.dart';
import 'widgets/recover_dialog.dart';
import '../../widgets/validate_dialog/validate_dialog.dart';

class LoginController extends GetxController {
  UserApiService userApiService = Get.find<UserApiService>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final codeController = TextEditingController();
  RxBool passwordVisible = true.obs;
  RxBool isLoading = false.obs;
  RxString errorText = ''.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey3 = GlobalKey<FormState>();

  void toggle() => passwordVisible.value = !passwordVisible.value;

  void gotoSignupScreen() => Get.offAndToNamed(AppRoutes.signupScreen);

  void gotoRecoveryPasswordScreen() =>
      Get.toNamed(AppRoutes.recoveryPasswordScreen,
          arguments: emailController.value.text);

  void gotoMainScreen() => Get.offAndToNamed(AppRoutes.mainScreen);

  String? emailValidation(String txt) => checkEmail(txt);

  String? usernameValidation(String txt) => checkUsernameLogin(txt);

  String? passwordValidation(String txt) => checkPasswordLogin(txt);

  void gotoPrevDialog() => Get.dialog(recoverDialog());

  Future<void> sendEmail() async {
    final response = await userApiService.sendEmail(
        usernameController.value.text, passwordController.value.text);
    if (response == '200') {
      Get.back();
      Get.dialog(validateDialog(
          usernameController.value.text, passwordController.value.text));
    } else {
      //todo add snackbar
      Get.back();
    }
  }

  Future<void> sendPasswordEmail() async {
    final response =
        await userApiService.sendPasswordEmail(emailController.value.text);
    if (response == '200') {
      Get.back();
      gotoRecoveryPasswordScreen();
    } else {
      //todo add snackbar
      Get.back();
    }
  }

  Future<void> pureLogin() async {
     await userApiService.login(
        usernameController.value.text, passwordController.value.text);
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      errorText.value = '';
      update();
      final response = await userApiService.login(
          usernameController.value.text, passwordController.value.text);
      isLoading.value = false;
      update();
      if (response == '200') {
        gotoMainScreen();
      } else if (response == '405') {
        Get.dialog(
          validateDialog(
              usernameController.value.text, passwordController.value.text),
          barrierDismissible: false,
        );
      } else {
        errorText.value = 'error';
        errorText.value = response.toString();
        update();
      }
    }
  }
}
