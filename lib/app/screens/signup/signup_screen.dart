import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rahyoga/app/screens/signup/widgets/signup_form.dart';
import '../../../core/theme/colors.dart';
import '../../../core/values/consts.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: ListView(
          children: [
            SignupForm(),
            SizedBox(height: screenHeight - screenWidth - 390 > 0 ? screenHeight - (screenWidth*4/5) - 475 - 53: 1),
            SvgPicture.asset('assets/images/splash_image.svg',
              fit: BoxFit.fitWidth,
              width: screenWidth,
              height: screenWidth *4/5,
              alignment: Alignment.bottomCenter,
            ),
          ],
        ),
      ),
    );
  }
}
