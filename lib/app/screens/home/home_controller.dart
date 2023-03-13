import 'package:get/get.dart';
import 'package:rahyoga/core/utils/snack_bar.dart';
import '../../../routes/routes.dart';
import '../../data/models/home.dart';
import '../../data/services/content_api_services.dart';
import '../main/main_controller.dart';

class HomeController extends GetxController {
  final ContentApiService _apiService = Get.find<ContentApiService>();
  final MainController homeController = Get.find<MainController>();
  Rx<Home?> home =  Home().obs;
  RxInt sliderIndex = 0.obs;
  RxInt isLoading = 0.obs;

  void setSliderIndex(int i) {
    sliderIndex.value = i;
  }

  void gotoTab(int i){
    homeController.setTab(i);
  }

  void gotoBasketScreen() => Get.toNamed(AppRoutes.basketScreen);

  void gotoCourseInfo(int i) => Get.toNamed(AppRoutes.courseInfoScreen ,arguments: i);
  void gotoMoreScreen() => Get.toNamed(AppRoutes.moreScreen);

  Future<Home?> fetchHome() async {
    home.value = await _apiService.home();
    return home.value;
  }

  Future<void> addItemToBasket(int id) async {
    isLoading.value = id;
    String? response = await _apiService.addItemFromBasket(id.toString());
    if(response=='201') {
      greenSnackBar('دوره به سبد خرید اضافه شد');
    } else {
      redSnackBar(response??'');
    }
    isLoading.value = 0;
    home.refresh();
    update();
  }

  void gotoArticle(int i, String txt){
    Get.toNamed(AppRoutes.articleScreen, arguments: [i, txt]);
  }


  @override
  void onInit() {
    fetchHome();
    super.onInit();
  }

}
