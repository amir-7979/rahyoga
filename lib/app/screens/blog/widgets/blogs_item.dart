import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/blog/blog_controller.dart';
import 'package:rahyoga/core/theme/colors.dart';

import '../../../../core/values/consts.dart';
import '../../../data/models/blog.dart';
import '../../../widgets/cache_image.dart';

class BlogItem extends StatelessWidget {
  BlogItem(this.blog, {Key? key}) : super(key: key);
  BlogController controller = Get.find<BlogController>();

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: yogaMovementHeight,
      width: screenWidth,
      child: InkWell(
        onTap: () {
          controller.gotoArticle(blog.id??1, 'مقاله');
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CacheImage(url: blog.image??''),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 5, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      blog.header??'',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(
                              color: primaryColor,
                              overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      blog.subject??'',
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: black, overflow: TextOverflow.ellipsis),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [Icon(Icons.keyboard_arrow_left)],
              ),
            )
          ],
        ),
      ),
    );
  }
}
