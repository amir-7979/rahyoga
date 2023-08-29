import 'dart:math';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rahyoga/app/data/services/storage_service.dart';
import '../../../core/values/consts.dart';
import '../../../routes/routes.dart';
import '../../data/models/client.dart';
import '../../data/services/user_api_service.dart';

class SplashController extends GetxController {
  StorageService storageService = Get.find<StorageService>();
  UserApiService userService = Get.find<UserApiService>();
  final Client _client = Get.find<Client>();
  Random random = Random();

  Future<void> navigateToNextScreen() async {
    final result2 = await Future.sync(() async {
      if(await storageService.containsKey('refresh')) {
        _client.readClientInfo();
        userService.refreshToken();
        return true;
      } else {
        return false;
      }
    });
    final result1 = await Future.sync(() => Future.delayed(waitTime));
    result2
        ? Get.offAndToNamed(AppRoutes.mainScreen)
        : Get.offAndToNamed(AppRoutes.loginScreen);
  }

  int getRandomInt(){
    return random.nextInt(5) + 1;
  }

  @override
  Future<void> onInit() async {
    appDirectory = await getApplicationDocumentsDirectory();

    await navigateToNextScreen();
    super.onInit();
  }
}
