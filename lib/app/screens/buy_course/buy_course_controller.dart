import 'package:get/get.dart';
import '../../../core/languages/translator.dart';

class BuyCourseController extends GetxController{

  String courseDetail = Translator.courseDetail.tr;
  String save = Translator.save.tr;
  String buyCourse = Translator.buyCourse.tr;
  String courseName = Translator.courseName.tr;
  String cost = Translator.cost.tr;
  String more = Translator.more.tr;
  String less = Translator.less.tr;
  String toman2 = Translator.toman2.tr;
  String courseSession = Translator.courseSession.tr;
  String session2 = Translator.session2.trParams({'number':'2'});
  String mentor = '${Translator.mentor.tr} ${Translator.course.tr}';
  String title = '${Translator.session.tr} ${'اول'} - ${'موضوع جلسه'}';
  String duration = '${1} ${Translator.hour.tr} ${40} ${Translator.min.tr}';

  void back()=> Get.back();
  void addToBasket(){}
  void addToFavorite(){}

}
