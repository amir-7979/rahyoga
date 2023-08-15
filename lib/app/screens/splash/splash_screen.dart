import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/splash/splash_controller.dart';
import 'package:rahyoga/core/languages/translator.dart';
import 'package:rahyoga/core/theme/colors.dart';
import '../../../core/values/consts.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final SplashController _ctrl = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int rnd = random.nextInt(5) + 1;
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/images/splash/$rnd.jpg',fit: BoxFit.cover),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                SvgPicture.asset('assets/images/splash/logo.svg'),
                const SizedBox(height: 15),
                Text(
                  Translator.app_name.tr,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: white),
                ),
                const SizedBox(height: 35),
                const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: white,
                    strokeWidth: 2,
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  Translator.splash_text2.tr,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
