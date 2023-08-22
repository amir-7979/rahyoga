import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../routes/routes.dart';
import '../../data/models/liked_course.dart';

class MoreController extends GetxController {
  RxString title = ''.obs;
  Function? function;
  final PagingController<int, LikedCourse> pagingController = PagingController(firstPageKey: 1);
  void back() => Get.back();

  @override
  void onInit() {
    title.value = Get.arguments[0];
    function = Get.arguments[1];
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await function!(pageKey);
      if(newItems!.likedCourses == []) {
        pagingController.appendLastPage([]);
        return;
      }
      final isLastPage = newItems.next == null;
      if (isLastPage) {
        pagingController.appendLastPage(newItems.likedCourses??[]);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newItems.likedCourses??[], nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  void gotoBuyCourse(int i) => Get.toNamed(AppRoutes.byuCourseScreen ,arguments: i);

}
