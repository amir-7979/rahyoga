import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rahyoga/app/data/models/liked_course.dart';
import 'package:rahyoga/app/data/models/liked_courses.dart';
import '../../../core/utils/snack_bar.dart';
import '../../../routes/routes.dart';
import '../../data/models/course.dart';
import '../../data/models/paid.dart';
import '../../data/services/content_api_services.dart';

class MyCoursesController extends GetxController {
  final ContentApiService _contentApiService = Get.find<ContentApiService>();
  final PagingController<int, LikedCourse> pagingController1 = PagingController(firstPageKey: 1);
  final PagingController<int, Course> pagingController2 = PagingController(firstPageKey: 1);
  Rx<LikedCourses?> liked = LikedCourses().obs;
  Rx<Paid?> paid = Paid().obs;
  RxInt isLoading = 0.obs;


  void gotoCourseInfo(int i) => Get.toNamed(AppRoutes.courseInfoScreen ,arguments: i);

  void gotoBuyCourse(int i) => Get.toNamed(AppRoutes.byuCourseScreen ,arguments: i);

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

  Future<LikedCourses?> fetchliked(int i) async {
    liked.value = await _contentApiService.getLikedCourse(i);
    return liked.value;
  }

  Future<Paid?> fetchPaid(int i) async {
    print(i);
    paid.value = await _contentApiService.paid(i);
    return paid.value;
  }

  Future<void> _fetchPage1(int pageKey) async {
    try {
      final newItems = await fetchliked(pageKey);
      if(newItems == null || newItems.likedCourses == [] || newItems.likedCourses == null) {
        pagingController1.appendLastPage([]);
        return;
      }
      final isLastPage = newItems.next == null;
      if (isLastPage) {
        pagingController1.appendLastPage(newItems.likedCourses??[]);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController1.appendPage(newItems.likedCourses??[], nextPageKey);
      }
    } catch (error) {
      pagingController1.error = error;
    }
    update();
  }

  Future<void> _fetchPage2(int pageKey) async {
    try {
      final newItems = await fetchPaid(pageKey);
      if(newItems == null || newItems.courses == []) {
        pagingController2.appendLastPage([]);
        return;
      }
      final isLastPage = newItems.courses == [];
      if (isLastPage) {
        pagingController2.appendLastPage(newItems.courses??[]);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController2.appendPage(newItems.courses??[], nextPageKey);
      }
    } catch (error) {
      pagingController2.error = error;
    }
    update();

  }

  Future<void> refreshPage1() async{
    pagingController1.refresh();
  }

  Future<void> refreshPage2() async{
    pagingController2.refresh();
  }

  @override
  void onInit() {
    pagingController1.addPageRequestListener((pageKey) {
      _fetchPage1(pageKey);
    });
    pagingController2.addPageRequestListener((pageKey) {
      _fetchPage2(pageKey);
    });    super.onInit();
  }
}
