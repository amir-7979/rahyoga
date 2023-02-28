import 'package:get/get.dart';

import '../../../routes/routes.dart';
class HomeController extends GetxController{

RxInt sliderIndex = 0.obs;

void setSliderIndex(int i){
  sliderIndex.value = i;
}
void gotoBasketScreen() => Get.toNamed(AppRoutes.basketScreen);

}
