import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../profile_controller.dart';

final ProfileController _controller = Get.find<ProfileController>();

AlertDialog exitConfirmDialog() {
  return AlertDialog(
    title: Text('آیا می خواهید خارج شوید؟', style: Get.textTheme.displayLarge!.copyWith(color: black)),
    actions: [
      TextButton(
        onPressed: Get.back,
        style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent),),
        child: Text('خیر', style: Get.textTheme.displayLarge!.copyWith(color: black)),
      ),
      TextButton(
        onPressed: _controller.logout,
        style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent),),
        child: Text('بله', style: Get.textTheme.displayLarge!.copyWith(color: black)),
      ),
    ],
  );
}
