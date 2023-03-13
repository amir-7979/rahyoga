import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/colors.dart';

greenSnackBar(String txt){
  Get.snackbar(
      '',
      txt,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: secondaryColor,
      colorText: white,
      padding:  EdgeInsets.only(bottom: 25),
      borderRadius: 15,
      duration: const Duration(seconds: 2),
      icon: IconButton(onPressed: (){Get.closeCurrentSnackbar();}, icon: const Icon(Icons.close)),
      animationDuration: const Duration(milliseconds: 500,),
      isDismissible: true,
      margin: const EdgeInsets.fromLTRB(10, 0, 20, 10)
  );
}
redSnackBar(String txt){
  Get.snackbar(
      '',
      txt,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: redError,
      colorText: white,
    padding:  EdgeInsets.only(bottom: 25),
      borderRadius: 15,
      duration: const Duration(seconds: 2),
      icon: IconButton(onPressed: (){Get.closeCurrentSnackbar();}, icon: const Icon(Icons.close)),
      animationDuration: const Duration(milliseconds: 500,),
      isDismissible: true,
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),

  );
}