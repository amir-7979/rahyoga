import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/widgets/validate_dialog/validate_controller.dart';
import 'package:rahyoga/core/languages/translator.dart';
import '../../../core/theme/colors.dart';
import '../../../core/values/border_styles.dart';


Dialog validateDialog(String userName, String password) {
  final ValidateController _controller = Get.find<ValidateController>();

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
            Row(
              children: [
               /* todo check after IconButton(
                    onPressed: () => Get.back(), icon: const Icon(Icons.close)),*/
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 0, 15),
                  child: Text(
                    Translator.password_recovery.tr,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            const Divider(height: 5),
            Padding(
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
                      maxLines: 3,
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
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextButton(
                    onPressed: () {
                      //todo go to see_all screen
                    },
                    child: Text(
                      'دریافت دوباره کد تاید',
                      style:Get.theme.textTheme.displayMedium!.copyWith(
                          color: primaryColor, decoration: TextDecoration.underline),
                    ),
                  ),
                  const SizedBox(height: 15),

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
                        _controller.checkCode(userName, password, _controller.codeController.value.text);
                      },
                      child: Text(
                        Translator.confirm.tr,
                        style: Get.textTheme.displayLarge!.copyWith(color: white),
                      ),
                    ),
                  ),
                 /*todo  Padding(
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                    child: Text(
                      Translator.enterConfirmCode.tr,
                      maxLines: 3,
                      style: Get.textTheme.displayMedium!.copyWith(color: textGray),
                    ),
                  ),*/
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
