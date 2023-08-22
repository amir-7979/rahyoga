
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/data/services/storage_service.dart';
import 'package:rahyoga/app/data/services/video_service.dart';
import 'package:rahyoga/app/screens/splash/splash_screen.dart';
import 'package:rahyoga/core/theme/colors.dart';
import 'package:rahyoga/routes/pages.dart';

import 'app/data/models/client.dart';
import 'app/data/services/content_api_services.dart';
import 'app/data/services/database_service.dart';
import 'app/data/services/user_api_service.dart';
import 'app/screens/splash/splash_binding.dart';
import 'app/screens/splash/splash_controller.dart';
import 'core/languages/translator.dart';
import 'core/theme/text_theme.dart';
import 'core/utils/scroll_behavior.dart';

Future<void> main() async {
  await initServices();
  runApp(const MyApp());
}

initServices() async {
  await Get.putAsync<StorageService>(() async => StorageService());
  await Get.putAsync<Client>(() async => Client());
  await Get.putAsync<UserApiService>(() async => UserApiService());
  await Get.putAsync<ContentApiService>(() async => ContentApiService());
  await Get.putAsync<DataBaseService>(() async => DataBaseService());
  await Get.putAsync<VideoService>(() async => VideoService());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white70, // Replace with your desired status bar color
    ));
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
      fallbackLocale: const Locale('en', 'US'),
      translations: Translator(),
      theme: ThemeData(
          brightness: Brightness.light,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(toolbarHeight: 60, color: white, titleTextStyle: Theme.of(context).textTheme.headlineLarge!.copyWith(color: black, fontWeight: FontWeight.w700, fontSize: 18), elevation: 0.5),
        textTheme: persianTextTheme
      ),
      getPages: AppPages.pages,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child ?? Container(),
        );
      },
      home: SplashScreen(),
    );
  }
}
