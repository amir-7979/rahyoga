import 'package:get/get.dart';
import 'package:rahyoga/app/data/models/article.dart';

import '../../../core/languages/translator.dart';
import '../../../core/utils/snack_bar.dart';
import '../../data/services/content_api_services.dart';


class ArticleController extends GetxController{
  final ContentApiService _contentApiService = Get.find<ContentApiService>();

  int? id;
  String? title;
  RxBool isLiked = false.obs;
  Rx<Article?> article = Article().obs;
  String save = Translator.save.tr;

  void back()=> Get.back();

  Future<Article?> fetchArticle() async {
    article.value = await _contentApiService.article(id??1);
    if(article.value != null) isLiked.value = article.value!.liked!;
    update();
    return article.value;
  }

  Future<void> addToFavorite() async {
    print(id);
    String? response = await _contentApiService.likeArticle(
        id.toString(), !article.value!.liked!);
    if (response == '200' || response == '201') {
      article.value!.liked = !article.value!.liked!;
      isLiked.value = article.value!.liked!;
    } else {
      redSnackBar(response ?? 'خطا در ارتباط با سرور');
    }
    update();
  }

  @override
  void onInit() {
    id = Get.arguments[0];
    title = Get.arguments[1];
    fetchArticle();
    super.onInit();
  }
}
