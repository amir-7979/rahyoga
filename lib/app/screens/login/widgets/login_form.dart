import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/languages/translator.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/values/border_styles.dart';
import '../../../widgets/recovey_dialog/recover_dialog1.dart';
import '../login_controller.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);
  final LoginController _controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _controller.formKey,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 50, 20, 0),
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
                style: const TextStyle(color: white),
                controller: _controller.usernameController,
                keyboardType: TextInputType.text,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                decoration: InputDecoration(
                  helperText: ' ',
                  errorStyle: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: errorText),
                  hintStyle: const TextStyle(color: grayText2),
                  filled: true,
                  fillColor: fieldColor,
                  labelText: Translator.userOrEmail.tr,
                  labelStyle: const TextStyle(color: white),
                  focusedBorder: focusedBorder,
                  enabledBorder: enabledBorder,
                  border: border,
                  errorBorder: errorBorder,
                  focusedErrorBorder: errorBorder,
                ),
                validator: (txt) => _controller.usernameValidation(txt!),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 70,
              child: TextFormField(
                style: const TextStyle(color: white),
                controller: _controller.passwordController,
                obscureText: _controller.passwordVisible.value,
                keyboardType: TextInputType.visiblePassword,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                decoration: InputDecoration(
                  errorStyle: Theme.of(context)
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
                  errorBorder: errorBorder,
                  focusedErrorBorder: errorBorder,
                  border: border,
                ),
                validator: (txt) => _controller.passwordValidation(txt!),
                //onSubmitted: (txt) => function(controller.text),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: TextButton(
                onPressed: () {
                  Get.dialog(recoverDialog1());
                },
                child: Text(
                  Translator.forget_password.tr,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: forgetPasswordColor,
                      decoration: TextDecoration.underline),
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
                            .headlineSmall!
                            .copyWith(color: errorText),
                      ))
                  : Container(height: 0.01))),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(6, 10, 6, 0),
              child: Obx(
                () => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: white,
                    elevation: 0,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () async {
                    _controller.login();
                    // TODO: Implement login functionality
                  },
                  child: (_controller.isLoading.value)
                      ? const CircularProgressIndicator(
                          color: fieldColor,
                          strokeWidth: 3,
                        )
                      : Text(
                          Translator.login.tr,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: primaryColor),
                        ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Align(
              alignment: AlignmentDirectional.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Translator.dont_have_accounte.tr,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: forgetPasswordColor),
                  ),
                  TextButton(
                    onPressed: () {
                      _controller.gotoSignupScreen();
                    },
                    child: Text(
                      Translator.signup.tr,
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