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
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: (screenHeight > 640) ? Padding(
          padding: const EdgeInsetsDirectional.only(top: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  Image.asset(
                    'assets/images/splash/logo.png',
                  ),
                  const SizedBox(height: 15),
                  Text(
                      Translator.app_name.tr,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(color: white),
                  ),
                   const SizedBox(height: 30),
                  Text(
                      Translator.splash_text1.tr,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: splashGray),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                        color: white, strokeWidth: 2, ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    Translator.splash_text2.tr,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: white),
                  ),
                  const SizedBox(height: 40),
                  //SizedBox(width: screenWidth,),
                  SizedBox(
                    width: screenWidth,
                    child: SvgPicture.asset('assets/images/splash/splash_image.svg',
                      fit: BoxFit.fitWidth,
                      width: screenWidth,
                      height: screenWidth *4/5,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),

                ],
              ),
            ],
          ),
        ) : Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                ),
                const SizedBox(height: 20),

                Text(
                  Translator.app_name.tr,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(color: white),
                ),
                const SizedBox(height: 20),

                const CircularProgressIndicator(
                  color: white, strokeWidth: 2, ),
                const SizedBox(height: 20),
                Text(
                  Translator.splash_text2.tr,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
