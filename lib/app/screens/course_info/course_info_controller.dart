import 'package:flick_video_player/flick_video_player.dart';
import 'package:get/get.dart';
import '../../../core/languages/translator.dart';
import '../../data/models/all.dart';
import '../../data/models/paid_course_info.dart';
import '../../data/services/content_api_services.dart';
import 'package:video_player/video_player.dart';
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
  RxString link = ''.obs;
  RxInt downloadProgress = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isPaused = true.obs;
  RxBool isDownloading = false.obs;
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
    videoPlayerController: VideoPlayerController.network(
        '' ,httpHeaders: {'Referer': 'http://open.negavid.com'},
        formatHint: VideoFormat.hls,
        videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true)
    ),
  );


  @override
  void onInit() {
    id = Get.arguments;
    fetchCourse(id!);
    isLoading.value = false;
    update();
    super.onInit();
  }

  void back() => Get.back();

  Future<void> goToSession(int i) async {
    index.value = i;
      flickManager.handleChangeVideo(VideoPlayerController.network(
          course.value!.progress!.seasons.all![i].hls??'' ,httpHeaders: {'Referer': 'http://open.negavid.com'},
          formatHint: VideoFormat.hls,
      ),
      );

    update();
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
      print('null');
      course.value!.progress!.seasons.all![index.value - 1].passed =
          session.passed!;
    }
    update();
    Get.find<HomeController>().minorUpdate();
    Get.find<ProfileController>().minorUpdate();
  }

  Future<PaidCourseInfo?> fetchCourse(int id) async {
    course.value = await _contentApiService.paidCourse(id);
    goToSession(1);
    update();
    return course.value;
  }

  Future<void> download() async {
    if(isDownloading.value == false) {
      isDownloading.value = true;
      isPaused.value = false;
      await _videoService.downloadVideoFile('amir', 4, 4,
          'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_10MB.mp4', (
              progress) {
            downloadProgress.value = progress;
          });
      isDownloading.value = false;
    }
    else{
      //playPause();
    }
  }

  @override
  void onClose() {
    flickManager.dispose();
    super.onClose();
  }

}
