import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/theme/colors.dart';

Widget textField1(TextInputType inputType, String text){
  return SizedBox(
    height: 50,
    child: TextFormField(
      style: const TextStyle(color: Colors.white),
      //controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        filled: true,
        fillColor: blueBackgroundButton,
        labelText: text,
        labelStyle: const TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: white_bordre,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: white_bordre,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      // validator: (txt) => function(),
      //onSubmitted: (txt) => function(controller.text),
    ),
  );

}

Widget textField2(TextInputType inputType, String text){
  return SizedBox(
    height: 50,
    child: TextFormField(
      style: const TextStyle(color: Colors.white),
      //controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: text,
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
            color: primaryColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      // validator: (txt) => function(),
      //onSubmitted: (txt) => function(controller.text),
    ),
  );

}