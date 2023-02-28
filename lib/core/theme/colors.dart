import 'package:flutter/material.dart';
import 'package:rahyoga/core/theme/text_theme.dart';

const Color primaryColor = Color(0xFF798777);
const Color blueBackgroundButton = Color(0xFF6A77FB);
const Color blue_text2 = Color(0xFF3C49C5);
const Color white_bordre = Color(0x88FFFFFF);
const Color forget_password_color = Color(0xFFB4BBFC);
const Color greenButtonColor = Color(0xFF425C5A);
const Color gray_text = Color(0xFF8E8AA);
const Color grayText2 = Color(0xFFAFB9C5);
const Color grayText3 = Color(0xFF6E798D);
const Color textGray = Color(0xFF6E798D);
const Color black = Color(0xFF2C3544);
const Color splashGray = Color(0xD0D2D2D2);
const Color white = Color(0xFFFFFFFF);
const Color loginGray = Color(0xD0B4BBFC);
const Color redError = Color(0xD0FF0000);
const Color lastItemGray = Color(0xFFF5F7FA);
const Color generalItemBorderGray = Color(0xFFDEE3E7);
const Color sliderDotGray = Color(0xFFC6C8CC);
const Color tabBackground = Color(0xFFEBEEEB);
const Color favoriteGray = Color(0xFF2C3544);
const Color bottomBarGray = Color(0xFFF5F7FA);
const Color favoriteGray2 = Color(0xFFEBF0F4);
const Color profilePurple = Color(0xFFEBEEEB);
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
