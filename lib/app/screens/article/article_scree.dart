import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/data/models/article.dart';
import 'package:rahyoga/app/widgets/cache_image.dart';
import '../../../core/theme/colors.dart';
import '../../../core/values/consts.dart';
import '../../widgets/shimmer_screen.dart';
import 'article_controller.dart';

class ArticleScreen extends GetWidget<ArticleController> {
  ArticleScreen({Key? key}) : super(key: key);
  Article? article;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: white,
          appBar: AppBar(
            leading: BackButton(
              onPressed: controller.back,
              color: black,
            ),
            title: Text(
              controller.title??'',
              style: Get.theme.textTheme.headlineLarge!.copyWith(color: black),
            ),
            actions: [
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 15),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/images/star.svg'),
                    const SizedBox(width: 4),
                    Text(
                      controller.save,
                      style: Get.theme.textTheme.headlineMedium!.copyWith(
                        color: black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: FutureBuilder(
              future: controller.fetchArticle(),
              builder: (context, AsyncSnapshot snapshot) => (snapshot.hasData)
                  ? articleWidget(controller.article.value)
                  : const SimmerScreen())),
    );
  }

  Widget articleWidget(Article? article) {
    return article == null
        ? Container()
        : ListView(
            children: [
              SizedBox(
                height: 200,
                width: screenWidth,
                child: CacheImage(url: article.image ?? ''),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.header ?? '',
                      style: Get.theme.textTheme.bodySmall!
                          .copyWith(color: primaryColor),
                    ),
                    const SizedBox(height: 2),
                    HtmlWidget(
                      article.description??'',
                      textStyle : Get.theme.textTheme.headlineMedium!.copyWith(
                        color: profileGray

                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
