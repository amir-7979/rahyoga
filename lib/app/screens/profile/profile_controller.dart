
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/colors.dart';
import '../../../routes/routes.dart';
import '../../data/models/profile.dart';
import '../../data/services/content_api_services.dart';
import 'widgets/exit_confirm_dialog.dart';

class ProfileController extends GetxController {
  final ContentApiService _contentApiService = Get.find<ContentApiService>();
  Rx<Profile?> profile = Profile().obs;

  Future<Profile?> fetchProfile() async {
    profile.value = await _contentApiService.profile();
    update();
    return profile.value;
  }

  void minorUpdate() {
    profile.value!.id = null;
    update();
    fetchProfile();
  }

  void gotoBookmark() => Get.toNamed(AppRoutes.bookmarkScreen);

  Future<void> logout() async {
     _contentApiService.logOutUser();
      Get.offAndToNamed(AppRoutes.loginScreen);
  }

  void exit(){
      Get.dialog(exitConfirmDialog());
  }

  @override
  void onInit() {
    fetchProfile();
    super.onInit();
  }
}