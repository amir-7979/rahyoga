
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/colors.dart';
import '../../../routes/routes.dart';
import '../../data/models/profile.dart';
import '../../data/services/content_api_services.dart';

class ProfileController extends GetxController {
  final ContentApiService _contentApiService = Get.find<ContentApiService>();
  Rx<Profile?> profile = Profile().obs;

  Future<Profile?> fetchProfile() async {
    profile.value = await _contentApiService.profile();
    return profile.value;
  }

  Future<void> logout() async {
     _contentApiService.logOutUser();
      Get.offAndToNamed(AppRoutes.loginScreen);
  }

}