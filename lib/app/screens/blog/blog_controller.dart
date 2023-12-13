import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rahyoga/routes/routes.dart';

import '../../data/models/blog.dart';
import '../../data/models/blogs.dart';
import '../../data/models/movement.dart';
import '../../data/models/movements.dart';
import '../../data/services/content_api_services.dart';

class BlogController extends GetxController {
  final ContentApiService _contentApiService = Get.find<ContentApiService>();
  final PagingController<int, Movement> pagingController1 =
      PagingController(firstPageKey: 1);
  final PagingController<int, Blog> pagingController2 =
      PagingController(firstPageKey: 1);

  Rx<Movements?> movements = Movements().obs;
  Rx<Blogs?> blogs = Blogs().obs;

  Future<Movements?> fetchMovements(int i) async {
    movements.value = await _contentApiService.movements(i);
    update();
    return movements.value;
  }

  Future<Blogs?> fetchBlogs(int i) async {
    blogs.value = await _contentApiService.blogs(i);
    update();
    return blogs.value;
  }

  void gotoArticle(int i, String txt) {
    Get.toNamed(AppRoutes.articleScreen, arguments: [i, txt]);
  }

  Future<void> _fetchPage1(int pageKey) async {
    try {
      final newItems = await fetchMovements(pageKey);
      if (newItems == null || newItems.movements == []) {
        pagingController1.appendLastPage([]);
        return;
      }
      final isLastPage = newItems.next == null;
      if (isLastPage) {
        pagingController1.appendLastPage(newItems.movements ?? []);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController1.appendPage(newItems.movements ?? [], nextPageKey);
      }
    } catch (error) {
      pagingController1.error = error;
    }
    update();
  }

  Future<void> _fetchPage2(int pageKey) async {
    try {
      final newItems = await fetchBlogs(pageKey);
      if (newItems == null || newItems.articles == []) {
        pagingController2.appendLastPage([]);
        return;
      }
      final isLastPage = newItems.next == null;
      if (isLastPage) {
        pagingController2.appendLastPage(newItems.articles ?? []);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController2.appendPage(newItems.articles ?? [], nextPageKey);
      }
    } catch (error) {
      pagingController2.error = error;
    }
    update();
  }

  @override
  void onInit() {
    pagingController1.addPageRequestListener((pageKey) {
      _fetchPage1(pageKey);
    });
    pagingController2.addPageRequestListener((pageKey) {
      _fetchPage2(pageKey);
    });
    super.onInit();
  }
}
