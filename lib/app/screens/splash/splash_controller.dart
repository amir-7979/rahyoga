import 'package:get/get.dart';
import '../../../routes/routes.dart';

class SplashController extends GetxController {

  Future<void> navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    //todo login or home page
    //todo init function
    Get.offAndToNamed(AppRoutes.loginScreen);
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await navigateToNextScreen();
  }
}