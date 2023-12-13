import 'package:flutter/material.dart';
import 'package:get/get.dart';

String? checkUsernameLogin(String txt) {
  if (txt.isEmpty) return 'نام کاربری یا ایمیل نمیتواند خالی باشد';
  if (txt.length < 4) return "نام کاربری باید بیش از چهار حرف باشد";
  if (txt.contains('-')) return "- مجاز نیست";
  //check for email pattern
  return null;
}

String? checkUsernameSignUp(String txt) {
  if (txt.isEmpty) return 'نام کاربری نمیتواند خالی باشد';
  if (txt.length < 4) return "نام کاربری باید بیش از چهار حرف باشد";
  if (txt.contains('-')) return "- مجاز نیست";
  if (txt.isEmail) return 'نمیتوانید از ایمیل استفاده کنید';

  //check for email pattern
  return null;
}

String? checkPasswordSignUp(String txt1, String txt2) {
  if (txt1.isEmpty) return 'رمز عبور نمیتواند خالی باشد';
  if (!txt1.contains(RegExp(r'[0-9]'))) return "رمز عبور باید شامل عدد باشد";
  if (txt1.length < 6) return "رمز عبور باید بیش از پنج حرف باشد";
  if (txt1 != txt2) return "رمز عبور مطابقت ندارد";
  if (txt1.contains(' ')) return "کاراکتر فاصله مجاز نیست'";
  return null;
}

String? checkEmail(String txt) {
  if (txt.isEmpty) return 'ایمیل نمی تواند خالی باشد';
  if (!txt.isEmail) return 'لطفا ایمیل معتبر وارد کنید';
  return null;
}

String? checkPhoneNumberSignUp(String txt) {
  //todo
  if (txt.isEmpty && GetPlatform.isAndroid) return 'لطفا شماره تلفن همراه را وارد کنید';
  if (!txt.isPhoneNumber) return 'لطفا شماره تلفن معتبر وارد کنید';
  return null;
}

String? checkPasswordLogin(String txt1) {
  if (txt1.isEmpty) return 'رمز عبور نمیتواند خالی باشد';
  if (!txt1.contains(RegExp(r'[0-9]'))) return "رمز عبور باید شامل عدد باشد";
  if (txt1.length < 6) return "رمز عبور باید بیش از پنج حرف باشد";
  if (txt1.contains(' ')) return "کاراکتر فاصله مجاز نیست";
  return null;
}


TextFormField buildTextField(BuildContext context, TextEditingController controller, TextInputType inputType, Function function, String text) {
  return TextFormField(
    style: const TextStyle(color: Colors.white),
    controller: controller,
    keyboardType: inputType,
    onEditingComplete: () => FocusScope.of(context).nextFocus(),
    decoration: InputDecoration(
      labelText: text,
      labelStyle: const TextStyle(color: Colors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
    validator: (txt) => function(),
    //onSubmitted: (txt) => function(controller.text),
  );
}

TextFormField buildTextField2(BuildContext context, bool passwordVisible,
    TextEditingController controller, TextInputType inputType, Function function, Function toggle, String text) {
  return  TextFormField(
    obscureText: passwordVisible,
    style: const TextStyle(color: Colors.white),
    controller: controller,
    onEditingComplete: () => FocusScope.of(context).nextFocus(),
    keyboardType: inputType,
    validator: (txt) => function(),
    decoration: InputDecoration(
      labelText: text,
      labelStyle: const TextStyle(color: Colors.grey),
      suffixIcon: IconButton(
        icon: Icon(
          passwordVisible
              ? Icons.visibility_off
              : Icons.visibility,
          color: Colors.white,
        ),
        onPressed: toggle(),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
  );
}



TextField buildTextField3(BuildContext context, bool passwordVisible,
    TextEditingController controller, TextInputType inputType, Function function, Function toggle,
    bool bol, String? msg, String text) {
  return  TextField(
    obscureText: passwordVisible,
    style: const TextStyle(color: Colors.white),
    controller: controller,
    onEditingComplete: () {FocusScope.of(context).nextFocus();
      //checkPasswordLogin2(_loginUserNameController.text);
    },
    keyboardType: inputType,
    onSubmitted: (txt) => function(controller.text),
    decoration: InputDecoration(
      errorText: bol ? null : msg,
      labelText: text,
      labelStyle: const TextStyle(color: Colors.grey),
      suffixIcon: IconButton(
        icon: Icon(
          passwordVisible
              ? Icons.visibility_off
              : Icons.visibility,
          color: Colors.white,
        ),
        onPressed: toggle(),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
  );
}