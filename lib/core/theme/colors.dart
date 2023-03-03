import 'package:flutter/material.dart';
import 'package:rahyoga/core/theme/text_theme.dart';


const Color primaryColor = Color(0xFF425C5A);
const Color secondaryColor = Color(0xFF798777);
const Color tertiaryColor = Color(0xFF56706E);
const Color fieldColor = Color(0xFF556C6A);
const Color tertiaryColor2 = Color(0xFFF2F5F8);
const Color whiteBordre = Color(0x88FFFFFF);
const Color forgetPasswordColor = Color(0xFFB3BEBD);
const Color graText = Color(0xFF8E8AA);
const Color grayText2 = Color(0xFFAFB9C5);
const Color textGray = Color(0xFF6E798D);
const Color grayText4 = Color(0xFF424C5C);
const Color black = Color(0xFF2C3544);
const Color splashGray = Color(0xD0D2D2D2);
const Color white = Color(0xFFFFFFFF);
const Color errorText = Color(0xFFFF8282);
const Color redError = Color(0xFFFF0000);
const Color bottomBarGray = Color(0xFFF5F7FA);
const Color moreTextColor = Color(0xFFDEE3E7);
const Color sliderDotGray = Color(0xFFC6C8CC);
const Color favoriteGray2 = Color(0xFFEBF0F4);
const Color profilePurple2 = Color(0xFFCDD2FF);
const Color profileGray = Color(0xFF8D99A8);



final darkThem = ThemeData(
  primaryColor: primaryColor,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    toolbarHeight: 50,
  ),
  textTheme: persianTextTheme,
  bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
  colorScheme: ColorScheme.fromSwatch()
      .copyWith(secondary: Colors.white)
      .copyWith(background: Colors.white),
);
