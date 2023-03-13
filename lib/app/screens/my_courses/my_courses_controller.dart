import 'package:get/get.dart';
import 'package:rahyoga/app/data/models/liked_courses.dart';
import '../../../core/utils/snack_bar.dart';
import '../../../routes/routes.dart';
import '../../data/models/paid.dart';
import '../../data/services/content_api_services.dart';

class MyCoursesController extends GetxController {
  final ContentApiService _contentApiService = Get.find<ContentApiService>();
  Rx<LikedCourses?> liked = LikedCourses().obs;
  Rx<Paid?> paid = Paid().obs;
  RxInt isLoading = 0.obs;

  Future<LikedCourses?> fetchliked() async {
    liked.value = await _contentApiService.liked(1);
    return liked.value;
  }
  void gotoCourseInfo(int i) => Get.toNamed(AppRoutes.courseInfoScreen ,arguments: i);

  Future<Paid?> fetchPaid() async {
    paid.value = await _contentApiService.paid(1);
    return paid.value;
  }

  Future<void> addItemToBasket(int id) async {
    isLoading.value = id;
    String? response = await _contentApiService.addItemFromBasket(id.toString());
    if(response=='201') {
      greenSnackBar('دوره به سبد خرید اضافه شد');
    } else {
      redSnackBar(response??'');
    }
    isLoading.value = 0;
    liked.refresh();
    update();
  }
}
