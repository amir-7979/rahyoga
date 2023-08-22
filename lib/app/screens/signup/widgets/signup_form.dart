import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/signup/signup_controller.dart';

import '../../../../core/languages/translator.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/values/border_styles.dart';

class SignupForm extends StatelessWidget {
  SignupForm({Key? key}) : super(key: key);
  final SignupController _controller = Get.find<SignupController>();
  //NumberFormat _numberFormat = NumberFormat.decimalPattern('en');


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _controller.formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 28,
              child: Text(
                Translator.welcome.tr,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: white),
              ),
            ),
            const SizedBox(height: 35),
            SizedBox(
              height: 70,
              child: TextFormField(
                style: Get.theme
                    .textTheme
                    .labelMedium!
                    .copyWith(color: white),
                controller: _controller.usernameController,
                keyboardType: TextInputType.text,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                decoration: InputDecoration(
                  errorStyle:  Get.theme
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: errorText),
                  helperText: ' ',
                  filled: true,
                  fillColor: fieldColor,
                  labelText: Translator.username.tr,
                  labelStyle: const TextStyle(color: white),
                  focusedBorder: focusedBorder,
                  enabledBorder: enabledBorder,
                  border: border,
                  errorBorder: errorBorder,
                  focusedErrorBorder: errorBorder,
                ),
                validator: (txt) => _controller.usernameValidation(txt!),
                //onSubmitted: (txt) => function(controller.text),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 70,
              child: TextFormField(
                style: Get.theme
                    .textTheme
                    .labelMedium!
                    .copyWith(color: white),
                controller: _controller.phoneNumberController,
                keyboardType: TextInputType.phone,
                textAlignVertical: TextAlignVertical.center,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                decoration: InputDecoration(
                  errorStyle:  Get.theme
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: errorText),
                  helperText: '',
                  filled: true,
                  fillColor: fieldColor,
                  labelText: Translator.phone.tr,
                  labelStyle: const TextStyle(color: white),
                  focusedBorder: focusedBorder,
                  enabledBorder: enabledBorder,
                  border: border,
                  errorBorder: errorBorder,
                  focusedErrorBorder: errorBorder,

                ),
                validator: (txt) => _controller.phoneNumberValidation(txt!),
                //onSubmitted: (txt) => function(controller.text),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 70,
              child: TextFormField(
                style: Get.theme
                    .textTheme
                    .labelMedium!
                    .copyWith(color: white),
                controller: _controller.emailController,
                keyboardType: TextInputType.emailAddress,
                textAlignVertical: TextAlignVertical.center,
                textDirection: TextDirection.rtl,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                decoration: InputDecoration(
                  errorStyle:  Get.theme
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: errorText, ),
                  helperText: '',
                  filled: true,
                  fillColor: fieldColor,
                  labelText: Translator.email.tr,
                  labelStyle: const TextStyle(color: white),
                  focusedBorder: focusedBorder,
                  enabledBorder: enabledBorder,
                  border: border,
                  errorBorder: errorBorder,
                  focusedErrorBorder: errorBorder,

                ),
                validator: (txt) => _controller.emailValidation(txt!),
                //onSubmitted: (txt) => function(controller.text),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 70,
              child: Obx(
                  ()=> TextFormField(
                  style: Get.theme
                      .textTheme
                      .labelMedium!
                      .copyWith(color: white),
                  controller: _controller.passwordController,
                  obscureText: _controller.passwordVisible.value,
                  keyboardType: TextInputType.visiblePassword,
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  decoration: InputDecoration(
                    errorStyle:  Get.theme
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: errorText),
                    helperText: '',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _controller.passwordVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: white,
                      ),
                      onPressed: _controller.toggle,
                    ),
                    filled: true,
                    fillColor: fieldColor,
                    labelText: Translator.password.tr,
                    labelStyle: const TextStyle(color: white),
                    focusedBorder: focusedBorder,
                    enabledBorder: enabledBorder,
                    border: border,
                    errorBorder: errorBorder,
                    focusedErrorBorder: errorBorder,

                  ),
                  validator: (txt) => _controller.passwordValidation(txt!, _controller.passwordController2.value.text),
                  //onSubmitted: (txt) => function(controller.text),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 70,
              child: Obx(
                  ()=> TextFormField(
                  style: Get.theme
                      .textTheme
                      .labelMedium!
                      .copyWith(color: white),
                  controller: _controller.passwordController2,
                  obscureText: _controller.passwordVisible2.value,
                  keyboardType: TextInputType.visiblePassword,
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  decoration: InputDecoration(
                    errorStyle:  Get.theme
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: errorText),
                    helperText: '',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _controller.passwordVisible2.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: white,
                      ),
                      onPressed: _controller.toggle2,
                    ),
                    filled: true,
                    fillColor: fieldColor,
                    labelText: Translator.confirm_password.tr,
                    labelStyle: const TextStyle(color: white),
                    focusedBorder: focusedBorder,
                    enabledBorder: enabledBorder,
                    border: border,
                    errorBorder: errorBorder,
                    focusedErrorBorder: errorBorder,
                  ),
                  validator: (txt) => _controller.passwordValidation(txt!, _controller.passwordController.value.text),
                  //onSubmitted: (txt) => function(controller.text),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 10),
              child: Obx(() => ((_controller.errorText.value.isNotEmpty)
                  ? Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    _controller.errorText.value,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: redError),
                  ))
                  : Container(height: 0.01))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 16, 6, 0),
              child: Obx(
                ()=> ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: white,
                    elevation: 1,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    _controller.signup();
                    // TODO: Implement signup functionality
                  },
                  child: (_controller.isLoading.value)
                      ? const CircularProgressIndicator(
                    color: primaryColor,
                    strokeWidth: 3,
                  )
                      :Text(
                    Translator.signup.tr,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: primaryColor),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Translator.have_accounte.tr,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: forgetPasswordColor),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsetsDirectional.only(start: 5),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {
                      _controller.gotoLogin();
                    },
                    child: Text(
                      Translator.login.tr,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: white, decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
