import 'package:chewie/chewie.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/data/models/paid_course_info.dart';
import 'package:rahyoga/app/screens/home/home_controller.dart';
import 'package:rahyoga/app/screens/main/main_controller.dart';
import 'package:rahyoga/app/screens/profile/profile_controller.dart';
import '../../../core/languages/translator.dart';
import '../../data/models/all.dart';
import '../../data/services/content_api_services.dart';
import 'package:video_player/video_player.dart';

class CourseInfoController extends GetxController {
  final ContentApiService _contentApiService = Get.find<ContentApiService>();
  Rx<PaidCourseInfo?> course = PaidCourseInfo().obs;
  int? id;
  RxInt index = 1.obs;
  RxBool isLoading = false.obs;
  String fullScreen = Translator.fullScreen.tr;
  String courseDetail = Translator.courseDetail.tr;
  String more = Translator.more.tr;
  String less = Translator.less.tr;
  String courseSession = Translator.courseSession.tr;
  String next = Translator.nextSession.tr;
  String prev = Translator.prevSession.tr;
  String duration = '${1} ${Translator.hour.tr} ${40} ${Translator.min.tr}';
  late final FlickManager flickManager;



  @override
  void onInit() {
    id = Get.arguments;
    fetchCourse(id!);
    flickManager = FlickManager(
      videoPlayerController:
      VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
      autoPlay: false,
    );
    super.onInit();
  }

  void back() => Get.back();

  void goToSession(int i) {
    index.value = i;
    update();
  }

  Future<void> updateSession() async {
    All session = course.value!.progress!.seasons.all![index.value - 1];
    course.value!.progress!.seasons.all![index.value - 1].passed = !session.passed!;
    update();
    var response = await _contentApiService.updateSessionState(
        session.course!, session.id!);
    if (response != null) {
      course.value = response;
    } else {
      print('null');
      course.value!.progress!.seasons.all![index.value - 1].passed = session.passed!;
    }
    update();
    Get.find<HomeController>().minorUpdate();
    Get.find<ProfileController>().minorUpdate();

  }

  Future<PaidCourseInfo?> fetchCourse(int id) async {
    course.value = await _contentApiService.paidCourse(id);
    isLoading.value = false;
    update();
    return course.value;
  }

  void dispose() {
    flickManager.dispose();
    super.dispose();
  }
}