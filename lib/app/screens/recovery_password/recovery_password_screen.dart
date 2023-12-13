import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/languages/translator.dart';
import '../../../core/theme/colors.dart';
import '../../../core/values/border_styles.dart';
import 'recovery_password_controller.dart';

class RecoveryPasswordScreen extends GetView<RecoveryPasswordController> {
  RecoveryPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.5,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.black,
          leading: BackButton(
              color: Colors.black, onPressed: () => controller.gotoLogin()),
          title: Text(
            Translator.password_recovery.tr,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        body: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70,
                  child: TextFormField(
                    style: const TextStyle(color: black),
                    controller: controller.codeController,
                    keyboardType: TextInputType.text,
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    decoration: InputDecoration(
                      errorStyle: Get.textTheme.headlineSmall!
                          .copyWith(color: errorText),
                      helperText: '',
                      helperStyle: Get.textTheme.labelSmall!.copyWith(color: grayText2),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: Translator.code.tr,
                      labelStyle: const TextStyle(color: primaryColor),
                      focusedBorder: focusedBorder3,
                      enabledBorder: enabledBorder3,
                      border: border3,
                      errorBorder: errorBorder3,
                      focusedErrorBorder: errorBorder3,
                    ),

                    //onSubmitted: (txt) => function(controller.text),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 70,
                  child: Obx(
                        ()=> TextFormField(
                          style: const TextStyle(color: black),
                      controller: controller.passwordController,
                      obscureText: controller.passwordVisible.value,
                      keyboardType: TextInputType.visiblePassword,
                      onEditingComplete: () => FocusScope.of(context).nextFocus(),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.passwordVisible.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: primaryColor,
                          ),
                          onPressed: controller.toggle,
                        ),
                        errorStyle: Get.textTheme.headlineSmall!
                            .copyWith(color: errorText),
                        helperText: '',
                        helperStyle: Get.textTheme.labelSmall!.copyWith(color: grayText2),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: Translator.password.tr,
                        labelStyle: const TextStyle(color: primaryColor),
                        focusedBorder: focusedBorder3,
                        enabledBorder: enabledBorder3,
                        border: border3,
                        errorBorder: errorBorder3,
                        focusedErrorBorder: errorBorder3,
                      ),
                      validator: (txt) => controller.passwordValidation(txt!, controller.passwordController2.value.text),
                      //onSubmitted: (txt) => function(controller.text),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 70,
                  child: Obx(
                        ()=> TextFormField(
                          style: const TextStyle(color: black),
                      controller: controller.passwordController2,
                      obscureText: controller.passwordVisible2.value,
                      keyboardType: TextInputType.visiblePassword,
                      onEditingComplete: () => FocusScope.of(context).nextFocus(),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.passwordVisible2.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: primaryColor,
                          ),
                          onPressed: controller.toggle2,
                        ),
                        errorStyle: Get.textTheme.headlineSmall!
                            .copyWith(color: errorText),
                        helperText: '',
                        helperStyle: Get.textTheme.labelSmall!.copyWith(color: grayText2),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: Translator.password.tr,
                        labelStyle: const TextStyle(color: primaryColor),
                        focusedBorder: focusedBorder3,
                        enabledBorder: enabledBorder3,
                        border: border3,
                        errorBorder: errorBorder3,
                        focusedErrorBorder: errorBorder3,
                      ),
                      validator: (txt) => controller.passwordValidation(txt!, controller.passwordController.value.text),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10),
                  child: Obx(() => ((controller.errorText.value.isNotEmpty)
                      ? Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        controller.errorText.value,
                        style: Get.theme
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: errorText),
                      ))
                      : Container(height: 0.01))),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.fromLTRB(6, 16, 6, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: primaryColor,
                      elevation: 5,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      controller.changePassword();
                    },
                    child: Text(
                      Translator.confirm_and_change_password.tr,
                      style: Get.textTheme.displayLarge!.copyWith(color: white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
