import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/authentication _format.dart';
import '../../../core/values/consts.dart';
import '../../../routes/routes.dart';
import '../../data/services/user_api_service.dart';
import '../../widgets/recovey_dialog/recover_dialog1.dart';
import '../../widgets/recovey_dialog/recover_dialog2.dart';
import '../../widgets/validate_dialog/validate_controller.dart';
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

  void gotoMainScreen() => Get.offAndToNamed(AppRoutes.mainScreen);

  String? emailValidation(String txt) => checkEmail(txt);

  String? usernameValidation(String txt) => checkUsernameLogin(txt);

  String? passwordValidation(String txt) => checkPasswordLogin(txt);

  void gotoPrevDialog()=> Get.dialog(recoverDialog1());

  Future<void> sendRecoveryCode() async{
    if (formKey2.currentState!.validate()) {
      errorText.value = '';
      update();
      //todo go next screen and send request
      /*final response = await userApiService.login(
          usernameController.value.text, passwordController.value.text);
      if (response == '200') {
        Get.back();
        Get.dialog(recoverDialog2(emailController.value.text));
      } else {
        snackbar();
*/

      Get.back();
      Get.dialog(recoverDialog2(emailController.value.text));
    }
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
      if (response == 200) {
        gotoMainScreen();
      } else {
        final response = await userApiService.verification(
            usernameController.value.text);
        if(response == 401){
          Get.dialog(validateDialog(usernameController.value.text, passwordController.value.text), barrierDismissible: false,);
        }
        else{
          errorText.value = 'error';
          errorText.value = response.toString();
          update();
        }
      }
    }
  }
}
