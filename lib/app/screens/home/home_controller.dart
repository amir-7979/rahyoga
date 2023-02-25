import 'package:get/get.dart';
class HomeController extends GetxController{

RxInt sliderIndex = 0.obs;

void setSliderIndex(int i){
  sliderIndex.value = i;
}

}
