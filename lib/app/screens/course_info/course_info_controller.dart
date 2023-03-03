import 'package:get/get.dart';
import '../../../core/languages/translator.dart';

class CourseInfoController extends GetxController{

  String fullScreen = Translator.fullScreen.tr;
  String courseDetail = Translator.courseDetail.tr;
  String courseTitle = '${Translator.session.tr} ${'اول'} - ${'فلان مطلب'}';
  String more = Translator.more.tr;
  String less = Translator.less.tr;
  String courseSession = Translator.courseSession.tr;
  String next = Translator.nextSession.tr;
  String prev = Translator.prevSession.tr;
  String duration = '${1} ${Translator.hour.tr} ${40} ${Translator.min.tr}';



  void back()=> Get.back();
  void addToBasket(){}
  void addToFavorite(){}

}
