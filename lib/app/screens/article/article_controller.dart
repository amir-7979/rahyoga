import 'package:get/get.dart';
import 'package:rahyoga/app/data/models/article.dart';

import '../../../core/languages/translator.dart';
import '../../data/services/content_api_services.dart';


class ArticleController extends GetxController{
  final ContentApiService _apiService = Get.find<ContentApiService>();

  int? id;
  String? title;
  Rx<Article?> article = Article().obs;
  String save = Translator.save.tr;

  void back()=> Get.back();

  Future<Article?> fetchArticle() async {
    article.value = await _apiService.article(id??1);
    return article.value;
  }

  void addToFavorite() {
  //todo save
  }

  @override
  void onInit() {
    id = Get.arguments[0];
    title = Get.arguments[1];
    super.onInit();
  }
}
