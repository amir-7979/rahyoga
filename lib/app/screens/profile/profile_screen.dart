import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/languages/translator.dart';
import '../../../core/theme/colors.dart';
import '../../data/models/profile.dart';
import '../../widgets/shimmer_screen.dart';
import 'profile_controller.dart';
import 'widgets/info_widget.dart';
import 'widgets/profile_widget.dart';

class ProfileScreen extends GetView<ProfileController> {
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
          /*actions: [
            TextButton(
              onPressed: (){
                controller.fetchProfile();
              },
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/profile/edit.svg'),
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
              ),
            )
          ]*/),
      body: GetBuilder<ProfileController>(
          init: controller,
          builder: (context) => controller.profile.value!.id == null
              ? const SimmerScreen()
              : profile(controller.profile.value!))
    );
  }
  Widget profile(Profile profile){
    return ListView(
      padding: const EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
      children: [
        ProfileWidget(profile),
       /* Wallet(profile!),*/
        SizedBox(height: 15),
        InfoWidget(profile),
        const SizedBox(height: 30),

      ],
    );
  }
}
