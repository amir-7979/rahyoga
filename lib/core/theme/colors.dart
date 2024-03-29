import 'package:flutter/material.dart';
import 'package:rahyoga/core/theme/text_theme.dart';

const Color primaryColor = Color(0xFF425C5A);
const Color secondaryColor = Color(0xFF798777);
const Color shimmerGreen = Color(0xFF4D734D);
const Color tertiaryColor = Color(0xFF5E7977);
const Color fourthColor = Color(0xFFEBEEEB);
const Color progressBackgroundColor = Color(0xFFDCE2DC);
const Color fieldColor = Color(0xFF556C6A);
const Color tertiaryColor2 = Color(0xFFF2F5F8);
const Color whiteBorder = Color(0x88FFFFFF);
const Color forgetPasswordColor = Color(0xFFB3BEBD);
const Color grayText2 = Color(0xFFAFB9C5);
const Color textGray = Color(0xFF6E798D);
const Color grayText4 = Color(0xFF424C5C);
const Color black = Color(0xFF2C3544);
const Color splashGray = Color(0xD0D2D2D2);
const Color white = Color(0xFFFFFFFF);
const Color errorText = Color(0xFFFF8282);
const Color errorSnackBar = Color(0xFFB76060);
const Color redError = Color(0xFFF43141);
const Color moreTextColor = Color(0xFFDEE3E7);
const Color sliderDotGray = Color(0xFFC6C8CC);
const Color profilePurple2 = Color(0xFFCDD2FF);
const Color profileGray = Color(0xFF8D99A8);
const Color textGray2 = Color(0xFFC1C9C0);

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
  buttonTheme: ButtonThemeData(
    splashColor: Colors.transparent
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.transparent; // Set to Colors.transparent or any other color as desired
          }
          return null;
        },
      ),

  ),
  ),
  splashColor: Colors.transparent,
  splashFactory: NoSplash.splashFactory,
  shadowColor: Colors.transparent,
    hoverColor: Colors.transparent,
  applyElevationOverlayColor: false
);
