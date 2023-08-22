import 'package:flutter/material.dart';
import 'package:rahyoga/app/screens/signup/widgets/signup_form.dart';

import '../../../core/theme/colors.dart';

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
          ],
        ),
      ),
    );
  }
}
