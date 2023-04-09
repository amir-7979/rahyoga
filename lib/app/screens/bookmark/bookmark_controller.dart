import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../routes/routes.dart';
import '../../data/models/blogs.dart';
import '../../data/models/like_blog.dart';
import '../../data/models/liked_blogs.dart';
import '../../data/services/content_api_services.dart';

class BookmarkController extends GetxController {
  final ContentApiService _contentApiService = Get.find<ContentApiService>();
  final PagingController<int, LikedBlog> pagingController = PagingController(firstPageKey: 1);

  Rx<LikedBlogs> blogs =  LikedBlogs().obs;


  Future<LikedBlogs> fetchBlogs(int i) async {
    blogs.value = await _contentApiService.getLikedArticles(i);
    print(blogs.value.count);
    update();
    return blogs.value;
  }

  void gotoArticle(int i, String txt){
    Get.toNamed(AppRoutes.articleScreen, arguments: [i, txt]);
  }


  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await fetchBlogs(pageKey);
      if(newItems == null || newItems.likedArticles == []) {
        pagingController.appendLastPage([]);
        return;
      }
      final isLastPage = newItems.next == null;
      if (isLastPage) {
        pagingController.appendLastPage(newItems.likedArticles??[]);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newItems.likedArticles??[], nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
    update();

  }
  void back() => Get.back();

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

}
