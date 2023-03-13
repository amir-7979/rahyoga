import 'package:get/get.dart';
import 'package:rahyoga/app/data/models/paid_course_info.dart';
import '../../../core/languages/translator.dart';
import '../../data/services/content_api_services.dart';

class CourseInfoController extends GetxController{
  final ContentApiService _contentApiService = Get.find<ContentApiService>();
  Rx<PaidCourseInfo?> course = PaidCourseInfo().obs;
  int? id;
  RxInt preIndex = 0.obs;
  String fullScreen = Translator.fullScreen.tr;
  String courseDetail = Translator.courseDetail.tr;
  String courseTitle = '${Translator.session.tr} ${'اول'} - ${'فلان مطلب'}';
  String more = Translator.more.tr;
  String less = Translator.less.tr;
  String courseSession = Translator.courseSession.tr;
  String next = Translator.nextSession.tr;
  String prev = Translator.prevSession.tr;
  String duration = '${1} ${Translator.hour.tr} ${40} ${Translator.min.tr}';

  @override
  void onInit() {
    id = Get.arguments;
    super.onInit();
  }

  void back()=> Get.back();

  Future<PaidCourseInfo?> fetchCourse() async {
    course.value = await _contentApiService.paidCourse(id??1);
    preIndex.value = course.value!.progress!.seasons.passed!.length+1;
    return course.value;
  }

}
