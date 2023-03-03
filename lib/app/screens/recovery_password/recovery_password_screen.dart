import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/recovery_password/recovery_password_controller.dart';
import '../../../core/languages/translator.dart';
import '../../../core/theme/colors.dart';

class RecoveryPasswordScreen extends StatelessWidget {
  RecoveryPasswordScreen({Key? key}) : super(key: key);
  final RecoveryPasswordController _ctrl =
      Get.put(RecoveryPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 1,
        leading: BackButton(color: Colors.black, onPressed: () => Get.back()),
        backgroundColor: Colors.white,
        title: Text(
      Translator.password_recovery.tr,
      style: const TextStyle(color: Colors.black
          ),
    ),

      ),
      body: Padding(
    padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('data'),
        const SizedBox(height: 10),
        SizedBox(
          height: 50,
          child: TextFormField(
            //controller: controller,
            obscureText: _ctrl.passwordVisible2,
            keyboardType: TextInputType.visiblePassword,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
            decoration: InputDecoration(
              hintStyle: TextStyle(color: grayText2),
              focusColor: primaryColor,
              suffixIcon: IconButton(
                icon: Icon(
                  _ctrl.passwordVisible2
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: grayText2,
                ),
                onPressed: _ctrl.toggle2(),
              ),
              filled: true,
              fillColor: primaryColor,
              labelText: Translator.password.tr,
              labelStyle: const TextStyle(color: primaryColor),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: primaryColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: grayText2,
                ),
              ),
            ),
            // validator: (txt) => function(),
            //onSubmitted: (txt) => function(controller.text),
          ),
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
              // TODO: Implement functionality
            },
            child: Text(
              Translator.confirm_password.tr,
              style: const TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    ),
      ),
    );
  }
}
