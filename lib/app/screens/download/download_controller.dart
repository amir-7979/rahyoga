import 'package:get/get.dart';

import '../../../core/languages/translator.dart';
import '../../../routes/routes.dart';
import '../../data/services/video_service.dart';

class DownloadController extends GetxController {
  final VideoService movieService = Get.find<VideoService>();

  RxList<Map<String, dynamic>> movies = <Map<String, dynamic>>[].obs;
  RxInt isLoading = 0.obs;
  String downloaded = Translator.downloaded.tr;

  Future<void> deleteVideoFile(course, session) async {
    //await movieService.deleteVideoFile(course, session);
    update();
  }

  Future<List<Map<String, dynamic>>> fetchHome() async {
     movies.value = await movieService.getAllVideo();
    update();
    return movies;
  }

  void gotoCourseInfo(int i) => Get.toNamed(AppRoutes.courseInfoScreen, arguments: i);

  void back() => Get.back();

  @override
  void onInit() {
    fetchHome();
    super.onInit();
  }
}
