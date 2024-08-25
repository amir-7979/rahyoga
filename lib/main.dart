import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:media_kit/media_kit.dart';
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
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
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
      statusBarColor: Colors.white
          .withAlpha(10),
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
      ],
      // set this property
      locale: const Locale('fa', 'IR'),
      
      fallbackLocale: const Locale('en', 'US'),
      translations: Translator(),
      theme: ThemeData(
          brightness: Brightness.light,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            toolbarHeight: 60,
            color: white,
            titleTextStyle: Get.textTheme.headlineLarge!.copyWith(
                color: black, fontWeight: FontWeight.w700, fontSize: 18),
            elevation: 0.5,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.black,
            ),
          ),
          textSelectionTheme: TextSelectionThemeData(
              cursorColor: Colors.white,
                  selectionColor: Colors.white,
              selectionHandleColor: Colors.blueAccent,
          ),
          textTheme: persianTextTheme,
          buttonTheme: ButtonThemeData(splashColor: Colors.transparent),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors
                        .transparent; // Set to Colors.transparent or any other color as desired
                  }
                  return null;
                },
              ),
              splashFactory: NoSplash.splashFactory,
              shadowColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors
                        .transparent; // Set to Colors.transparent or any other color as desired
                  }
                  return null;
                },
              ),
              surfaceTintColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.transparent; // Set to Colors.transparent or any other color as desired
                  }
                  return null;
                },
              ),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors
                        .transparent; // Set to Colors.transparent or any other color as desired
                  }
                  return null;
                },
              ),
              splashFactory: NoSplash.splashFactory,
              shadowColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors
                        .transparent; // Set to Colors.transparent or any other color as desired
                  }
                  return null;
                },
              ),
              surfaceTintColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.transparent; // Set to Colors.transparent or any other color as desired
                  }
                  return null;
                },
              ),
            ),
          ),
          dividerColor: tertiaryColor2,
          splashFactory: NoSplash.splashFactory,
          shadowColor: Colors.transparent,
          applyElevationOverlayColor: false),
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
