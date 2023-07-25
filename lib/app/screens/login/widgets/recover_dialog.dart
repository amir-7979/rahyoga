import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/core/languages/translator.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/values/border_styles.dart';
import '../login_controller.dart';

final LoginController _controller = Get.find<LoginController>();

Dialog recoverDialog() {
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
            Expanded(
              child: Form(
                key: _controller.formKey2,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15, 25, 15, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 70,
                        child: TextFormField(
                          style: const TextStyle(color: black),
                          controller: _controller.phoneController,
                          keyboardType: TextInputType.phone,
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            errorStyle: Get.textTheme.headlineSmall!
                                .copyWith(color: errorText),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: Translator.phone.tr,
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
                      Flexible(child: Container()),
                      Expanded(

                          child: Container()),
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
                            _controller.sendPasswordEmail();
                          },
                          child: Text(
                            Translator.send_password_recover_request.tr,
                            style: Get.textTheme.displayLarge!.copyWith(color: white),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Translator.dont_have_accounte.tr,
                              style:
                              Get.textTheme.labelMedium!.copyWith(color: textGray),
                            ),
                            TextButton(
                              onPressed: () {
                                _controller.gotoSignupScreen();
                              },
                              child: Text(
                                Translator.signup.tr,
                                style: Get.textTheme.bodyLarge!.copyWith(color: primaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
