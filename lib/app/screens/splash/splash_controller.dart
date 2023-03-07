import 'package:get/get.dart';
import 'package:rahyoga/app/data/services/storage_service.dart';
import '../../../core/values/consts.dart';
import '../../../routes/routes.dart';
import '../../data/services/user_api_service.dart';

class SplashController extends GetxController {
  StorageService storageService = Get.find<StorageService>();
  UserApiService userService = Get.find<UserApiService>();
  Future<void> navigateToNextScreen() async {
    await Future.delayed(waitTime);
    if (await storageService.containsKey('access')){
       String access = await storageService.readData('access')??'';
      userService.getToken(access);
      Get.offAndToNamed(AppRoutes.homeScreen);
    }else{
      Get.offAndToNamed(AppRoutes.loginScreen);

    }
    //todo init function
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await navigateToNextScreen();
  }
}