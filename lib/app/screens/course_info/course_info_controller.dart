import 'dart:async';
import 'dart:io';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/course_info/widgets/confirm_dialog.dart';
import 'package:rahyoga/app/screens/my_courses/my_courses_controller.dart';
import 'package:video_player/video_player.dart';

import '../../../core/languages/translator.dart';
import '../../data/models/all.dart';
import '../../data/models/download_task.dart';
import '../../data/models/paid_course_info.dart';
import '../../data/services/content_api_services.dart';
import '../../data/services/database_service.dart';
import '../../data/services/video_service.dart';
import '../home/home_controller.dart';
import '../profile/profile_controller.dart';

class CourseInfoController extends GetxController {
  final ContentApiService _contentApiService = Get.find<ContentApiService>();
  final VideoService _videoService = Get.find<VideoService>();
  final DataBaseService db = Get.find<DataBaseService>();
  Rx<PaidCourseInfo?> course = PaidCourseInfo().obs;
  int? id;
  RxInt index = 1.obs;
  RxInt downloadProgress = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isDownloading = false.obs;
  RxBool pressDownloading = false.obs;
  RxBool isExist = false.obs;
  String fullScreen = Translator.fullScreen.tr;
  String courseDetail = Translator.courseDetail.tr;
  String more = Translator.more.tr;
  String less = Translator.less.tr;
  String courseSession = Translator.courseSession.tr;
  String next = Translator.nextSession.tr;
  String prev = Translator.prevSession.tr;
  String duration = '${1} ${Translator.hour.tr} ${40} ${Translator.min.tr}';
  late FlickManager flickManager = FlickManager(
    autoPlay: false,
    videoPlayerController: VideoPlayerController.network('',
        httpHeaders: {'Referer': 'http://open.negavid.com'},
        formatHint: VideoFormat.hls,
        videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true)),
  );
  late Stream<List<DownloadTask>> downloadStream;
  late StreamSubscription<List<DownloadTask>> sub;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    id = Get.arguments;
    fetchCourse(id!);
    downloadStream = _videoService.downloadTasksStream.stream;
    sub = downloadStream.listen((event) => getTask(event));
    isLoading.value = false;
    pressDownloading.value = false;
    update();
    super.onInit();
  }

  void getTask(List<DownloadTask> event) {
    DownloadTask? task;
    try{
    task = event.firstWhereOrNull((task) =>
      task.courseId == id &&
          task.sessionId ==
             course.value!.progress!.seasons.all!.firstWhere((element) => element.order == index.value).id!);
    }catch(err){
      print(err.toString());
    }
    if (task != null) {
      isDownloading.value = true;
      downloadProgress.value = task.progress;
      pressDownloading.value = false;
      update();
      if(task.progress == 100){
        isExist.value = true;
        goToSession(index.value);
      }

    }
  }

  Future<void> download() async {
    if (isDownloading.value == false) {
      pressDownloading.value = true;
      update();
      if(await db.videoExists(course.value!.id, course.value!.progress!.seasons.all!.firstWhere((element) => element.order == index.value).id!)){
        Get.dialog(ConfirmDialog());
      }else{
        String? url = await _contentApiService.getVideoUrl(course.value!.id!,
            course.value!.progress!.seasons.all![index.value - 1].id!);
        if (url != null) {
          pressDownloading.value = false;
          isDownloading.value = true;
          update();
          await _videoService.downloadVideoFile(course.value!.id!,
              course.value!.progress!.seasons.all![index.value - 1].id!,
              url, 0);
          goToSession(index.value);
        }
        isDownloading.value = false;
        update();
      }
    } else {
      isDownloading.value = false;
      pressDownloading.value = false;
      update();
      _videoService.cancelDownload(course.value!.id!, course.value!.progress!.seasons.all![index.value - 1].id!);
    }
    update();
  }

  Future<void> goToSession(int i) async {
    index.value = i;
    downloadProgress.value = 0;
    isDownloading.value = false;
    pressDownloading.value = false;
    isExist.value = await db.videoExists(course.value!.id, course.value!.progress!.seasons.all!.firstWhere((element) => element.order == index.value).id!);
    await initVideoPlayer();
    scrollUp();
    update();

  }

  Future<void> initVideoPlayer() async {
    isExist.value = await db.videoExists(course.value!.id, course.value!.progress!.seasons.all![index.value - 1].id!);
    flickManager.handleChangeVideo(isExist.value
        ? VideoPlayerController.file(File(
            _videoService.appDocumentsPath + '/${course.value!.id}_${ course.value!.progress!.seasons.all![index.value - 1].id!}.mp4'))
        : VideoPlayerController.network(
            course.value!.progress!.seasons.all![index.value - 1].hls ??
                'https://stream.negavid.com/converted/130/16417/fMp9JB3mkPkGS6RKMjIcK6j8x6YwP95YTu30rKoeiEym62k2VFbt0jFcFcv8WWLVb6XcjT.m3u8',
            httpHeaders: {'Referer': 'http://open.negavid.com'},
            formatHint: VideoFormat.hls,
          ));

  }

  Future<void> updateSession() async {
    All session = course.value!.progress!.seasons.all![index.value - 1];
    course.value!.progress!.seasons.all![index.value - 1].passed =
        !session.passed!;
    update();
    var response = await _contentApiService.updateSessionState(
        session.course!, session.id!);
    if (response != null) {
      course.value = response;
    } else {
      course.value!.progress!.seasons.all![index.value - 1].passed =
          session.passed!;
    }
    update();
    Get.find<HomeController>().minorUpdate();
    Get.find<ProfileController>().minorUpdate();
    Get.find<MyCoursesController>().refreshPage2();
  }

  Future<PaidCourseInfo?> fetchCourse(int id) async {
    course.value = await _contentApiService.paidCourse(id);
    goToSession(1);
    return course.value;
  }

  Future<void> deleteVideo()async {
    pressDownloading.value = true;
    update();
    await db.deleteVideo(id, course.value!.progress!.seasons.all![index.value - 1].id!);
    goToSession(index.value);
  }

  void back() => Get.back();

  scrollUp(){
      scrollController.animateTo(
        0.0,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
  }

  @override
  void onClose() {
    flickManager.dispose();
    sub.cancel();
    super.onClose();
  }
}
