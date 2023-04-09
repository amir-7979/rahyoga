import 'package:get/get.dart';
import 'package:rahyoga/app/data/models/paid_course_info.dart';
import '../../../core/languages/translator.dart';
import '../../data/services/content_api_services.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';


class CourseInfoController extends GetxController{
  final ContentApiService _contentApiService = Get.find<ContentApiService>();
  Rx<PaidCourseInfo?> course = PaidCourseInfo().obs;
  VideoPlayerController? _videoPlayerController;
  ChewieController? chewieController;
  int? id;
  RxInt index = 0.obs;
  RxBool isLoading = false.obs;
  RxInt preIndex = 0.obs;
  String fullScreen = Translator.fullScreen.tr;
  String courseDetail = Translator.courseDetail.tr;
  String more = Translator.more.tr;
  String less = Translator.less.tr;
  String courseSession = Translator.courseSession.tr;
  String next = Translator.nextSession.tr;
  String prev = Translator.prevSession.tr;
  String duration = '${1} ${Translator.hour.tr} ${40} ${Translator.min.tr}';

  @override
  void onInit() {
    print('here');
    id = Get.arguments;
    fetchCourse(id!);
    super.onInit();
  }

  void back()=> Get.back();

  void goToSession(int i){
    index.value = i;
    update();
  }

  Future<PaidCourseInfo?> fetchCourse(int id) async {
    course.value = await _contentApiService.paidCourse(5);
    preIndex.value = course.value!.progress!.seasons.passed!.length+1;
    isLoading.value = false;
    update();
    /*if(course.value!.preview != null) _videoPlayerController = await VideoPlayerController.network(course.value!.preview!);
    if(course.value!.preview != null)  chewieController = ChewieController(
      videoPlayerController: _videoPlayerController!,
      autoPlay: false,
      looping: false,
      allowFullScreen: false,
      allowMuting: true,
      hideControlsTimer: const Duration(seconds: 4),
    );*/
    update();
    return course.value;
  }

  @override
  InternalFinalCallback<void> get onDelete {
    if(course.value!.preview != null) _videoPlayerController!.dispose();
    if(course.value!.preview != null) chewieController!.dispose();
    return super.onDelete;
  }

  @override
  void onClose() {
    if(course.value!.preview != null) _videoPlayerController!.dispose();
    if(course.value!.preview != null) chewieController!.dispose();
    super.onClose();
  }
}
