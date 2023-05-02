import 'package:get/get.dart';
import 'package:rahyoga/app/screens/my_courses/my_courses_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../core/languages/translator.dart';
import '../../../core/utils/snack_bar.dart';
import '../../data/models/buy_course_info.dart';
import '../../data/services/content_api_services.dart';

class BuyCourseController extends GetxController {
  final ContentApiService _contentApiService = Get.find<ContentApiService>();
  WebViewController? videoPlayerController;
  Rx<BuyCourseInfo?> course = BuyCourseInfo().obs;
  late int id;
  RxBool isLoading = false.obs;
  RxBool isLiked = false.obs;
  String courseDetail = Translator.courseDetail.tr;
  String save = Translator.save.tr;
  String buyCourse = Translator.buyCourse.tr;
  String courseName = Translator.courseName.tr;
  String cost = Translator.cost.tr;
  String more = Translator.more.tr;
  String less = Translator.less.tr;
  String toman2 = Translator.toman2.tr;
  String courseSession = Translator.courseSession.tr;
  String mentor = '${Translator.mentor.tr} ${Translator.course.tr}';
  String title = '${Translator.session.tr} ${'اول'} - ${'موضوع جلسه'}';

  @override
  void onInit() {
    id = Get.arguments;
    fetchCourse();
    super.onInit();
  }

  void back() => Get.back();

  Future<BuyCourseInfo?> fetchCourse() async {
    course.value = await _contentApiService.buyCourse(id);
    isLiked.value = course.value!.liked!;
    update();
    return course.value;
  }

  Future<void> addToFavorite() async {
    isLiked.value = !course.value!.liked!;
    update();
    String? response = await _contentApiService.likeCourse(
        id.toString(), !course.value!.liked!);

    if (response == '200' || response == '201') {
      course.value!.liked = !course.value!.liked!;
      isLiked.value = course.value!.liked!;
      Get.find<MyCoursesController>().refreshPage1();
    } else {
      isLiked.value = course.value!.liked!;
      redSnackBar(response ?? 'خطا در ارتباط با سرور');
    }
    update();
  }

  Future<void> addItemToBasket(int id) async {
    isLoading.value = true;
    String? response =
        await _contentApiService.addItemFromBasket(id.toString());
    if (response == '201') {
      greenSnackBar('دوره به سبد خرید اضافه شد');
    } else {
      redSnackBar(response ?? '');
    }
    isLoading.value = false;
    update();
  }



}
