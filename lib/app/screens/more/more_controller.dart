import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../core/utils/snack_bar.dart';
import '../../data/models/liked_course.dart';
import '../../data/services/content_api_services.dart';

class MoreController extends GetxController {
  final ContentApiService _apiService = Get.find<ContentApiService>();
  RxInt isLoading = 0.obs;
  final PagingController<int, LikedCourse> pagingController = PagingController(firstPageKey: 1);
  void back() => Get.back();

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  Future<void> addItemToBasket(int id) async {
    isLoading.value = id;
    String? response = await _apiService.addItemFromBasket(id.toString());
    if(response=='201') {
      greenSnackBar('دوره به سبد خرید اضافه شد');
    } else {
      redSnackBar(response??'');
    }
    isLoading.value = 0;
    update();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await _apiService.getCourses(pageKey);
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
}
