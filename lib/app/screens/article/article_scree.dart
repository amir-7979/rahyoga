import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/widgets/cache_image.dart';

import '../../../core/theme/colors.dart';
import '../../../core/values/consts.dart';
import 'article_controller.dart';

class ArticleScreen extends StatelessWidget {
  ArticleScreen({Key? key}) : super(key: key);
  final ArticleController _ctrl = Get.find<ArticleController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          leading: BackButton(
            onPressed: _ctrl.back,
            color: black,
          ),
          title: Text(
            _ctrl.title,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: black),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 15),
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/star.svg'),
                  const SizedBox(width: 4),
                  Text(
                    _ctrl.save,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: black,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 200,
              width: screenWidth,
              child: CacheImage(
                  url:
                      'https://i0.wp.com/www.yogabasics.com/yogabasics2017/wp-content/uploads/2021/03/Ashtanga-Yoga.jpeg'),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                  'عنوان کامل مقاله',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: primaryColor),
                ),
                const SizedBox(height: 2),
                /*Html(
                  data: _ctrl.htmlData,
                ),*/
              ],),
            ),

          ],
        ),
      ),
    );
  }
}
