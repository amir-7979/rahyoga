import 'package:get/get.dart';
import 'package:rahyoga/routes/routes.dart';
import '../../data/models/blogs.dart';
import '../../data/models/movements.dart';
import '../../data/services/content_api_services.dart';

class BlogController extends GetxController {
  final ContentApiService _contentApiService = Get.find<ContentApiService>();
  Rx<Movements?> movements =  Movements().obs;
  Rx<Blogs?> blogs =  Blogs().obs;

  Future<Movements?> fetchMovements() async {
    movements.value = await _contentApiService.movements(1);
    return movements.value;
  }

  Future<Blogs?> fetchBlogs() async {
    blogs.value = await _contentApiService.blogs(1);
    return blogs.value;
  }

  void gotoArticle(int i, String txt){
    Get.toNamed(AppRoutes.articleScreen, arguments: [i, txt]);
  }

}
