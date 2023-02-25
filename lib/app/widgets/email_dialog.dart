import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/core/languages/translator.dart';

import '../../core/theme/colors.dart';
import 'email_field.dart';

Dialog emailDialog() {
      return Dialog(
        elevation: 5,
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
                   IconButton(onPressed: ()=> Get.back(), icon: const Icon(Icons.close)),
                    Text(Translator.password_recovery.tr, style: const TextStyle(fontSize: 18),),
                  ],
                ),
                const Divider(height: 5),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                  child: Column(
                    children: [
                    textField2(TextInputType.emailAddress, Translator.email.tr),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                          child: Text(Translator.email_example.tr, style: const TextStyle(fontSize: 12, color: grayText2),),
                        ),
                      ],
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
                          Get.back();
                          Get.dialog(confirmDialog('-----------'));

                        },
                        child:  Text(
                          Translator.send_password_recover_request.tr,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),

                        ),

                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(Translator.dont_have_accounte.tr, style: const TextStyle(color: Colors.grey, fontSize: 16),),
                          TextButton(
                            onPressed: () {
                              Get.toNamed('/signup');
                            },
                            child: Text(
                              Translator.signup.tr,
                              style: const TextStyle(fontSize: 16,color: primaryColor, decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],),
                ),
              ],
            ),
          ),
        ),
      );
}

Dialog confirmDialog(String email) {
  return Dialog(
    elevation: 5,
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
                IconButton(onPressed: ()=> Get.back(), icon: const Icon(Icons.close)),
                Text(Translator.password_recovery.tr, style: const TextStyle(fontSize: 18),),
              ],
            ),
            const Divider(height: 5),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Image.asset(
                height: 95,
                width: 80,
                fit: BoxFit.fill,
                'assets/images/confirm_email.png',
              ),
            ),
            Text(Translator.recovery_link_send.tr , style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Text(Translator.recovery_text.trParams({'email':email}), style: const TextStyle(fontSize: 14, color: grayText3, fontWeight: FontWeight.w300),),
            ),

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
                  Get.back();
                },
                child:  Text(
                  Translator.understand.tr,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),

                ),

              ),
            ),
          ],
        ),
      ),
    ),
  );
}
