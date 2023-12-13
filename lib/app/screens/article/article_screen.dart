import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import '../../../core/theme/colors.dart';
import '../../data/models/article.dart';
import '../../widgets/shimmer_screen.dart';
import 'article_controller.dart';

class ArticleScreen extends GetWidget<ArticleController> {
  ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          elevation: 0.5,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.black,
          leading: BackButton(
            onPressed: controller.back,
            color: black,
          ),
          title: Text(
            controller.title ?? '',
            style: Get.theme.textTheme.headlineLarge!.copyWith(color: black),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 15),
              child: InkWell(
                onTap: () => controller.addToFavorite(),
                child: Row(
                  children: [
                    Obx(() => SvgPicture.asset(controller.isLiked.value == true
                        ? 'assets/images/filled_star.svg'
                        : 'assets/images/star.svg')),
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
            ),
          ],
        ),
        body: GetBuilder<ArticleController>(
            init: controller,
            builder: (context) => controller.article.value!.id == null
                ? const SimmerScreen()
                : articleWidget(controller.article.value!)),
      ),
    );
  }

  Widget articleWidget(Article article) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(25, 20, 25, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  article.header ?? '',
                  style: Get.theme.textTheme.headlineLarge!
                      .copyWith(color: primaryColor),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 20, 0, 0),
                child: HtmlWidget(
                  '''
      <div style="text-align: justify;">
        ${article.description}
      </div>
    ''',
                  textStyle: Get.theme.textTheme.bodyMedium!.copyWith(
                    color: profileGray,
                    height: 1.2,
                  ),
                ),
                /*Html(
                  data: "${article.description}"
                )*/
              ),
            ],
          ),
        ),
      ],
    );
  }
}
