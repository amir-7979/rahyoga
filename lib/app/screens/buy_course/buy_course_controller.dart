import 'package:get/get.dart';
import '../../../core/languages/translator.dart';
import '../../../routes/routes.dart';

class BuyCourseController extends GetxController{

  String courseDetail = Translator.courseDetail.tr;
  String save = Translator.save.tr;
  String buyCourse = Translator.buyCourse.tr;
  String courseName = Translator.courseName.tr;
  String cost = Translator.cost.tr;
  String toman2 = Translator.toman2.tr;

  void back()=> Get.back();
  void addToBasket(){}
  void addToFavorite(){}

}
