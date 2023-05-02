import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/languages/translator.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/values/border_styles.dart';
import '../profile_controller.dart';

final ProfileController _controller = Get.find<ProfileController>();

Dialog exitConfirmDialog() {
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
                  'خروج',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const Divider(height: 1),
            SizedBox(height: 30),
            Text('آیا می خواهید خارج شوید؟', style: Get.textTheme.displayLarge!.copyWith(color: black)),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _controller.logout, child: Text('بله', style: Get.textTheme.displayLarge!.copyWith(color: Colors.white)), style: ElevatedButton.styleFrom(backgroundColor: Colors.red)),
                SizedBox(width: 20),
                ElevatedButton(onPressed: Get.back, child: Text('خیر', style: Get.textTheme.displayLarge!.copyWith(color: black)), style: ElevatedButton.styleFrom(backgroundColor: white, elevation: 0))

              ],
            ),
          ],
        ),
      ),
    ),
  );
}
