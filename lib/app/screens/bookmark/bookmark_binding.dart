import 'package:get/get.dart';
import 'package:rahyoga/app/screens/bookmark/bookmark_controller.dart';


class BookmarkBinding implements Bindings {
  @override
  void dependencies() => Get.lazyPut<BookmarkController>(() =>BookmarkController());
}