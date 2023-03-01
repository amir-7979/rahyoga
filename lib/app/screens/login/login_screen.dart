import 'package:flutter/material.dart';
import 'package:rahyoga/app/screens/login/widgets/login_form.dart';
import '../../../core/theme/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: ListView(
          children: [
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
