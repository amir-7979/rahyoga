import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/buy_course/buy_course_controller.dart';
import 'package:rahyoga/app/screens/buy_course/buy_course_screen.dart';
import 'package:rahyoga/app/screens/login/login_screen.dart';
import 'package:rahyoga/app/screens/signup/signup_screen.dart';
import 'package:rahyoga/app/screens/splash/splash_screen.dart';
import 'package:rahyoga/core/theme/colors.dart';
import 'package:rahyoga/routes/pages.dart';

import 'app/screens/splash/splash_binding.dart';
import 'app/screens/splash/splash_controller.dart';
import 'core/languages/translator.dart';
import 'core/theme/text_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<SplashController>(
          () => SplashController(),
    );

    return GetMaterialApp(
      initialBinding: SplashBinding(),
      title: 'RahYoga',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ], // set this property
      locale: const Locale('fa', 'IR'),
      //locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      translations: Translator(),
      theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(toolbarHeight: 60, color: white, titleTextStyle: Theme.of(context).textTheme.headlineLarge!.copyWith(color: black, fontWeight: FontWeight.w700, fontSize: 18), elevation: 1),
        textTheme: persianTextTheme
      ),
      getPages: AppPages.pages,
      //home: RecoveryPasswordScreen(),
      //home: SplashScreen(),
      home: SplashScreen(),

    );
  }
}
