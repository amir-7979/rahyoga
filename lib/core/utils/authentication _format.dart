import 'package:flutter/material.dart';
import 'package:get/get.dart';

String? checkUsernameLogin(String txt) {
  if (txt.isEmpty) return 'Please enter username';
  if (txt.length < 4) return "Username length must be more than 3";
  if (txt.contains(' ')) return "Allowing all character except 'whitespace'";
  if (txt.contains('-')) return "' - ' not allowed";
  //check for email pattern
  return null;
}

String? checkUsernameSignUp(String txt) {
  if (txt.isEmpty) return 'Please enter username';
  if (txt.length < 4) return "Username length must be more than 3";
  if (txt.contains(' ')) return "Allowing all character except 'whitespace'";
  if (txt.contains('-')) return "' - ' not allowed";
  if (txt.isEmail) return 'cant use email format';

  //check for email pattern
  return null;
}

String? checkPasswordSignUp(String txt1, String txt2) {
  if (txt1.isEmpty) return 'Please enter password';
  if (!txt1.contains(RegExp(r'[0-9]'))) return "Password must contain a number";
  if (txt1.length < 6) return "Password length must be more than 5";
  if (txt1 != txt2) return "Passwords Don't Match";
  if (txt1.contains(' ')) return "Allowing all character except 'whitespace'";
  return null;
}

String? checkEmail(String txt) {
  if (txt.isEmpty) return 'Please enter email';
  if (!txt.isEmail) return 'Please enter valid email';
  return null;
}

String? checkPhoneNumberSignUp(String txt) {
  if (txt.isEmpty) return 'Please enter phone number';
  if (!txt.isPhoneNumber) return 'Please enter valid phone number';
  return null;
}

String? checkPasswordLogin(String txt1) {
  if (txt1.isEmpty) return 'Please enter password';
  if (!txt1.contains(RegExp(r'[0-9]'))) return "Password Must Contain A Number";
  if (txt1.length < 6) return "Password Length Must Be More Than 5";
  if (txt1.contains(' ')) return "Allowing all character except 'whitespace'";
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