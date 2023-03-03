import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/core/languages/translator.dart';
import '../../../core/theme/colors.dart';
import '../../../core/values/border_styles.dart';
import '../../screens/login/login_controller.dart';

final LoginController _controller = Get.find<LoginController>();

Dialog recoverDialog2(String email) {
  return Dialog(
    elevation: 5,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0))),
    child: SizedBox(
      height: 350,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Column(
          children: [
            SizedBox(height: 5,),
            Row(
              children: [
                IconButton(
                    onPressed: () => Get.back(), icon: const Icon(Icons.close)),
                Text(
                  Translator.password_recovery.tr,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const Divider(height: 5),
            Form(
              key: _controller.formKey3,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15, 25, 15, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 70,
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(color: black),
                        controller: _controller.codeController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          errorStyle: Get.textTheme.headlineSmall!
                              .copyWith(color: errorText),
                          //hintText: Translator.code.tr,
                          helperText: '',
                          helperStyle: Get.textTheme.labelSmall!.copyWith(color: grayText2),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: Translator.confirmCode.tr,
                          labelStyle: const TextStyle(color: primaryColor),
                          focusedBorder: focusedBorder3,
                          enabledBorder: enabledBorder3,
                          border: border3,
                          errorBorder: errorBorder3,
                          focusedErrorBorder: errorBorder3,
                        ),
                        validator: (txt) => _controller.emailValidation(txt!),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                      child: Text(
                        Translator.enterConfirmCode.tr,
                        maxLines: 3,
                        style: Get.textTheme.displayMedium!.copyWith(color: textGray),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(6, 16, 6, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          backgroundColor: fieldColor,
                          elevation: 0,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {
                          //todo function
                         // _controller.sendRecoveryCode();
                        },
                        child: Text(
                          Translator.confirm.tr,
                          style: Get.textTheme.displayLarge!.copyWith(color: white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
