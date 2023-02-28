import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/profile/widgets/info_widget.dart';
import 'package:rahyoga/app/screens/profile/widgets/profile_widget.dart';
import 'package:rahyoga/app/screens/profile/widgets/wallet.dart';
import 'package:rahyoga/core/theme/colors.dart';

import '../../../core/languages/translator.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
          title: Text(
            Translator.profile.tr,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: black),
          ),
          actions: [
            Row(
              children: [
                SvgPicture.asset('assets/images/edit.svg'),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(6, 0, 15, 0),
                  child: Text(
                    Translator.edit.tr,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: primaryColor),
                  ),
                ),
              ],
            )
          ]),
      body: ListView(
        padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
        children: [
          ProfileWidget(),
          Wallet(),
          InfoWidget(),
          SizedBox(height: 15),

        ],
      ),
    );
  }
}
